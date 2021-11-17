package party;

import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PartySimpleSearch")
public class PartySimpleSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        String member_code = req.getParameter("member_code");

        JSONObject jsonObject;
        JSONArray jsonArray = new JSONArray();

        String[] memberInfo = new MemberDAO().memberPartyInfo(member_code);
        jsonObject = new JSONObject();
        jsonObject.put("member_nickName", memberInfo[0]);
        jsonObject.put("member_grade", memberInfo[1]);
        jsonArray.add(jsonObject);

        resp.getWriter().print(jsonArray);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
