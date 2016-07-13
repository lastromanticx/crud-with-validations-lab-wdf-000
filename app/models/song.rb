class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true,false]}
  validates :artist_name, presence: true

  validates_with CustomSongValidations
end
