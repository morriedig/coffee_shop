class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasties
  has_many :quiets
  has_many :collections
  has_many :like_shop, through: :collections


  def admin?
    self.role == "admin"
  end


end
