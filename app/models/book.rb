class Book < ApplicationRecord
  belongs_to :user
  has_many :words,dependent: :destroy
  validates :name,presence: true,length:{maximum:20}
end
