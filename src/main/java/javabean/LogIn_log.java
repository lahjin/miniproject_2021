package javabean;

public class LogIn_log {
    private int log_code;
    private String log_member;
    private String log_date;
    private String log_ip;

    public LogIn_log(int log_code, String log_member, String log_date, String log_ip) {
        this.log_code = log_code;
        this.log_member = log_member;
        this.log_date = log_date;
        this.log_ip = log_ip;
    }

    public int getLog_code() {
        return log_code;
    }

    public void setLog_code(int log_code) {
        this.log_code = log_code;
    }

    public String getLog_member() {
        return log_member;
    }

    public void setLog_member(String log_member) {
        this.log_member = log_member;
    }

    public String getLog_date() {
        return log_date;
    }

    public void setLog_date(String log_date) {
        this.log_date = log_date;
    }

    public String getLog_ip() {
        return log_ip;
    }

    public void setLog_ip(String log_ip) {
        this.log_ip = log_ip;
    }
}
