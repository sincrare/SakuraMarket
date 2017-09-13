module ApplicationHelper
  def price_format(price)
    number_to_currency(price)
  end

  def date_format(date)
    l date, format: "%-Y年%-m月%-d日(%a)"
  end

  def datetime_format(date)
    l date, format: "%-Y年%-m月%-d日(%a) %-H時%-M分"
  end

  def delivery_datetime_range_format(from, to)
    "#{date_format(from)} #{delivery_time_range_format(from, to)}"
  end

  def delivery_time_range_format(from, to)
    "#{from.strftime("%-H")}時〜#{to.strftime("%-H")}時"
  end
end
