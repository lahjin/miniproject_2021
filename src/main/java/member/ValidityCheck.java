package member;

import javabean.Member;

import java.util.regex.Pattern;

public class ValidityCheck {

    public boolean signUpCheck(Member member){

        String idReg = "^[a-z0-9]{4,12}$";
        String pwdReg = "^(?=.*[A-Za-z])(?=.*\\d).{8,16}$";
        String nameReg = "^[a-zA-Z가-힣]{3,20}|[a-zA-Z]{2,10}\\s[a-zA-Z]{2,10}$";
        String nickReg = "^[A-Za-z0-9가-힣]{2,10}$";
        String emailReg = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
        String birthReg = "^(19|20)\\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$";
        String phoneReg = "^010-\\d{4}-\\d{4}$";

        Boolean[] checkList = new Boolean[8];

        checkList[0] = Pattern.matches(idReg,member.getMember_id());
        checkList[1] = Pattern.matches(pwdReg,member.getMember_pwd());
        checkList[2] = Pattern.matches(nameReg,member.getMember_name());
        checkList[3] = Pattern.matches(nickReg,member.getMember_nickname());
        checkList[4] = Pattern.matches(emailReg,member.getMember_email());
        checkList[5] = Pattern.matches(birthReg,member.getMember_birth());
        checkList[6] = member.getMember_gender().equals("남자") || member.getMember_gender().equals("여자");
        checkList[7] = Pattern.matches(phoneReg,member.getMember_phone());

        for (Boolean value: checkList) {
            if(!value){
                return false;
            }
        }

        return true;
    }
}
