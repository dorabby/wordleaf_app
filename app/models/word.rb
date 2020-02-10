class Word < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :name,presence: true,length:{maximum:20}
  validates :text,presence: true,length:{maximum:30}
end
