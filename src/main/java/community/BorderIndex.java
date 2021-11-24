package community;

import javabean.Community_border;
import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import service.ServiceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/BorderIndex")
public class BorderIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        int skipIndex = Integer.parseInt(req.getParameter("skipIndex"));
        int countIndex = Integer.parseInt(req.getParameter("countIndex"));
        ArrayList<Community_border> list = new Community_borderDAO().selectBorder(skipIndex, countIndex);

        JSONObject jsonObject;
        JSONArray jsonArray = new JSONArray();

        for (int i=0; i<list.size(); i++){
            jsonObject = new JSONObject();
            jsonObject.put("cm_b_code",list.get(i).getCm_b_code());
            jsonArray.add(jsonObject);
        }

        resp.getWriter().print(jsonArray);
    }
}