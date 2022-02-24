class EquipmentsController < ApplicationController
  def upgrade
    if current_user.can_afford_next_equippment?
      unless current_user.upgrade_equipment!
        @error = "Can not afford to upgrade equipment"
      end
    end
  end
end
