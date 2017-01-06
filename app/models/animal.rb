class Animal < ActiveRecord::Base
  has_many :sightings
  validates :common_name, :latin_name, :kingdom, length: {minimum:2}
end
