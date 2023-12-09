class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :avatar

validates :name, presence: true
validates :affiliation, presence: true
validates :position, presence: true

has_many :reviews
has_many :comments

end
