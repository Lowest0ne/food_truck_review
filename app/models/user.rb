class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader

  validates_presence_of :user_name
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :reviews,
    inverse_of: :user
end
