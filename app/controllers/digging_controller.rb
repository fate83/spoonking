class DiggingController < ApplicationController
  def index
  end

  def dig
    @sand = rand(100)
    @item = %w(Apfelkitsch Altmetall).shuffle.first

    ActionCable.server.broadcast(
      "dig_queue", {
        body: render_to_string(partial: 'digging/resources', locals: { sand: @sand, item: @item })
      }
    )
  end
end
