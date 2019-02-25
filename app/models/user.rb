class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings_as_hero, :class_name => 'Booking', :foreign_key => 'hero_id'
  has_many :bookings_as_zero, :class_name => 'Booking', :foreign_key => 'zero_id'

  validates :first_name, :last_name, :location, :hero, presence: true
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
end
