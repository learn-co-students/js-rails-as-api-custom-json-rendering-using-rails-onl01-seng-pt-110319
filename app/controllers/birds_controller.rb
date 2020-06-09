class BirdsController < ApplicationController
  # def index
  #   birds = Bird.all
  #   render json: birds # rendering all of the birds to JSON producing an array of bird objects 
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird # here we are rendering data of a certain bird to JSON format. producing one array of a bird object
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species }
  #   # Here, we've created a new hash out of three keys, assigning the keys manually with the attributes of bird.
  # end

  # Another option would be to use Ruby's built-in slice method. On the show action, that would look like this:
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  #   # Here, we've created a new hash out of three keys, assigning the keys manually with the attributes of bird using the slice method.
  # end

  # def index
  #   birds = Bird.all
  #   render json: birds, only: [:id, :name, :species] # In this case, we can add in the only: option directly after listing an object we want to render to JSON:
  # end

  # def index
  #   birds = Bird.all
  #   render json: birds, except: [:created_at, :updated_at]
  # end

  def index
    birds = Bird.all
    render json: birds.to_json(except: [:created_at, :updated_at]) # does essentially the same thing as above, including everything EXCEPT created_at and updated_at
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird
    render json: {id: bird.id, name: bird.name, species: bird.species}
    else  
      render json: {message: 'Bird not found'}
    end 

  end
end