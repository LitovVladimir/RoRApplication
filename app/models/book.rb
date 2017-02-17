class Book < ApplicationRecord
  belongs_to :library
  validates :library, presence:true
  validates :name, presence:true
  validates :cipher, presence:true
end
