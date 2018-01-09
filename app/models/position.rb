class Position < ApplicationRecord
  belongs_to :shop
  validates_presence_of :address
  geocoded_by :address

  before_save :create_place

  def create_place
      self.latitude = Geocoder.search(self.address).first.try(:latitude)
      self.longitude = Geocoder.search(self.address).first.try(:longitude)
  end
end
