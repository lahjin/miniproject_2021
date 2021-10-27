package entry;


import javabean.Entry;
import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EntryCheck")
public class EntryCheck extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; charset=utf-8");
        response.setContentType("application/json; charset=UTF-8");

        String party_code = request.getParameter("party_code");

        ArrayList<Entry> list = new EntryDAO().entryPartyList(party_code);


        JSONObject jsonObject;
        JSONArray jsonArray = new JSONArray();
        int cnt = 0;

        for (Entry entry: list){
            String[] member = new MemberDAO().memberPartyInfo(list.get(cnt).getEntry_member());

            jsonObject = new JSONObject();
            jsonObject.put("entry_code", entry.getEntry_code());
            jsonObject.put("member_nickname", member[0]);
            jsonObject.put("entry_date", entry.getEntry_date());
            jsonArray.add(jsonObject);

            cnt++;
        }

        response.getWriter().print(jsonArray);
    }

}