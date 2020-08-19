class Weather < ApplicationRecord

  def humidity
    "#{self[:humidity]}%"
  end

  def temperature
    "#{self[:temperature]}°c"
  end
end
