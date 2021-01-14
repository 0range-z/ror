class Comment < ApplicationRecord
  validates :content,
    presence: true,
    length: {maximum: 100},
    allow_nil: false
  belongs_to :product
end
