class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # uses only:/except: to render a customized hash(only) for the data elements we want to see
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]

  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird -- renders all the birds

    # renders customized hash for the data elements we want to see
    # render json: {id: bird.id, name: bird.name, species: bird.species } 

    # uses .slice to render a new customized hash(only) for the data elements we want to see
    # render json: bird.slice(:id, :name, :species)

    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    
  end
end