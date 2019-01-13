class Product < ApplicationRecord
  belongs_to :category

  has_many :taggings
  has_many :tags, through: :taggings

  scope :filter_by_tag, ->(tag_id) { includes(:tags).where(tags: {id: tag_id})}
  scope :search_by_title, ->(query) { where('title LIKE ?', query)}

  def self.latest
    order(:updated_at).last
  end

  def self.filter_by_category(category_id:)
    joins(:category)
      .where(categories: { id: category_id })
      .or(joins(:category).where(categories: { ancestry: category_id }))
  end

  def all_tags
    tags.map(&:name).join(',')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

end
