package community;

import member.MemberDAO;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/BorderDislike")
public class BorderDislike extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        int cm_b_code = Integer.parseInt(req.getParameter("cm_b_code"));
        String member_id = req.getParameter("member_id");

        String cm_b_member = new Community_borderDAO().codeToMember(cm_b_code);
        String member_code = new MemberDAO().idToCode(member_id);

        JSONObject jsonObject = new JSONObject();
        //본인글에 싫어요를 누름
        if(cm_b_member.equals(member_code)){
            jsonObject.put("state","self");
            resp.getWriter().print(jsonObject);
            return;
        }

        int[] cm_dis = new Community_dislikesDAO().cmDislikesChecker(cm_b_code,member_code);
        int dislikeCount = 0;
        int result = -1;
        //싫어요를 누른적이 없음
        if(cm_dis[0] == 0){
            result = new Community_dislikesDAO().dislikeBorder(cm_b_code, member_code);
            jsonObject.put("like",1);

            ArrayList<Object> member = new MemberDAO().myInfo(member_id);

            int addPoint = (int)member.get(9) + 1;
            int grade = new MemberDAO().updateMemberGrade(member_code,addPoint);
        }
        //싫어요를 누른적이 있음
        else{
            //싫어요한 상태
            if(cm_dis[1] == 1){
                result = new Community_dislikesDAO().dislikeStateChange(cm_dis[0], 0);
                jsonObject.put("like",0);
            }
            //싫어요를 해제한 상태
            else if(cm_dis[1] == 0){
                result = new Community_dislikesDAO().dislikeStateChange(cm_dis[0], 1);
                jsonObject.put("like",1);
            }
        }

        switch (result){
            case 0:
                jsonObject.put("state", "fail");
                break;
            case 1:
                dislikeCount = new Community_dislikesDAO().countDislikes(cm_b_code);
                new Community_borderDAO().updateDislikes(cm_b_code, dislikeCount);
                jsonObject.put("state","success");
                jsonObject.put("count", dislikeCount);
                break;
            case -1:
                jsonObject.put("state", "internetError");
                break;
        }
        resp.getWriter().print(jsonObject);
    }
}
