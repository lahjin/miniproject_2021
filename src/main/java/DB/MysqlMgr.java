package DB;

import java.sql.*;

public class MysqlMgr extends ConnectDB {
    
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    String driver = "com.mysql.jdbc.Driver"; //DB driver
    String url = "jdbc:mysql://localhost/"; //DB url
    String database = "miniproject"; //DB에 사용될 database(schema)
    //mysql 최신버전(8.0) 사용시 필수로 작성
    String version8 = "?useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&serverTimezone=Asia/Seoul&useSSL=false";

    String id = "root"; //DB에 사용될 ID
    String pwd = "mysql"; //DB password
    String schema = "information_schema"; //mysql에 현재 존재하는 schema를 확인하는 database(schema)영역

    //생성자
    public MysqlMgr() {
        //webIsRunning이 최초실행시 false므로 !가 붙어서 true가 된다
//        if (!isWebIsRunning()) {
//            CreateSchemaMgr(); //schema 생성메소드 실행
//            System.out.println("최초실행으로 schema가 있는지 확인하고 없으면 생성했습니다.");
//        }
        ConnectionDBMgr(); //DB연결 메소드
    }

    //DB연결 메소드
    @Override
    void ConnectionDBMgr() {
        try {
            Class.forName(driver);
            setConn(DriverManager.getConnection(url + database + version8, id, pwd));
            //최초 실행시 false이므로 !가 붙어서 실행댐
//            if (!isWebIsRunning()){
//                CreateTableMgr(); //table 생성 메소드
//                setWebIsRunning(true); //webIsRunning의 값을 true로 바꿔줌
//            }
        } catch (ClassNotFoundException e) {
            System.out.println("Mysql 드라이버를 찾을 수 없습니다.");
        } catch (SQLException e) {
            System.out.println("Error: Mysql 연결에 실패하였습니다.");
        } catch (Exception e) {
        }
    }

    //database(schema)가 없을때 생성해주는 메소드 이미 database(schema)가 있으면 생성하지 않음
    @Override
    void CreateSchemaMgr() {
        try {
            Class.forName(driver);
            System.out.println("Mysql 드라이버 적재 성공");
            setConn(DriverManager.getConnection(url + schema + version8, id, pwd));
            System.out.println("Mysql: " + schema + " 데이터베이스 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("Mysql 드라이버를 찾을 수 없습니다.");
        } catch (SQLException e) {
            System.out.println("Error: Mysql 연결에 실패하였습니다.");
        } catch (Exception e) {
        }
        String dbSql = "SELECT * FROM Information_schema.SCHEMATA WHERE SCHEMA_NAME = ?";
        try {
            pstmt = getConn().prepareStatement(dbSql);
            pstmt.setString(1, database);
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                String sql = "CREATE database IF NOT EXISTS " + database;
                pstmt = getConn().prepareStatement(sql);
                pstmt.executeUpdate();
                boolean schemaCheck = pstmt.execute();
                if (!schemaCheck) System.out.println("데이터베이스 생성 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
                if(rs!=null)rs.close();
                if(pstmt!=null)pstmt.close();
                if(getConn()!=null)getConn().close();
            } catch (Exception e) {
            }
        }
    }

    //table이 없을때 생성해주는 메소드
    //이 메소드에는 다른메소드로 테이블을 생성해서 담기만 할것
    @Override
    void CreateTableMgr() {
        CreateTableMember();
    }

    //member(회원) 테이블 생성 메소드 이미 테이블이 있다면 생성하지 않음
    void CreateTableMember() {
        //table 생성 sql문
        String sql = "CREATE TABLE IF NOT EXISTS + `member` (\n" +
                "  `member_code` varchar(10) NOT NULL,\n" +
                "  `member_id` varchar(12) NOT NULL,\n" +
                "  `member_pwd` varchar(16) NOT NULL,\n" +
                "  `member_name` varchar(45) NOT NULL,\n" +
                "  `member_email` varchar(45) NOT NULL,\n" +
                "  `member_phone` varchar(11) NOT NULL,\n" +
                "  `member_birth` date NOT NULL,\n" +
                "  `member_gender` varchar(2) NOT NULL,\n" +
                "  `member_nickname` varchar(20) NOT NULL,\n" +
                "  `member_grade` varchar(10) NOT NULL DEFAULT '기본',\n" +
                "  `member_signdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,\n" +
                "  `member_status` varchar(4) NOT NULL DEFAULT '정상',\n" +
                "  `member_type` varchar(6) NOT NULL DEFAULT '일반',\n" +
                "  PRIMARY KEY (`member_code`),\n" +
                "  UNIQUE KEY `member_id_UNIQUE` (`member_id`)\n" +
                ")\n";
        try {
            pstmt = getConn().prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)rs.close();
                if(pstmt!=null)pstmt.close();
                if(getConn()!=null)getConn().close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }
}
