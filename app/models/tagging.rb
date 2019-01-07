class Tagging < ApplicationRecord
  belongs_to :purchase
  belongs_to :tag
end
