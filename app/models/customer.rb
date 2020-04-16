class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, length: {maximum: 20}
  validates :first_name, presence: true, length: {maximum: 20}
  validates :read_last_name, presence: true, length: {maximum: 20}
  validates :read_first_name, presence: true, length: {maximum: 20}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {maximum: 12}
end