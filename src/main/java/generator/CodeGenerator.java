package generator;

import DB.ConnectDB;
import DB.MysqlMgr;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CodeGenerator {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    
    //회원코드 제너레이터
    public String memberCodeGenerator(String member_type) {
        //회원코드 만들기 밑작업
        DateGenerator dateGenerator = new DateGenerator();
        ArrayList<String> dateTimeList = dateGenerator.todayHex();

        //DB조회용
        String date = dateTimeList.get(0);

        //회원코드메이커
        String hexYear = dateTimeList.get(1);
        String hexMonthDay = dateTimeList.get(2);
        int today_count = 1; //오늘의 회원가입 수

        //오늘 날짜로 가입한 사람을 찾는 sql
        String sql = "SELECT member_signdate from member where member_signdate like ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, date + '%');
            rs = pstmt.executeQuery();
            while (rs.next()) {
                today_count++;
                //하루가입자수 초과
                if (today_count == 999) {
                    return "trafficOver";
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
        if (member_type.equals("관리자")) {
            return "A" + hexYear + hexMonthDay + String.format("%03d", today_count);
        } else {
            return "M" + hexYear + hexMonthDay + String.format("%03d", today_count);
        }
    }

    //파티코드 생성기
    public String partyCodeGenerator(String service_code) {
        DateGenerator dateGenerator = new DateGenerator();
        ArrayList<String> dateTimeList = dateGenerator.todayHex();

        String sql = "SELECT party_code FROM miniproject.party\n" +
                "WHERE party_service = ? AND party_start like ?;";

        String partyCode = null;
        int today_count = 1;

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, service_code);
            pstmt.setString(2, dateTimeList.get(0) + '%');
            rs = pstmt.executeQuery();
            while (rs.next()) {
                today_count++;
                if (today_count == 999) {
                    return "trafficOver";
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

        partyCode = service_code.substring(service_code.length() - 3, service_code.length()) +
                dateTimeList.get(1) + dateTimeList.get(2) + String.format("%03d", today_count);
        //파티코드는 서비스코드뒷3자리 + 현재년도(16진수) + 현재월일(16진수) + 오늘의 파티 생성
        return partyCode;
    }

    //엔트리 코드 생성기
    public String entryCodeGenerator(String party_code) {
        String entry_code = null;
        int count = 1;
        String sql = "SELECT * FROM entry WHERE entry_party = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, party_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count++;
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
        entry_code = party_code + "X" + String.format("%02d", count);
        return entry_code;
    }
}
