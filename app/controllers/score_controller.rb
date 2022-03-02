class ScoreController < ApplicationController
  def index
    @scorers = User.order(sand: :desc).limit(10)
  end
end
