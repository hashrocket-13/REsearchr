module ApplicationHelper
  def algo_for_quality(avg_price, avg_sqft)
    return (avg_price / avg_sqft)
  end
end
