class Sighting < ActiveRecord::Base
  belongs_to :animal
  validates :animal, presence: true
  validates :date, presence: true
  validates :latitude, :longitude, presence: true
end
