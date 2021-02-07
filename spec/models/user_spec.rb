# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::User do
  subject { create(:user) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:parameterized_username) }

  it "creates a user" do
    expect { subject }.not_to raise_error
  end

  describe "#parameterized_username" do
    context "when username is provided" do
      it "automatically sets parameterized username" do
        expect(subject.parameterized_username).to be_present
      end
    end

    context "when username is changed" do
      before do
        subject.username = "Different Username"
        subject.validate
      end

      it "changes the parameterized username" do
        expect(subject.parameterized_username).to eq("different_username")
      end
    end

    context "when username is nil" do
      before do
        subject.username = nil
        subject.validate
      end

      it "returns nil" do
        expect(subject.parameterized_username).to be_nil
      end
    end
  end
end
