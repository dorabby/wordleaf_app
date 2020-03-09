require 'rails_helper'

describe Word do
  describe '#create' do
    # wordのnameが空の場合保存できない
    it "is invalid without a name" do
      word = build(:word, name: "")
      word.valid?
      expect(word.errors[:name]).to include("を入力してください")
    end

    #nameの文字が20文字以上場合
    it "is invalid name is too long maximum 20 characters" do
      word = build(:word, name: "a" * 21)
      word.valid?
      expect(word.errors[:name]).to include("は20文字以内で入力してください")
    end
    it "is invalid without a text" do
      word = build(:word, text: "")
      word.valid?
      expect(word.errors[:text]).to include("を入力してください")
    end

    #textの文字が40文字以上場合
    it "is invalid text is too long maximum 40 characters" do
      word = build(:word, text: "a" * 41)
      word.valid?
      expect(word.errors[:text]).to include("は40文字以内で入力してください")
    end

    #保存できないのが正しい集
    context 'can not save' do
      #nameとtext両方がない場合はちゃんとエラーになるか
      it 'is invalid without name and text' do
        word = build(:word, text: nil, name: nil)
        word.valid?
        expect(word.errors[:name]).to include("を入力してください")
        expect(word.errors[:text]).to include("を入力してください")
      end

      #book_idない場合ちゃんと投稿ができないようになっているか
      it 'is invalid without book_id' do
        word = build(:word, book_id: nil)
        word.valid?
        expect(word.errors[:book]).to include("を入力してください")
      end

      #user_idない場合ちゃんと投稿ができないようになっているか
      it 'is invalid without user_id' do
        word = build(:word, user_id: nil)
        word.valid?
        expect(word.errors[:user]).to include("を入力してください")
      end
    end

  end
end