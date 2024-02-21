class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { in: 0..5 }
  validates :restaurant, presence: true

end

# rails generate model review content:text rating:integer restaurant:references

# validation reqs for creating (user-side)
# [X] A review must have a content.
# [X] A review must have a rating.
# [X] A review’s rating must be a number between 0 and 5.
# [X] A review’s rating must be an integer. For example, a review with a rating of 2.5 should be invalid!
# [X] A review must belong to a restaurant.
