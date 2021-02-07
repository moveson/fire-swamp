class Message < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id

  broadcasts_to :chat_channel

  validates_presence_of :author, :content

  scope :newer_than, ->(duration) { where("created_at > ?", Time.current - duration) }

  def self.chat_channel
    "fire_swamp_chat_channel"
  end

  def author_id
    user_id
  end

  def edited?
    created_at != updated_at
  end

  private

  def chat_channel
    self.class.chat_channel
  end
end
