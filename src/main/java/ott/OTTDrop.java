package ott;

import javabean.OTT;
import member.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/OTTDrop")
public class OTTDrop extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        int ott_code = Integer.parseInt(req.getParameter("ott_code"));

        int result = new OTTDAO().dropOTT(ott_code);

        if(result == 1){
            resp.getWriter().print("dataAction.jsp?info=3&msg=1");
        }else{
            resp.getWriter().print("dataAction.jsp?info=3&msg=1");
        }
    }

}

