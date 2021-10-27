package javabean;

public class Party {
    String party_code;      //코드
    String party_member;    //리더 FK:member_code
    String party_service;   //서비스 FK:service_code
    String party_start;     //시작일
    String party_end;       //종료일
    int party_period;       //기간
    int party_now;          //현재인원
    int party_total;        //총모집원수
    String party_state;     //상태

    public Party(String party_code, String party_member, String party_service, String party_start, String party_end,
                 int party_period, int party_now, int party_total, String party_state) {
        this.party_code = party_code;
        this.party_member = party_member;
        this.party_service = party_service;
        this.party_start = party_start;
        this.party_end = party_end;
        this.party_period = party_period;
        this.party_now = party_now;
        this.party_total = party_total;
        this.party_state = party_state;
    }

    public String getParty_code() {
        return party_code;
    }

    public void setParty_code(String party_code) {
        this.party_code = party_code;
    }

    public String getParty_member() {
        return party_member;
    }

    public void setParty_member(String party_member) {
        this.party_member = party_member;
    }

    public String getParty_service() {
        return party_service;
    }

    public void setParty_service(String party_service) {
        this.party_service = party_service;
    }

    public String getParty_start() {
        return party_start;
    }

    public void setParty_start(String party_start) {
        this.party_start = party_start;
    }

    public String getParty_end() {
        return party_end;
    }

    public void setParty_end(String party_end) {
        this.party_end = party_end;
    }

    public int getParty_period() {
        return party_period;
    }

    public void setParty_period(int party_period) {
        this.party_period = party_period;
    }

    public int getParty_now() {
        return party_now;
    }

    public void setParty_now(int party_now) {
        this.party_now = party_now;
    }

    public int getParty_total() {
        return party_total;
    }

    public void setParty_total(int party_total) {
        this.party_total = party_total;
    }

    public String getParty_state() {
        return party_state;
    }

    public void setParty_state(String party_state) {
        this.party_state = party_state;
    }
}
