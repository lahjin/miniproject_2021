package party;


import javabean.Party;
import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import service.ServiceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/PartyCodeSearch")
public class PartyCodeSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        String member_id = (String) session.getAttribute("member_id");
        String member_code = new MemberDAO().idToCode(member_id);

        String party_state = req.getParameter("party_state");
        int skipIndex = Integer.parseInt(req.getParameter("skipIndex"));
        int countIndex = Integer.parseInt(req.getParameter("countIndex"));
        ArrayList<String> useParty = new PartyDAO().usedPartyList(member_code,party_state,skipIndex,countIndex);

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;

        for (int i=0; i< useParty.size(); i++){
            ArrayList<Party> partyInfo = new PartyDAO().getPartyInfo(useParty.get(i));
            String[] service = new ServiceDAO().selectService(partyInfo.get(0).getParty_service());
            String[] member = new MemberDAO().memberPartyInfo(partyInfo.get(0).getParty_member());
            jsonObject = new JSONObject();
            jsonObject.put("code", useParty.get(i));
            jsonObject.put("name", service[0]);
            jsonObject.put("img", service[1]);
            jsonObject.put("leader", member[0]);
            jsonArray.add(jsonObject);
        }
        resp.getWriter().print(jsonArray);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
