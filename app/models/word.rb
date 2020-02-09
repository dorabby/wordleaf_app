class Word < ApplicationRecord
  belongs_to :user
  belongs_to :book,dependent: :destroy
  validates :name,presence: true,length:{maximum:20}
  validates :text,presence: true,length:{maximum:30}

  def self.search(search)
    if search
      Book.includes(:word).where(['name LIKE(?)', "%#{search}%"]).references(:word)
      Word.where('name LIKE(?)', "%#{search}%")
    else
      @word = Word.all
    end
  end
end
