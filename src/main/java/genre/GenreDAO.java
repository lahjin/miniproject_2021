package genre;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Genre;
import javabean.Party;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GenreDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //모든 장르를 리턴해주는 메소드
    public ArrayList<Genre> selectGenre() {
        ArrayList<Genre> list = new ArrayList<>();
        String sql = "SELECT * FROM genre";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Genre(rs.getInt("genre_code"),rs.getString("genre_name"),rs.getString("genre_id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (mysqlDB.getConn() != null) mysqlDB.getConn().close();
            } catch (Exception e) {
            }
        }
        return list;
    }
}
