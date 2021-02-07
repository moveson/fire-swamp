# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Message, type: :model do
  subject { create(:message) }

  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:content) }

  describe ".newer_than" do
    let!(:message_1) { create(:message, created_at: 2.days.ago) }
    let!(:message_2) { create(:message, created_at: 1.hour.ago) }
    let(:messages) { described_class.newer_than(duration) }
    let(:duration) { 1.day }
    context "when some messages are within the given duration" do
      it "returns only those messages" do
        expect(messages).not_to include(message_1)
        expect(messages).to include(message_2)
      end
    end

    context "when all messages are within the given duration" do
      let(:duration) { 3.days }
      it "returns all messages" do
        expect(messages).to include(message_1)
        expect(messages).to include(message_2)
      end
    end

    context "when no messages are within the given duration" do
      let(:duration) { 1.minute }
      it "returns no messages" do
        expect(messages).to be_empty
      end
    end
  end
end
