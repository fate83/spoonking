class DiggingController < ApplicationController
  def index
  end

  def dig
    sand = rand(100)
    @item = %w(Apfelkitsch Altmetall).shuffle.first

    current_user.sand += sand
    current_user.save!

    ActionCable.server.broadcast(
      "dig_queue", {
        sand_total: current_user.sand,
        sand: sand,
        body: render_to_string(partial: 'digging/resources', locals: { sand: sand, item: @item })
      }
    )
  end
end
