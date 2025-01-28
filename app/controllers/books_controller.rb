class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_book_owner, only: [:edit, :update, :destroy]

  def index
    @books = Book.where(published: true)
    @books = @books.or(Book.where(user: @current_user)) if user_signed_in?
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = @current_user.books.build(book_params) # Assign the current user to the book
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, alert: 'Book was successfully deleted.'
  end

  def index_all
    @published_books = Book.where(published: true)
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, alert: "Book not found" if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :description, :status, :published, :image)
  end

  def check_book_owner
    if @book.user != @current_user
      redirect_to books_path, alert: "You are not authorized to perform this action."
    end
  end
end
