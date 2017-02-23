class Library < ApplicationRecord
  has_many :employee, :dependent => :destroy
  has_many :book, :dependent => :destroy
  has_many :subscriber, :dependent => :destroy
  validates :number, presence:true
  validates :name, presence:true
  validates :address, presence:true
end
