package member;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/MemberCashInfo")
public class MemberCashInfo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        HttpSession session = request.getSession();

        String member_id = (String) session.getAttribute("member_id");
        ArrayList<Object> list = new MemberDAO().myInfo(member_id);

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("member_email", list.get(4));
        jsonObject.put("member_name", list.get(3));
        jsonObject.put("member_phone", list.get(5));

        jsonArray.add(jsonObject);
        response.getWriter().print(jsonArray);
    }

}

