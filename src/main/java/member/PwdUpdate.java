package member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PwdUpdate")
public class PwdUpdate extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String member_id = request.getParameter("member_id");
        String member_pwd = request.getParameter("member_pwd");
        String member_code = new MemberDAO().idToCode(member_id);

        int result = new MemberDAO().updatePwd(member_code, member_pwd);
        response.getWriter().print(result);
    }

}

