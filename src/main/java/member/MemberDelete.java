package member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/MemberDelete")
public class MemberDelete extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String member_id = request.getParameter("member_id");
        String member_code = new MemberDAO().idToCode(member_id);

        int rs = new MemberDAO().deleteMember(member_code);

        response.getWriter().print(rs);
    }

}

