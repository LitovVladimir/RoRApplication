class Delivery < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
  validates :book, presence:true
  validates :subscriber, presence:true
  validates :delivery_date, presence:true
end
