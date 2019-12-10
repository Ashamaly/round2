class BooksController < ApplicationController
  before_action :check_logged_in, only: [:edit, :new]

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(params.require(:book).permit(:title, :price))

    if @book.save
      flash[:success] = "Your listing has been created successfully!"
      redirect_to root_path
    else
      flash[:error] = "Failed to create listing!"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    if Book.destroy(params[:id])
      flash[:success] = "Your listing has been deleted"
      redirect_to root_path
    end
  end

end