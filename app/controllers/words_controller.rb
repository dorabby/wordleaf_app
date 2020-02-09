class WordsController < ApplicationController
  before_action :set_book
  before_action :move_to_index, except: [:index, :show, :search]

  def index    
    @word = Word.all
    @words = @book.words.includes(:user)
  end

  def show
    @word = Word.find(params[:id])
    @words = @book.words.includes(:user)
  end

  def new
    @word = Word.new
  end

  def create
    @word = @book.words.new(word_params)
    if @word.save
      redirect_to book_words_path(@book)
    else
      render :index
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to book_words_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to book_words_url(@book)
  end

  def search
    @words = Word.search(params[:name])
  end



  private

  def word_params
    params.require(:word).permit(:name,:text,:details,:image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
