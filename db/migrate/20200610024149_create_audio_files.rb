class CreateAudioFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :audio_files do |t|
      t.belongs_to :user

      t.string :filename
      t.string :song_title
      t.string :lyric_text

      t.timestamps
    end
  end
end
