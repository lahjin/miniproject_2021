package ott;

import com.mysql.cj.xdevapi.JsonArray;
import javabean.OTT;
import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/OTTList")
public class OTTList extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        String member_id = (String) session.getAttribute("member_id");
        String member_code = new MemberDAO().idToCode(member_id);

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        ArrayList<OTT> ott = new OTTDAO().memberToAllList(member_code);

        for (int i=0; i<ott.size(); i++){
            jsonObject = new JSONObject();
            jsonObject.put("ott_code",ott.get(i).getOtt_code());
            jsonArray.add(jsonObject);
        }

        resp.getWriter().print(jsonArray);
    }

}

