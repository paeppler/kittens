class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kittens_path, notice: "New kitting created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    # if @movie.update(movie_params)
    #   redirect_to @movie, notice: "Task failed successfully!"
    # else    
    #   render :edit, status: :unprocessable_entity
    # end

    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      # flash[:notice] = "Kitten updated!"
      redirect_to kittens_path, notice: "Task failed successfully!"
    else 
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.delete
    flash[:notice] = "Kitten killed!"

    redirect_to kittens_path
  end


  private

  def kitten_params 
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
