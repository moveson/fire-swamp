# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Message, type: :model do
  subject { create(:message) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:content) }
end
