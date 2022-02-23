class ProgressionController < ApplicationController
  def convert_sand
    @sand_amount = params[:sand_amount]
    current_user.spend_sand_for_exp(@sand_amount.to_i)

    unless current_user.save
      @errors = current_user.errors.full_messages
    end
  end
end
