package community;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Community_border;
import javabean.OTT;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

public class Community_borderDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //일정 갯수만큼 게시글을 list에 저장하는 메소드
    public ArrayList<Community_border> selectBorder(int skipIndex, int countIndex){
        ArrayList<Community_border> list = new ArrayList<>();

        String sql = "SELECT * FROM community_border WHERE cm_b_state = '등록' ORDER BY cm_b_date DESC LIMIT ?, ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, skipIndex);
            pstmt.setInt(2, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Community_border(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),
                        rs.getString(13),rs.getString(14)));
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

    //커뮤니티에 등록된 모든 글의 갯수를 리턴하는 메소드
    public int upTimeBorderCount(){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_border WHERE cm_b_state = '등록'";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }

    //일일 작성된 글 중 좋아요를 많이 받은글
    public ArrayList<Community_border> dailyTopLikes(int countIndex){
        ArrayList<Community_border> list = new ArrayList<>();
        String sql = "SELECT * FROM community_border " +
                "WHERE cm_b_state = '등록' AND DATE_FORMAT(cm_b_date, '%Y-%m-%d') = DATE_FORMAT(NOW(), '%Y-%m-%d')" +
                "ORDER BY cm_b_likes DESC LIMIT ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Community_border(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),
                        rs.getString(13),rs.getString(14)));
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

    //주간 작성된 글 중 좋아요를 많이 받은글
    public ArrayList<Community_border> weeklyTopLikes(int countIndex){
        ArrayList<Community_border> list = new ArrayList<>();
        String sql = "SELECT * FROM community_border " +
                "WHERE cm_b_state = '등록' AND DATE_FORMAT(cm_b_date, '%Y-%m-%d') <= DATE_FORMAT(NOW(), '%Y-%m-%d') " +
                "AND DATE_FORMAT(cm_b_date, '%Y-%m-%d') >= DATE_FORMAT(DATE_ADD(NOW(), INTERVAL - 1 WEEK), '%Y-%m-%d') " +
                "ORDER BY cm_b_likes DESC LIMIT ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Community_border(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),
                        rs.getString(13),rs.getString(14)));
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

    //월간 작성된 글 중 좋아요를 많이 받은글
    public ArrayList<Community_border> monthlyTopLikes(int countIndex){
        ArrayList<Community_border> list = new ArrayList<>();
        String sql = "SELECT * FROM community_border " +
                "WHERE cm_b_state = '등록' AND DATE_FORMAT(cm_b_date, '%Y-%m-%d') <= DATE_FORMAT(NOW(), '%Y-%m-%d') " +
                "AND DATE_FORMAT(cm_b_date, '%Y-%m-%d') >= DATE_FORMAT(DATE_ADD(NOW(), INTERVAL - 1 MONTH), '%Y-%m-%d') " +
                "ORDER BY cm_b_likes DESC LIMIT ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Community_border(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),
                        rs.getString(13),rs.getString(14)));
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

    //커뮤니티 글작성 메소드
    public int borderWrite(Community_border cm_b){
        int result = 0;
        String sql = "INSERT INTO miniproject.community_border (cm_b_member, cm_b_service, cm_b_title, cm_b_subTitle, " +
                "cm_b_genre1, cm_b_genre2, cm_b_content, cm_b_star) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,cm_b.getCm_b_member());
            pstmt.setString(2,cm_b.getCm_b_service());
            pstmt.setString(3,cm_b.getCm_b_title());
            pstmt.setString(4,cm_b.getCm_b_subTitle());
            pstmt.setString(5,cm_b.getCm_b_genre1());
            pstmt.setString(6,cm_b.getCm_b_genre2());
            pstmt.setString(7,cm_b.getCm_b_content());
            pstmt.setInt(8,cm_b.getCm_b_star());
            result =  pstmt.executeUpdate();
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
        return result;
    }

    //커뮤니티 작성글코드로 검색
    public ArrayList<Object> codeToBorder(int cm_b_code){
        ArrayList<Object> list = new ArrayList<>();
        String sql = "SELECT * FROM community_border WHERE cm_b_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ResultSetMetaData rsmd = rs.getMetaData();
                for(int i=0; i< rsmd.getColumnCount(); i++){
                    list.add(rs.getObject(i+1));
                }
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

    //조회수 변경 메소드
    public int updateHits(int cm_b_code, int cm_b_hits){
        int result = -1;
        String sql = "UPDATE community_border SET cm_b_hits = ? WHERE (cm_b_code = ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_hits);
            pstmt.setInt(2, cm_b_code);
            result = pstmt.executeUpdate();
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

        return result;
    }

    //좋아요수 변경 메소드
    public int updateLikes(int cm_b_code, int cm_b_likes){
        int result = -1;
        String sql = "UPDATE community_border SET cm_b_likes = ? WHERE (cm_b_code = ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_likes);
            pstmt.setInt(2, cm_b_code);
            result = pstmt.executeUpdate();
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

        return result;
    }

    //싫어요수 변경 메소드
    public int updateDislikes(int cm_b_code, int cm_b_dislikes){
        int result = -1;
        String sql = "UPDATE community_border SET cm_b_dislikes = ? WHERE (cm_b_code = ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_dislikes);
            pstmt.setInt(2, cm_b_code);
            result = pstmt.executeUpdate();
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

        return result;
    }

    //작성글코드로 작성자 검색
    public String codeToMember(int cm_b_code){
        String member = null;
        String sql = "SELECT cm_b_member FROM community_border WHERE cm_b_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                member = rs.getString("cm_b_member");
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
        return member;
    }

    //특정 회원의 작성한 글갯수를 리턴하는 메소드
    public int memberToCount(String cm_b_member){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_border WHERE cm_b_member = ? AND cm_b_state = '등록'";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,cm_b_member);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }

    //특정 회원의 좋아요를 누른 글의 갯수를 리턴하는 메소드
    public int memberToLikeCount(String cm_b_member){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_likes WHERE cm_li_member = ? AND cm_li_state = 1";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,cm_b_member);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }

    //특정 회원의 싫어요를 누른 글의 갯수를 리턴하는 메소드
    public int memberToDisLikeCount(String cm_b_member){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_dislikes WHERE cm_dis_member = ? AND cm_dis_state = 1";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,cm_b_member);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }


    //특정회원이 작성한 모든글의 조회수
    public int memberToHits(String cm_b_member){
        int count = 0;
        String sql = "SELECT SUM(cm_b_hits) FROM community_border WHERE cm_b_member = ? AND cm_b_state = '등록'";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,cm_b_member);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }
    
    //특정 회원이 작성한 커뮤니티 글 갯수를 리턴하는 메소드
    public int upTimeMyBorderCount(String cm_b_member){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_border WHERE cm_b_member = ? AND cm_b_state = '등록'";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, cm_b_member);
            rs = pstmt.executeQuery();
            if (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }

    //특정 회원이 작성한 커뮤니티 글을 리턴하는 메소드
    public ArrayList<Community_border> selectMyBorder(String cm_b_member, int skipIndex, int countIndex){
        ArrayList<Community_border> list = new ArrayList<>();

        String sql = "SELECT * FROM community_border WHERE cm_b_member = ? AND cm_b_state = '등록' ORDER BY cm_b_date DESC LIMIT ?, ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, cm_b_member);
            pstmt.setInt(2, skipIndex);
            pstmt.setInt(3, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Community_border(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),
                        rs.getString(13),rs.getString(14)));
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

    //선택한 글 수정 메소드
    public int updateBorder(Community_border cm_b){
        int result = -1;
        String sql = "UPDATE community_border " +
                "SET cm_b_service = ?, cm_b_title = ?, cm_b_subTitle = ?, cm_b_genre1 = ?, cm_b_genre2 = ?, cm_b_content = ?, " +
                "cm_b_star = ? WHERE (cm_b_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, cm_b.getCm_b_service());
            pstmt.setString(2, cm_b.getCm_b_title());
            pstmt.setString(3, cm_b.getCm_b_subTitle());
            pstmt.setString(4, cm_b.getCm_b_genre1());
            pstmt.setString(5, cm_b.getCm_b_genre2());
            pstmt.setString(6, cm_b.getCm_b_content());
            pstmt.setInt(7, cm_b.getCm_b_star());
            pstmt.setInt(8, cm_b.getCm_b_code());
            result = pstmt.executeUpdate();
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
        return result;
    }

    //선택한 글 삭제 메소드
    public int deleteBorder(int cm_b_code){
        int result = -1;
        String sql = "UPDATE community_border " +
                "SET cm_b_state = '삭제' WHERE (cm_b_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, cm_b_code);
            result = pstmt.executeUpdate();
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
        return result;
    }
}
