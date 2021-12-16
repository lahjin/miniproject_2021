package member;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/MemberPoint")
public class MemberPoint extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        HttpSession session = request.getSession();

        String member_id = (String) session.getAttribute("member_id");
        int amount = Integer.parseInt(request.getParameter("amount"));

        ArrayList<Object> list = new MemberDAO().myInfo(member_id);

        String member_code = (String) list.get(0);
        int member_point = (int) list.get(13);

        int result = new MemberDAO().updateMemberPoint(member_code, member_point, amount);
        response.getWriter().print(result);
    }

}

