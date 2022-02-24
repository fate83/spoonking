class DiggingController < ApplicationController
  def index
  end

  def dig
    sand  = rand(100)
    count = Item.count()

    current_user.sand += sand
    current_user.save!

    item          = Item.find(Item.pluck(:id).shuffle.first)
    backpack_item = current_user.backpack_items.find_or_create_by(item: item)

    backpack_item.amount += 1
    backpack_item.save!

    ActionCable.server.broadcast(
      "dig_queue", {
      user_dom_id: helpers.dom_id(current_user),
      user_info:   render_to_string(partial: 'application/user'),
      backpack:    render_to_string(partial: 'backpack')
    }
    )
  end
end
