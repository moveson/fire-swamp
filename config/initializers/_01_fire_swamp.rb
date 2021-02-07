# frozen_string_literal: true

module FireSwampConfig
  def self.sign_up_token
    ::ENV["SIGN_UP_TOKEN"]
  end
end
