# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::User do
  subject { create(:user) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }

  it "creates a user" do
    expect { subject }.not_to raise_error
  end
end
