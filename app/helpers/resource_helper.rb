module ResourceHelper
  def width_calculator(limit)
    return unless limit.present?
    12 / limit
  end
end
