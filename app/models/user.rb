class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :username
  validates_presence_of :parameterized_username

  before_validation :set_parameterized_username, if: :username_changed?

  def to_param
    username&.parameterize&.underscore
  end

  private

  def set_parameterized_username
    self.parameterized_username = to_param
  end
end
