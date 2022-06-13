class Item < ApplicationRecord
  has_many :backpack_items

  before_destroy :ensure_not_referenced_by_any_backpack_items

  private

  # rubocop:disable LineLength
  def ensure_not_referenced_by_any_backpack_items
    # rubocop:enable LineLength
    if backpack_items.any?
      errors.add(:base, "Can't delete item. Still in someone's backpack.")
      throw :abort
    end
  end
end
