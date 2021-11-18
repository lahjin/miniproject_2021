package community;

import javabean.Community_border;
import member.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BorderWrite")
public class BorderWrite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        String cm_b_member = req.getParameter("cm_b_member");
        String cm_b_service = req.getParameter("cm_b_service");
        String cm_b_title = req.getParameter("cm_b_title");
        String cm_b_subTitle = req.getParameter("cm_b_subTitle");
        String cm_b_genre1 = req.getParameter("cm_b_genre1");
        String cm_b_genre2 = req.getParameter("cm_b_genre2");
        String cm_b_content = req.getParameter("cm_b_content");
        int cm_b_star = Integer.parseInt(req.getParameter("cm_b_star"));

        cm_b_member = new MemberDAO().nickNameToCode(cm_b_member);

        System.out.println(cm_b_member);
        System.out.println(cm_b_service);
        System.out.println(cm_b_title);
        System.out.println(cm_b_subTitle);
        System.out.println(cm_b_genre1);
        System.out.println(cm_b_genre2);
        System.out.println(cm_b_content);
        System.out.println(cm_b_star);

        Community_border cm_b = new Community_border(cm_b_member,cm_b_service,cm_b_title,cm_b_subTitle,cm_b_genre1,cm_b_genre2,cm_b_content,cm_b_star);

        int result = new Community_borderDAO().borderWrite(cm_b);
        resp.getWriter().print(result);
    }
}