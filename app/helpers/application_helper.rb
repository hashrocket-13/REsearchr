module ApplicationHelper
  def algo_for_quality(avg_price, avg_sqft)
    return (avg_price / avg_sqft)
  end

  def color(algo_for_quality)
    if algo_for_quality > 55
      return "scoregreen"
    elsif algo_for_quality <= 55 && algo_for_quality >= 50
      return "scoreyellow"
    else
      return "scorered"
    end
  end
end
