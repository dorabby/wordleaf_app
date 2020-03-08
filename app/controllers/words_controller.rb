class WordsController < ApplicationController
  before_action :set_book
  before_action :move_to_index, except: [:index, :show, :search]

  def index    
    @book = Book.find(params[:book_id])
    @q     = @book.words.ransack(params[:q])
    @words = @q.result(distinct: true)
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
      redirect_to book_words_path(@book),notice:"▼『#{@word.name}』を登録しました"
    elsif @word.name.length >= 20
      flash.now[:alert] = "単語名は20文字以内で登録してください"
      render :new
    elsif @word.text.length >= 40
      flash.now[:alert] = "意味は40文字以内で登録してください"
      render :new
    else
      flash.now[:alert] = "登録するには単語名と意味の欄に1文字以上の入力が必須です"
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to book_words_path(@book),notice:"▼『#{@word.name}』を編集しました"
    elsif @word.name.length >= 20
      flash.now[:alert] = "単語名は20文字以内で登録してください"
      render :edit
    elsif @word.text.length >= 40
      flash.now[:alert] = "意味は40文字以内で登録してください"
      render :edit
    else
      flash.now[:alert] = "編集できませんでした"
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      redirect_to book_words_url(@book),notice:"▼『#{@word.name}』を削除しました"
    else
      flash.now[:alert] = "削除できませんでした" 
      render :show
    end
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
