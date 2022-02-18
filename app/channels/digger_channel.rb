class DiggerChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'dig_queue'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
