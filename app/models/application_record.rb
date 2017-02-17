class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :book, presence:true
  validates :subscriber, presence:true
  validates :delivery_date, presence:true
end
