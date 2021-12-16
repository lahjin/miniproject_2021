package javabean;

public class OTT {
    private int ott_code;
    private String ott_member;
    private String ott_service;
    private String ott_id;
    private String ott_pwd;

    public OTT(String ott_member, String ott_service, String ott_id, String ott_pwd) {
        this.ott_member = ott_member;
        this.ott_service = ott_service;
        this.ott_id = ott_id;
        this.ott_pwd = ott_pwd;
    }

    public OTT(int ott_code, String ott_member, String ott_service, String ott_id, String ott_pwd) {
        this.ott_code = ott_code;
        this.ott_member = ott_member;
        this.ott_service = ott_service;
        this.ott_id = ott_id;
        this.ott_pwd = ott_pwd;
    }

    public int getOtt_code() {
        return ott_code;
    }

    public void setOtt_code(int ott_code) {
        this.ott_code = ott_code;
    }

    public String getOtt_member() {
        return ott_member;
    }

    public void setOtt_member(String ott_member) {
        this.ott_member = ott_member;
    }

    public String getOtt_service() {
        return ott_service;
    }

    public void setOtt_service(String ott_service) {
        this.ott_service = ott_service;
    }

    public String getOtt_id() {
        return ott_id;
    }

    public void setOtt_id(String ott_id) {
        this.ott_id = ott_id;
    }

    public String getOtt_pwd() {
        return ott_pwd;
    }

    public void setOtt_pwd(String ott_pwd) {
        this.ott_pwd = ott_pwd;
    }
}
