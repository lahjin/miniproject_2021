package member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import DB.ConnectDB;
import DB.MysqlMgr;
import generator.DateGenerator;
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
                "`member_email`, `member_phone`, `member_birth`, `member_gender`, `member_nickname`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
    
    //아래부턴 임시영역
    //임시 관리자 계정 만들기 메소드
    public int makeAdmin() {
        String selectSQL = "select member_code from member where member_code = 'A7e53a2001'";
        String insertSQL = "INSERT INTO `miniproject`.`member` (" +
                "`member_code`, `member_id`, `member_pwd`, `member_name`, `member_email`, " +
                "`member_phone`, `member_birth`, `member_gender`, `member_nickname`, " +
                "`member_grade`, `member_type`)" +
                "VALUES ('A7e53a2001', 'admin', 'admin123', '관리자', 'admin@gmail.com', " +
                "'01012345678', '2021-09-30', '남', '이스트레이터', '관리', '관리자');\n";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(selectSQL);
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                pstmt = mysqlDB.getConn().prepareStatement(insertSQL);
                pstmt.executeUpdate();
                return 0; //관리자 계정 생성 성공
            }
            return 1; //이미 존재함 생성 실패
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (mysqlDB.getConn() != null) mysqlDB.getConn().close();
            } catch (Exception e) {
            }
        }
        return -1; //db연결 끊김
    }
}
