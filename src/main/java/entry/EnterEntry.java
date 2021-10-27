package entry;

import generator.CodeGenerator;
import member.MemberDAO;
import party.PartyDAO;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EnterEntry")
public class EnterEntry extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        //ajax로 받은 값
        String party_code = request.getParameter("entry_party");
        String entry_leader = request.getParameter("entry_leader");

        //entry_leader의 회원코드
        String leader_member_code = new MemberDAO().nickNameToCode(entry_leader);

        //세션에 저장된 값을 불러옴
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");

        //세션에 저장된 member_id로 member_code를 받아옴
        String member_code = new MemberDAO().idToCode(member_id);

        int result;
        //파티장과 로그인한 계정이 같음
        if(member_code.equals(leader_member_code)){
            result = -1;
        }else{
            result = new EntryDAO().checkEntry(member_code, party_code);
            //1이면 이미 가입한 파티
            //0이면 가입 가능한 파티
            if(result == 0){
                int[] nowInfo = new PartyDAO().partyInfo(party_code);
                System.out.println("now: " + nowInfo[0]);
                System.out.println("total: "+ nowInfo[1]);
                if(nowInfo[0] == nowInfo[1]){
                    result = -2;
                }else if(nowInfo[0] < nowInfo[1]){
                    String entry_code = new CodeGenerator().entryCodeGenerator(party_code);
                    new EntryDAO().addEntry(entry_code,party_code,member_code);
                    new PartyDAO().plusMember(nowInfo[0]+1,party_code);
                }
            }
        }

        response.getWriter().print(result + "");

    }

}