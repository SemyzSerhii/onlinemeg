class Purchase < ApplicationRecord

  def self.latest
    Purchase.order(:updated_at).last
  end
end
