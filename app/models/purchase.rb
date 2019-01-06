class Purchase < ApplicationRecord
  belongs_to :category

  def self.latest
    Purchase.order(:updated_at).last
  end
end
