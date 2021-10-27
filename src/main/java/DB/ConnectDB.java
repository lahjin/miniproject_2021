/*
    데이터베이스 연결 기본 파일
    추상클래스로 만들어서 여러 DB에 대응가능
 */
package DB;
import java.sql.Connection;

public abstract class ConnectDB {
    private Connection conn = null;

    //웹페이지 최초실행을 했는가 여부를 저장하는 변수 DB연결 할때마다 값이 일정해야하므로 static으로 선언했음
    private static boolean webIsRunning = false; 

    public ConnectDB() {
        ConnectionDBMgr();
    }

    //conn getter
    public Connection getConn() {
        return conn;
    }
    //conn setter
    public void setConn(Connection con) {
        this.conn = con;
    }

    //webIsRunning getter
    public static boolean isWebIsRunning() {
        return webIsRunning;
    }
    //webIsRunning setter
    public static void setWebIsRunning(boolean webIsRunning) {
        ConnectDB.webIsRunning = webIsRunning;
    }

    //추상클래스
    abstract void ConnectionDBMgr(); //DB연결
    abstract void CreateSchemaMgr(); //스키마생성
    abstract void CreateTableMgr(); //테이블 생성
}
