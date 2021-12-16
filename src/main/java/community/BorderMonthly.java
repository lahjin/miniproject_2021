package community;

import dataStructure.MyArrayList;
import javabean.Community_border;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/BorderMonthly")
public class BorderMonthly extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        int countIndex = Integer.parseInt(req.getParameter("countIndex"));
        ArrayList<Community_border> list = new Community_borderDAO().monthlyTopLikes(countIndex);

        JSONObject jsonObject;
        JSONArray jsonArray = new JSONArray();

        MyArrayList<Object> myArrayList = new MyArrayList<>();

        for(Community_border cm_b: list){
            jsonObject = new JSONObject();
            jsonObject.put("cm_b_code", cm_b.getCm_b_code());
            jsonArray.add(jsonObject);

            myArrayList.add(jsonObject);
        }

        resp.getWriter().print(myArrayList.myJson());
    }
}
