class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :timeoutable

  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
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
