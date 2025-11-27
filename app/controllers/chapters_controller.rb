class ChaptersController < ApplicationController
  before_action :set_book
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy ]
  before_action :require_admin, except: [ :show ]

  def show
  end

  def new
    @chapter = @book.chapters.new
  end

  def create
    @chapter = @book.chapters.new(chapter_params)
    if @chapter.save
      redirect_to [ @book, @chapter ], notice: "Chapter was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to [ @book, @chapter ], notice: "Chapter was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to @book, notice: "Chapter was successfully destroyed."
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book_id])
  end

  def set_chapter
    @chapter = @book.chapters.friendly.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content, :status, :notes)
  end
end
