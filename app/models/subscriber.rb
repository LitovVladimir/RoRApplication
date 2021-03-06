class Subscriber < ApplicationRecord
  belongs_to :library
  has_many :delivery, :dependent => :destroy
  validates :library, presence:true
  validates :ticket_number, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :address, presence:true
  validates :phone, presence:true
end
