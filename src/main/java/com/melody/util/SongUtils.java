package com.melody.util;

import com.melody.dao.SingerDAO;
import com.melody.model.Singer;

import java.sql.SQLException;

public class SongUtils {
    public static String getSingerName(long singerId) {
        try {
            SingerDAO singerDAO = new SingerDAO();
            Singer singer = singerDAO.getSingerById(singerId);
            if (singer != null) {
                return singer.getSingerName();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return "Unknown Artist";
    }
}
