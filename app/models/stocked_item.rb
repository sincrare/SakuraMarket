class StockedItem < ApplicationRecord
  validates :add_count, numericality: { greater_than: 0 }
  belongs_to :user
  belongs_to :item

  attr_accessor :add_count

  def self.total_amount
    all.inject(0) { |sum, stocked_item| sum + stocked_item.item.price * stocked_item.count }
  end

  def self.cod_fee
    total = all.total_amount
    if total < 10000 then
      300
    elsif total < 30000 then
      400
    elsif total < 100000 then
      600
    else
      1000
    end
  end

  def self.shipping
    (1 + all.sum(:count).div(5)) * 600
  end

  def self.sales_tax
    sales_tax_rate = 8
    ((all.total_amount + cod_fee + shipping) * sales_tax_rate / 100).floor
  end

  def self.billing_amount
    all.total_amount + all.cod_fee + all.shipping + all.sales_tax
  end

  def self.delivery_date_candidates
    date = Date.current.since(3.days)
    business_date_range = 12
    delivery_date_candidate = []
    business_date_range.times do
      date = date.tomorrow while (date.wday <= 0 or date.wday >= 6 or HolidayJapan.check(date.to_date))
      delivery_date_candidate.push(date)
      date = date.tomorrow
    end
    delivery_date_candidate
  end

  def self.delivery_time_candidates
    delivery_time_candidate = {}
    delivery_time_candidate['8時〜12時'] = '8,12'
    delivery_time_candidate['12時〜14時'] = '12,14'
    delivery_time_candidate['14時〜16時'] = '14,16'
    delivery_time_candidate['16時〜18時'] = '16,18'
    delivery_time_candidate['18時〜20時'] = '18,20'
    delivery_time_candidate['20時〜21時'] = '20,21'
    delivery_time_candidate
  end

  after_initialize do
    self.add_count = 1
  end

  before_update do
    self.count += self.add_count.to_i
  end
end
