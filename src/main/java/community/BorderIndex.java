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
            String[] member = new MemberDAO().memberPartyInfo(list.get(i).getCm_b_member());
            String[] service = new ServiceDAO().selectService(list.get(i).getCm_b_service());
            jsonObject = new JSONObject();
            jsonObject.put("cm_b_code",list.get(i).getCm_b_code());
            jsonObject.put("cm_b_nickname",member[0]);
            jsonObject.put("cm_b_grade", member[1]);
            jsonObject.put("cm_b_service",service[0]);
            jsonObject.put("cm_b_service_img",service[1]);
            jsonObject.put("cm_b_title",list.get(i).getCm_b_title());
            jsonObject.put("cm_b_subTitle",list.get(i).getCm_b_subTitle());
            jsonObject.put("cm_b_genre1",list.get(i).getCm_b_genre1());
            jsonObject.put("cm_b_genre2",list.get(i).getCm_b_genre2());
            jsonObject.put("cm_b_content",list.get(i).getCm_b_content());
            jsonObject.put("cm_b_star",list.get(i).getCm_b_star());
            jsonObject.put("cm_b_hits",list.get(i).getCm_b_hits());
            jsonObject.put("cm_b_likes",list.get(i).getCm_b_likes());
            jsonObject.put("cm_b_dislikes",list.get(i).getCm_b_dislikes());
            jsonObject.put("cm_b_date",list.get(i).getCm_b_date());
            jsonArray.add(jsonObject);
        }

        resp.getWriter().print(jsonArray);
    }
}