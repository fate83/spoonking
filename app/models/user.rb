class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :backpack_items, dependent: :destroy
  has_many :items, through: :backpack_items

  validates :sand, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :level, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :exp, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def gain_exp! amount
    gain_exp amount
    save!
  end

  def gain_exp amount
    self.exp += amount
  end

  def spend_sand_for_exp amount
    self.exp  += amount
    self.sand -= amount
  end
end
