package generator;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class DateGenerator {
    

    //(아시아/서울)의 오늘 시간을 16진수로 변환하여 리턴해주는 메소드
    public ArrayList<String> todayHex(){
        ArrayList<String> dateTimeList = new ArrayList<>();

        ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Seoul")); //타임존(아시아/서울)의 현재시간

        String year = now.format(DateTimeFormatter.ofPattern("yyyy"));  //년도
        String month = now.format(DateTimeFormatter.ofPattern("MM"));   //월
        String day = now.format(DateTimeFormatter.ofPattern("dd"));     //일
        String monthDay = now.format(DateTimeFormatter.ofPattern("MMdd"));      //월일
        String today = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));   //오늘날짜

        //16진수 변환
        String hexYear = String.format("%3s", Integer.toHexString(Integer.parseInt(year))).replace(" ", "0");
        String hexMonthDay = String.format("%3s", Integer.toHexString(Integer.parseInt(monthDay))).replace(" ", "0");

        dateTimeList.add(today);
        dateTimeList.add(hexYear);
        dateTimeList.add(hexMonthDay);

        return dateTimeList;
    }
}
