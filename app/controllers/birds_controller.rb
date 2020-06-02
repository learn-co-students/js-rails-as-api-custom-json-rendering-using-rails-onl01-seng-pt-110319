class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species] #slice method doesn't work in array of hashes so usly only is other way to pick and choose data or use except method to exclude content
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird 
    if bird
    render json: {id: bird.id, name: bird.name, species: bird.species} #instead of sending all data, we could just pick and choose what we want to send
    # or use this method-> render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found'}
    end
  end
end