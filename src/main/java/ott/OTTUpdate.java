package ott;

import javabean.OTT;
import member.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/OTTUpdate")
public class OTTUpdate extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        String member_id = (String) session.getAttribute("member_id");
        String member_code = new MemberDAO().idToCode(member_id);
        int ott_code = Integer.parseInt(req.getParameter("ott_code"));
        String ott_id = req.getParameter("ott_id");
        String ott_pwd = req.getParameter("ott_pwd");
        String ott_service = req.getParameter("ott_service");

        OTT ott = new OTT(ott_code,member_code,ott_service,ott_id,ott_pwd);

        int result = new OTTDAO().updateOTT(ott);

        if(result == 1){
            resp.sendRedirect("dataAction.jsp?info=2&msg=1");
        }else{
            resp.sendRedirect("dataAction.jsp?info=2&msg=0");
        }
    }

}

