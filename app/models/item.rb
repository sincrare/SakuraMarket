class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647 }
  include RankedModel
  ranks :row_order
  mount_uploader :image, ImageUploader
  has_many :stocked_item, dependent: :destroy
  has_many :ordered_item, dependent: :nullify

  scope :active, -> { where(active: true) }
end
