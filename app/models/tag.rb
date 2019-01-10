class Tag < ApplicationRecord
  has_many :taggings
  has_many :purchases, through: :taggings
end
