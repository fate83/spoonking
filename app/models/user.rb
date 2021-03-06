class User < ApplicationRecord
  LEVEL_CAP = 10
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :backpack_items, dependent: :destroy
  has_many :items, through: :backpack_items
  has_many :backpack, through: :backpack_items, source: :item
  has_one :equipment, dependent: :destroy, foreign_key: 'worn_by_user_id'
  has_many :equipments, dependent: :destroy

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

  def level_up
    if can_level_up?
      self.level += 1
    else
      false
    end
  end

  def exp_for_level_up
    if can_level_up?
      0
    else
      User.exp_needed_for_level_up(self.level) - self.exp
    end
  end

  def can_level_up?
    return false if at_level_cap?
    self.exp >= User.exp_needed_for_level_up(self.level)
  end

  def self.exp_needed_for_level_up(level, start_exp = 200)
    return 0 if level == 0
    return start_exp if level == 1
    exp_needed_for_level_up(level - 1, start_exp + 100) + exp_needed_for_level_up(level - 2, start_exp - 100)
  end

  def can_afford_next_equippment?
    can_afford? equipment.sand_needed_for_upgrade
  end

  def upgrade_equipment!
    if can_afford_next_equippment?
      equipment.upgrade!
      pay!(equipment.sand_needed_for_upgrade)
    end
  end

  def pay!(amount)
    if can_afford? amount
      self.sand -= amount
      save
    end
  end

  def can_afford? amount
    self.sand >= amount
  end

  def at_level_cap?
    if self.level > LEVEL_CAP
      raise StandardError.new "User level should never exceed hard level cap #{LEVEL_CAP}, but was: #{self.level}"
    end

    self.level == LEVEL_CAP
  end

  def reset!
    update level: 1,
           exp:   0,
           sand:  0
    backpack.destroy_all unless backpack.empty?
    equipment.destroy! if equipment
    equipment = equipments.create!
  end
end
