class Song < ApplicationRecord
  validates :author, presence: true
  validates :name, presence: true
  validates :key, presence: true
  validates :chord, presence: true
  validates :instrument, presence: true
  validates :duration, presence: true

end
