package party;

import DB.ConnectDB;
import DB.MysqlMgr;
import generator.DateGenerator;
import javabean.Party;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PartyDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성


    //선택한 서비스의 생성된 파티 전체를 list에 저장하는 메소드
    public ArrayList<Party> selectParty(String service_code) {
        ArrayList<Party> list = new ArrayList<>();
        String sql = "SELECT * FROM party WHERE party_service = ? AND party_state = '모집중'";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, service_code);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Party(rs.getString("party_code"), rs.getString("party_member"), rs.getString("party_service"),
                        rs.getString("party_start"), rs.getString("party_end"), rs.getInt("party_period"),
                        rs.getInt("party_now"), rs.getInt("party_total"), rs.getString("party_state")));
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

    //선택한 서비스의 생성된 파티를 일정 갯수만 list에 저장하는 메소드
    public ArrayList<Party> selectParty(String service_code, int skipIndex, int count){
        ArrayList<Party> list = new ArrayList<>();
        String sql = "SELECT * FROM party WHERE party_service = ? AND party_state = '모집중' ORDER BY party_start LIMIT ?,?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, service_code);
            pstmt.setInt(2,skipIndex);
            pstmt.setInt(3,count);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Party(rs.getString("party_code"), rs.getString("party_member"), rs.getString("party_service"),
                        rs.getString("party_start"), rs.getString("party_end"), rs.getInt("party_period"),
                        rs.getInt("party_now"), rs.getInt("party_total"), rs.getString("party_state")));
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
    //파티만들기 메소드
    public boolean createParty(String party_code, String party_member, String party_service, int party_period, int party_total) {

        String sql = "INSERT INTO `party` (" +
                "`party_code`, `party_member`, `party_service`, `party_period`, `party_total`) " +
                "VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, party_code);
            pstmt.setString(2, party_member);
            pstmt.setString(3, party_service);
            pstmt.setInt(4, party_period);
            pstmt.setInt(5, party_total);
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

    //현재 파티원과 모집인원을 리턴해주는 메소드
    public int[] partyInfo(String party_code){
        int[] count = new int[2];
        String sql = "SELECT party_now, party_total FROM party WHERE party_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, party_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count[0] = rs.getInt("party_now");
                count[1] = rs.getInt("party_total");
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

    //파티원이 추가되었을때 +1 시켜주는 메소드
    public void plusMember(int party_now, String party_code){
        String sql = "UPDATE party SET party_now = ? WHERE party_code = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,party_now);
            pstmt.setString(2, party_code);
            pstmt.executeUpdate();
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
    }

    //선택한 서비스의 모집중인 파티의 총 갯수를 리턴해주는 메소드
    public int upTimePartyCount(String party_code){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM party WHERE party_service = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, party_code);
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

    //파티모집이 완료되었을때 파티상태를 모집완료로 변경하는 메소드
    public void partyComplete(String party_code){
        String sql = "UPDATE party SET party_state = ? WHERE party_code = ? AND party_now = party_total";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, "모집완료");
            pstmt.setString(2, party_code);
            pstmt.executeUpdate();
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
    }
}
