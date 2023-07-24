package com.melody.dao;

import java.util.List;
import com.melody.model.Song;

public interface SongDAO {
    void saveSong(Song song);
    void updateSong(Song song);
    void deleteSong(long songId);
    Song getSongById(long songId);
    List<Song> getAllSongs();

}
