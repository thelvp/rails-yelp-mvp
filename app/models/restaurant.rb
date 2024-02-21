class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, :address, :phone_number, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES,  message: "%{value} is not a valid category"  }

end

# rails generate model restaurant name:string address:string phone_number:string category:string

# validation reqs for creating (user-side) / reqs for object are in db schema
# [X] A restaurant must have a name, an address and a category.
# [X] A restaurant’s category must belong to this fixed list: ["chinese", "italian", "japanese", "french", "belgian"].
# [X] When a restaurant is destroyed, all of its reviews must be destroyed as well.
