class CustomSongValidations < ActiveModel::Validator
  def validate(record)
    songs_from_release_year = Song.where(release_year: record.release_year)

    unless !songs_from_release_year.any?{|song| record.id != song.id && song.title == record.title}
      record.errors[:title] << 'A song title cannot be repeated by the same artist in the same year.'
    end

    unless !record.released || (record.released && record.release_year.class == Fixnum && record.release_year <= Time.now.year)
      record.errors[:release_year] << 'If the song is released, release year must not be blank and must be less than or equal to the current year.'
    end
  end
end
