class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: { 有効: true, 退会済: false }

  has_many :deliveries, dependent: :destroy

  validates :last_name, presence: true, length: {maximum: 20}
  validates :first_name, presence: true, length: {maximum: 20}
  validates :read_last_name, presence: true, length: {maximum: 20}
  validates :read_first_name, presence: true, length: {maximum: 20}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {maximum: 12}

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  def active_for_authentication?
    super && (self.status == "有効")
  end


end

