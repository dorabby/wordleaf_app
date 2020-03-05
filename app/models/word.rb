class Word < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :name,presence: true,length:{maximum:25}
  validates :text,presence: true,length:{maximum:40}
end
