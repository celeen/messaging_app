class User < ActiveRecord::Base
  has_many :sent_wats, class_name: "Wat", foreign_key: "sender_id"
  has_many :received_wats, class_name: "Wat", foreign_key: "receiver_id"

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
