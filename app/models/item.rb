class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  include RankedModel
  ranks :row_order
  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true) }
end
