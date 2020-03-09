require 'rails_helper'
describe Book do
  describe '#create' do
    # bookのnameが空の場合保存できない
    it "is invalid without a name" do
      book = build(:book, name: "")
      book.valid?
      expect(book.errors[:name]).to include("を入力してください")
    end

    #nameの文字が20文字以上場合
    it "is invalid name is too long maximum 20 characters" do
      book = build(:book, name: "a" * 21)
      book.valid?
      expect(book.errors[:name]).to include("は20文字以内で入力してください")
    end
  end
end