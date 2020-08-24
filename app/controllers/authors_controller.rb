class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end
  
  def edit
  end

  def create
    @author = Author.new(author_params)
    
    if @author.valid? 
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end
  
  def update
    if @author.update(author_path)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:email, :name, :phone_number)
  end
end
