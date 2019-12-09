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
    @book.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your listing has been destroyed." }
      format.json { head :no_content }
    end
  end

end
