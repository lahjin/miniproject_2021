package ask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AskWrite")
public class AskWrite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        String ask_member = req.getParameter("ask_member");
        String ask_title = req.getParameter("ask_title");
        String ask_content = req.getParameter("ask_content");

        int result = new AskDAO().askWrite(ask_member,ask_title,ask_content);

        if(result == 1){
            //RequestDispatcher dispatcher = req.getRequestDispatcher("dataAction.jsp?info=5&msg=1");
            resp.sendRedirect("dataAction.jsp?info=5&msg=1");
        }else{
            //RequestDispatcher dispatcher = req.getRequestDispatcher("dataAction.jsp?info=5&msg=0");
            resp.sendRedirect("dataAction.jsp?info=5&msg=0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
