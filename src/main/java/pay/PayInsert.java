package pay;

import javabean.Member;
import javabean.Pay;
import member.MemberDAO;
import party.PartyDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/PayInsert")
public class PayInsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");

        String pay_id = req.getParameter("pay_id");
        String pay_member = new MemberDAO().idToCode(member_id);
        String pay_merchantUid = req.getParameter("pay_merchantUid");
        String pay_applyNum = req.getParameter("pay_applyNum");
        String pay_amount = req.getParameter("pay_amount");

        Pay pay = new Pay(pay_id,pay_member,pay_merchantUid,pay_applyNum,pay_amount);

        int result = new PayDAO().insertPay(pay);

        ArrayList<Object> member = new MemberDAO().myInfo(member_id);

        int addPoint = (int)member.get(9) + 21;
        int grade = new MemberDAO().updateMemberGrade(pay_member, addPoint);

        resp.getWriter().print(result);
    }
}
