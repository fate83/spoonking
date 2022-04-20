class Equipment < ApplicationRecord
  BASE_DIG_VALUE = 100
  LEVEL_CAP      = 10

  belongs_to :user

  def self.sand_needed_for_equipment(level, start_exp = 100)
    100 + (100 * (level - 1))
  end

  def upgrade!
    if can_upgrade?
      self.level += 1
      save!
    else
      false
    end
  end

  def sand_needed_for_upgrade
    Equipment.sand_needed_for_equipment(self.level)
  end

  def dig
    (rand(BASE_DIG_VALUE) ** (self.efficiency) * self.level).to_i
  end

  def can_upgrade?
    return false if at_level_cap?
    user.sand >= sand_needed_for_upgrade
  end

  def at_level_cap?
    if self.level > LEVEL_CAP
      raise StandardError.new "Equipment level should never exceed equipment level cap #{LEVEL_CAP}, but was: #{self.level}"
    end

    self.level == LEVEL_CAP
  end
end
