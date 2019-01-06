class Category < ApplicationRecord
  has_many :purchases

  validates :name, presence: true

  has_ancestry
end
