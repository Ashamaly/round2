class BookController < ApplicationController

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
    
  end

end
