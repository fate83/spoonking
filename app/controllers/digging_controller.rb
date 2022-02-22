class DiggingController < ApplicationController
  def index
  end

  def dig
    sand  = rand(100)
    count = Item.count()

    current_user.sand += sand
    current_user.save!

    item          = Item.find(rand(count) + 1)
    backpack_item = current_user.backpack_items.find_or_create_by(item: item)

    backpack_item.amount += 1
    backpack_item.save!

    ActionCable.server.broadcast(
      "dig_queue", {
      sand_total: current_user.sand,
      sand:       sand,
      body:       render_to_string(partial: 'digging/resources', locals: { sand: sand, item: item.name }),
      backpack:   render_to_string(partial: 'backpack')
    }
    )
  end
end
