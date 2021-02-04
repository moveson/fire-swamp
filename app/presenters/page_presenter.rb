# frozen_string_literal: true

class PagePresenter
  def initialize(current_user, username_param)
    @current_user = current_user
    @username_param = username_param
  end

  def not_found_title_text
    if same_user?
      "Are you new around here?"
    elsif different_user?
      "There's nothing here yet"
    elsif not_found_user?
      "Never heard of that ROUS"
    else
      "Something went wrong"
    end
  end

  def not_found_body_text
    if same_user?
      "We don't have a page for you yet. You should fix that! Contact broveson and let's get you set up."
    elsif different_user?
      "There's no page for #{username_param} yet. Reach out and give that ROUS a hand, would you?"
    elsif not_found_user?
      <<~TEXT
        Rodents of Unusual Size? I don't think they exist. Or at least this one doesn't.
        (We haven't got any record of #{username_param} yet. Is that someone who needs an invite?)
      TEXT
    else
      "We shouldn't be able to reach this branch of code. Please file an issue and let's fix it!"
    end
  end

  def partial
    username_param
  end

  def username
    requested_user.username
  end

  private

  attr_reader :current_user, :username_param

  def same_user?
    current_user.parameterized_username == username_param
  end

  def different_user?
    !same_user? && requested_user_exists?
  end

  def not_found_user?
    !requested_user_exists?
  end

  def requested_user
    return @requested_user if defined?(@requested_user)

    @requested_user = ::User.find_by(parameterized_username: username_param)
  end

  def requested_user_exists?
    requested_user.present?
  end
end
