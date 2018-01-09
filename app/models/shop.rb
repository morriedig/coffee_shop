class Shop < ApplicationRecord

  mount_uploader :photo, ImageUploader
  scope :search, -> (search){ where("name like ?", "%#{search}%")}

  has_many :positions

  def position?
    self.positions.empty?
  end

end
