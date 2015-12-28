class GiftGrantor < ActiveRecord::Base
  validates :recipient, :presence => true, :uniqueness => true
end
