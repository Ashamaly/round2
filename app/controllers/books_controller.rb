class BooksController < ApplicationController
  before_action :check_logged_in, only: [:edit, :new]

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    # creates book with the current users id 
    @book = current_user.books.new(params.require(:book).permit(:title, :price))
    @book.bookImage.attach(params.dig(:book, :bookImage))

    #on book save flashes success and redirects to root path
    if @book.save
      flash[:success] = "Your listing has been created successfully!"
      redirect_to root_path
    else
      #if the save fails flash failure and redirect
      flash[:error] = "Failed to create listing!"
      redirect_to root_path
    end
  end

  def update
    #finds the book id, updates the parameters that have been changed and redirects
    if Book.find(params[:id]).update_attributes(params.require(:book).permit(:title, :price))
      flash[:success] = "Your listing has been changed!"
      redirect_to root_path
    end
  end

  def destroy
    #destroys book based on the id
    if Book.destroy(params[:id])
      flash[:success] = "Your listing has been deleted"
      redirect_to root_path
    end
  end

end
