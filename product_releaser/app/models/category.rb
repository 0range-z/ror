class Category < ApplicationRecord
  validates :name,
    presence: true,
    length: {maximum: 45},
    allow_nil: false
  validates :name, :uniqueness => { :message =>'Already taken'}
  has_many :products
end
