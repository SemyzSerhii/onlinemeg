class Purchase < ApplicationRecord
  belongs_to :category

  has_many :taggings
  has_many :tags, through: :taggings

  def self.latest
    Purchase.order(:updated_at).last
  end

  def self.filter(category_id:)
    joins(:category)
      .where(categories: { id: category_id })
      .or(joins(:category).where(categories: { ancestry: category_id }))
  end

  def all_tags
    self.tags.map(&:name).join(',')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

end
