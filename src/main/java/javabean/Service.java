package javabean;

//  Entity/bean 클래스
//  DB로 연결하기전에 데이터 관리를 쉽게 도와주는 클래스
public class Service {
    private String service_code; //서비스코드
    private String service_name; //서비스명
    private String service_img;  //서비스이미지경로
    private int service_price;   //서비스가격
    public Service(String service_code, String service_name, String service_img, int service_price) {
        this.service_code = service_code;
        this.service_name = service_name;
        this.service_img = service_img;
    }

    public String getService_code() {
        return service_code;
    }

    public void setService_code(String service_code) {
        this.service_code = service_code;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public String getService_img() {
        return service_img;
    }

    public void setService_img(String service_img) {
        this.service_img = service_img;
    }

    public int getService_price() {
        return service_price;
    }

    public void setService_price(int service_price) {
        this.service_price = service_price;
    }
}
