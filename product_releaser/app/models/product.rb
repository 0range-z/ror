class Product < ApplicationRecord
  validates :name,
    presence: true,
    length: {maximum: 10},
    allow_nil: false
  validates :name, :uniqueness => { :message =>'Already taken'}
  validates :description,
    presence: true,
    length: {maximum: 200},
    allow_nil: false
  has_many :comments, :dependent => :destroy
  belongs_to :category
end
