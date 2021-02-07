# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /resource
    def create
      if params[:sign_up_token] == ::FireSwampConfig.sign_up_token
        super
      else
        flash[:alert] = "Invalid sign up token"
        redirect_to new_user_registration_path
      end
    end
  end
end
