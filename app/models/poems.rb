class Poem < ActiveRecord::Base
  belongs_to :user
  validates :username, :date_created, presence: true
end
