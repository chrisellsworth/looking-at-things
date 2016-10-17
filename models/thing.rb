class Thing < ActiveRecord::Base
  def self.matching(query)
    Thing.where('summary ilike ?', "%#{query}%").order('RANDOM()').first
  end

  def self.any
    Thing.order('RANDOM()').limit(1).first
  end

  def attributes
    { summary: nil, image_url: nil }
  end
end
