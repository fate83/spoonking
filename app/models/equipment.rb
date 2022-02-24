class Equipment < ApplicationRecord
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
end
