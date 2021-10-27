package javabean;

public class Entry {
    private String entry_code;      //참가자코드
    private String entry_party;     //참가자파티코드
    private String entry_member;    //참가자회원코드
    private String entry_date;      //참가일

    public Entry(String entry_code, String entry_party, String entry_member, String entry_date) {
        this.entry_code = entry_code;
        this.entry_party = entry_party;
        this.entry_member = entry_member;
        this.entry_date = entry_date;
    }

    public String getEntry_code() {
        return entry_code;
    }

    public void setEntry_code(String entry_code) {
        this.entry_code = entry_code;
    }

    public String getEntry_party() {
        return entry_party;
    }

    public void setEntry_party(String entry_party) {
        this.entry_party = entry_party;
    }

    public String getEntry_member() {
        return entry_member;
    }

    public void setEntry_member(String entry_member) {
        this.entry_member = entry_member;
    }

    public String getEntry_date() {
        return entry_date;
    }

    public void setEntry_date(String entry_date) {
        this.entry_date = entry_date;
    }
}
