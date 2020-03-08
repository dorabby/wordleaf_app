class BooksController < ApplicationController
  before_action :set_book,only:[:edit,:update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      flash.now[:alert] = "1文字以上入力してください"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_words_path(@book)
    else
      flash.now[:alert] = "編集できませんでした"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to root_path
    else
      flash.now[:alert] = "削除できませんでした"
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:name).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
  
end
