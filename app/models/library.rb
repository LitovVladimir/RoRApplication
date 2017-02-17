class Library < ApplicationRecord
  validates :number, presence:true
  validates :name, presence:true
  validates :address, presence:true
end
