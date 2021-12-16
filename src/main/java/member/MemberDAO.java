package member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Member;

//member(회원) 테이블과 SQL하는 클래스
//DAO(Data Access Object) DB연결을 도와주는 클래스
public class MemberDAO{
    private static MemberDAO instance = new MemberDAO(); //인스턴스화 시키는 변수라는데 아직 쓰임새를 잘모름

    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //인스턴스화를 리턴 메소드
    public static MemberDAO getInstance() {
        return instance;
    }

    //로그인 메소드
    public int login(String member_id, String member_pwd) {
        String sql = "SELECT member_pwd FROM member WHERE member_id = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(member_pwd)) {
                    return 1; //로그인 성공시
                } else
                    return 0; //비밀번호 트림
            }
            return -1; //아이디 없음
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
        return -2; //DB연결 실패
    }

    //회원가입 메소드
    public boolean register(Member member) {
        String sql = "INSERT INTO `miniproject`.`member` (" +
                "`member_code`, `member_id`, `member_pwd`, `member_name`, " +
                "`member_email`, `member_phone`, `member_birth`, `member_gender`, `member_nickname`, `member_promotion`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member.getMember_code());
            pstmt.setString(2, member.getMember_id());
            pstmt.setString(3, member.getMember_pwd());
            pstmt.setString(4, member.getMember_name());
            pstmt.setString(5, member.getMember_email());
            pstmt.setString(6, member.getMember_phone());
            pstmt.setString(7, member.getMember_birth());
            pstmt.setString(8, member.getMember_gender());
            pstmt.setString(9, member.getMember_nickname());
            pstmt.setString(10, member.getMember_promotion());
            pstmt.executeUpdate();
            return true;
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
        return false;
    }

    //아이디 중복 체크
    public int idChecker(String member_id) {
        String sql = "SELECT member_id FROM miniproject.member WHERE member_id = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            if (rs.next()) return 1; //중복
            else return 0; //중복아님
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
        return -1;
    }

    //닉네임 중복 체크
    public int nicknameChecker(String member_nickname) {
        String sql = "SELECT member_nickname FROM miniproject.member WHERE member_nickname = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_nickname);
            rs = pstmt.executeQuery();
            if (rs.next()) return 1;
            else return 0;
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
        return -1;
    }

    //회원코드로 닉네임과 등급만 리턴해주는 메소드
    public String[] memberPartyInfo(String member_code) {
        String[] list = new String[2];
        String sql = "SELECT member_nickname, member_grade FROM member WHERE member_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list[0] = rs.getString("member_nickname");
                list[1] = rs.getString("member_grade");
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
                e.printStackTrace();
            }
        }
        return list;
    }

    //id로 닉네임을 찾아주는 메소드
    public String idToNickname(String member_id){
        String value = null;
        String sql = "SELECT member_nickname FROM member WHERE member_id = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                value = rs.getString("member_nickname");
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
                e.printStackTrace();
            }
        }
        return value;
    }

    //닉네임으로 회원코드를 리턴해주는 메소드
    public String nickNameToCode(String member_nickname){
        String value = null;
        String sql = "SELECT member_code FROM member WHERE member_nickname = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_nickname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                value = rs.getString("member_code");
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
                e.printStackTrace();
            }
        }
        return value;
    }

    //아이디로 회원코드를 리턴해주는 메소드
    public String idToCode(String member_id){
        String value = null;
        String sql = "SELECT member_code FROM member WHERE member_id = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                value = rs.getString("member_code");
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
                e.printStackTrace();
            }
        }
        return value;
    }

    //회원아이디로 전체 결과를 담는 메소드
    public ArrayList<Object> myInfo(String member_id){
        ArrayList<Object> list = new ArrayList<>();
        String sql = "SELECT * FROM member WHERE member_id = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_id);
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
                e.printStackTrace();
            }
        }
        return list;
    }

    //선호 OTT를 가져오는 메소드
    public String[] favoriteOTT(String member_code){
        String[] ott = new String[2];
        String sql = "SELECT p.party_service, COUNT(*) FROM party as p, entry as e " +
                "WHERE p.party_code = e.entry_party AND  e.entry_state = '가입' AND e.entry_member = ? " +
                "GROUP BY p.party_service " +
                "ORDER BY COUNT(*) DESC LIMIT 1";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ott[0] = rs.getString(1);
                ott[1] = rs.getString(2);
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
                e.printStackTrace();
            }
        }
        return ott;
    }

    //로그인로그를 바꿔주는 메소드
    public int updateMemberLog(String datetime, String member_code){
        int result = -1;
        String sql = "UPDATE member SET member_log = ? WHERE (member_code = ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, datetime);
            pstmt.setString(2,member_code);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
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

    //회원등급점수 상위 50위 추산 메소드 (닉네임/점수)
    public String[][] rank50List(){
        String[][] rank = new String[50][2];
        String sql = "SELECT member_nickname, member_grade FROM member " +
                "WHERE member_type = '일반' " +
                "ORDER BY member_grade DESC LIMIT 50";
        int row = 0, col = 0;

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                rank[row][col++] = rs.getString("member_nickname");
                rank[row++][col] = rs.getString("member_grade");
                col = 0;
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
                e.printStackTrace();
            }
        }
        return rank;
    }
    //현재 비밀번호를 리턴하는 메소드
    public String nowPwd(String member_code){
        String pwd = null;
        String sql = "SELECT member_pwd FROM member WHERE member_code = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                pwd = rs.getString(1);
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
                e.printStackTrace();
            }
        }
        return pwd;
    }

    //비밀번호 변경 메소드
    public int updatePwd(String member_code, String member_pwd){
        int result = -1;
        String sql = "UPDATE member " +
                "SET member_pwd = ? WHERE (member_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_pwd);
            pstmt.setString(2, member_code);
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

    //닉네임 변경 메소드
    public int updateNickname(String member_code, String member_nickname){
        int result = -1;
        String sql = "UPDATE member " +
                "SET member_nickname = ? WHERE (member_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_nickname);
            pstmt.setString(2, member_code);
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

    //회원 탈퇴 메소드
    public int deleteMember(String member_code){
        int result = -1;
        String sql = "UPDATE member " +
                "SET member_status = '탈퇴' WHERE (member_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, member_code);
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

    //포인트 변경 메소드
    public int updateMemberPoint(String member_code, int member_point ,int amount){
        int result = -1;
        String sql = "UPDATE member " +
                "SET member_point = ? WHERE (member_code = ?);";

        int total = amount + member_point;
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,total);
            pstmt.setString(2, member_code);
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

    //랭킹포인트 변경 메소드
    public int updateMemberGrade(String member_code, int addGrade){
        int result = -1;
        String sql = "UPDATE member SET member_grade = ? WHERE (member_code = ?)";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,addGrade);
            pstmt.setString(2, member_code);
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
