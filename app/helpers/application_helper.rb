module ApplicationHelper
  def price_format(price)
    "#{price.to_s(:delimited)}円"
  end

  def date_format(date)
    wd = ['日', '月', '火', '水', '木', '金', '土']
    date.strftime("%-Y年%-m月%-d日(#{wd[date.wday]})")
  end

  def datetime_format(date)
    "#{date_format(date)} #{date.strftime('%-H時%-M分')}"
  end

  def delivery_datetime_range_format(from, to)
    "#{date_format(from)} #{delivery_time_range_format(from, to)}"
  end

  def delivery_time_range_format(from, to)
    "#{from.strftime("%-H")}時〜#{to.strftime("%-H")}時"
  end
end
