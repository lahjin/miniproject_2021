package ott;

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

@WebServlet("/OTTSelect")
public class OTTSelect extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        int ott_code = Integer.parseInt(req.getParameter("ott_code"));


        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        ArrayList<OTT> ott = new OTTDAO().codeToOtt(ott_code);

        for (int i=0; i<ott.size(); i++){
            jsonObject = new JSONObject();
            jsonObject.put("ott_id",ott.get(i).getOtt_id());
            jsonObject.put("ott_pwd",ott.get(i).getOtt_pwd());
            jsonArray.add(jsonObject);
        }

        resp.getWriter().print(jsonArray);
    }

}

