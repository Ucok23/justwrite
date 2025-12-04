class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]
  before_action :require_admin, except: [ :index, :show ]

  def index
    if current_user&.admin?
      @books = Book.all
    else
      @books = Book.where(published: true)
    end
  end

  def show
  end

  def new
    @book = Book.new(requires_login: Setting.instance.default_book_requires_login)
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book was successfully destroyed."
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :published, :cover_image)
  end
end
