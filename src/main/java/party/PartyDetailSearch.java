package party;


import javabean.Party;
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

@WebServlet("/PartyDetailSearch")
public class PartyDetailSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        String service_code = req.getParameter("service_code");
        int skipIndex = Integer.parseInt(req.getParameter("skipIndex"));
        int countIndex = Integer.parseInt(req.getParameter("countIndex"));

        ArrayList<Party> list = new PartyDAO().selectParty(service_code,skipIndex,countIndex);
        String[] service = new ServiceDAO().selectService(service_code);

        JSONObject jsonObject;
        JSONArray jsonArray = new JSONArray();

        for (int i=0; i<list.size(); i++){
            int fee = (int) (Math.ceil(Integer.parseInt(service[2]) / 100 / list.get(i).getParty_total())*100 + 500);
            fee = Integer.parseInt(String.format("%4d", fee));

            jsonObject = new JSONObject();
            jsonObject.put("party_code",list.get(i).getParty_code());
            jsonObject.put("party_leader",list.get(i).getParty_member());
            jsonObject.put("party_service",list.get(i).getParty_service());
            jsonObject.put("party_period",list.get(i).getParty_period());
            jsonObject.put("party_start",list.get(i).getParty_start());
            jsonObject.put("party_price", fee);
            jsonObject.put("party_now",list.get(i).getParty_now());
            jsonObject.put("party_total",list.get(i).getParty_total());
            jsonObject.put("party_state",list.get(i).getParty_state());
            jsonArray.add(jsonObject);
        }

        resp.getWriter().print(jsonArray);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
