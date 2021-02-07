# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    auto_session_timeout_actions
  end
end
