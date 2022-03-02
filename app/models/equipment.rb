class Equipment < ApplicationRecord
  BASE_DIG_VALUE = 100

  belongs_to :user

  def self.sand_needed_for_equipment(level, start_exp = 100)
    100 + (100 * (level - 1))
  end

  def upgrade!
    self.level += 1
    save!
  end

  def sand_needed_for_upgrade
    Equipment.sand_needed_for_equipment(self.level)
  end

  def dig
    (rand(BASE_DIG_VALUE) ** (self.efficiency) * self.level).to_i
  end
end
