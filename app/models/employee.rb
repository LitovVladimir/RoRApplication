class Employee < ApplicationRecord
  belongs_to :library
  validates :library, presence:true
  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :post, presence:true
end
