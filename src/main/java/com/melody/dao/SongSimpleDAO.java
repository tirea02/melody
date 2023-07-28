package com.melody.dao;

import java.util.List;
import com.melody.model.SongSimple;

public interface SongSimpleDAO {
    void saveSong(SongSimple songSimple);
    void updateSong(SongSimple songSimple);
    void deleteSong(long songId);
    SongSimple getSongById(long songId);
    List<SongSimple> getAllSongs();

}
