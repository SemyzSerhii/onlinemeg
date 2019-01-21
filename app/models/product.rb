class Product < ApplicationRecord
  include PgSearch

  belongs_to :category

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :line_items

  before_destroy :empty_line_item

  scope :filter_by_tag, ->(tag_id:) { includes(:tags).where(tags: { id: tag_id }) }

  pg_search_scope :full_search, against: %i[title short_description],
    using: {tsearch: {prefix: true }},
    associated_against: { tags: :name, category: :name}

  def self.latest
    order(:updated_at).last
  end

  def self.filter_by_category(category_id:)
    joins(:category)
      .where(categories: { id: category_id })
      .or(joins(:category).where(categories: { ancestry: category_id }))
  end

  def all_tags
    tags.pluck(:name).join(',')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  private
  def empty_line_item
    unless line_items.empty?
       errors.add(:base, 'товару')
       throw :abort
    end
  end

end
