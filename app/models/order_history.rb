class OrderHistory < ApplicationRecord
  validate :shipping_address_validate
  belongs_to :user
  has_many :ordered_items
  accepts_nested_attributes_for :ordered_items

  attr_accessor :delivery_date
  attr_accessor :delivery_time

  def shipping_address_validate
    if self.user.address.blank?
        errors.add(:base, '送付先住所が設定されていません。')
    end
  end

  before_create do
    delivery_times = self.delivery_time.split(',')
    time_from = delivery_times.first.to_i
    time_to = delivery_times.last.to_i
    self.delivery_date_from = self.delivery_date.to_datetime + Rational(time_from, 24)
    self.delivery_date_to = self.delivery_date.to_datetime + Rational(time_to, 24)
  end
end
