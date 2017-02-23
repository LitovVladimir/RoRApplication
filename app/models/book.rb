class Book < ApplicationRecord
  belongs_to :library
  has_many :delivery, :dependent => :destroy
  validates :library, presence:true
  validates :name, presence:true
  validates :cipher, presence:true
end
