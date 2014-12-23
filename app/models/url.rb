class Url < ActiveRecord::Base

  before_create :shortener
  validates :url, presence: true, :format => {:with => URI.regexp}
  validates :url, uniqueness: true

  def shortener
    self.kitly  = SecureRandom.hex(3)
  end

end
