class Poem < ActiveRecord::Base
  belongs_to :user
  validates :user, :date_created, presence: true
end
