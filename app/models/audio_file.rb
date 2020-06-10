class AudioFile < ApplicationRecord
  belongs_to :user
  has_one_attached :song_file
end
