class User < ActiveRecord::Base
  has_secure_password
  has_many :poems
  validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..12},
                        :on => :create

  validates :email, uniqueness: true

end
