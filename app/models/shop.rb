class Shop < ApplicationRecord

  mount_uploader :photo, ImageUploader
  scope :search, -> (search){ where("name like ?", "%#{search}%")}

  belongs_to :shop_city
  has_many :positions
  has_many :tasties
  has_many :quiets
  has_many :collections
  has_many :liked_user, through: :collections


  def position?
    self.positions.empty?
  end

end
