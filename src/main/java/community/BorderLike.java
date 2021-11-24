package community;

import member.MemberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BorderLike")
public class BorderLike extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        int cm_b_code = Integer.parseInt(req.getParameter("cm_b_code"));
        String member_id = req.getParameter("member_id");

        String cm_b_member = new Community_borderDAO().codeToMember(cm_b_code);
        String member_code = new MemberDAO().idToCode(member_id);

        JSONObject jsonObject = new JSONObject();
        //본인글에 좋아요를 누름
        if(cm_b_member.equals(member_code)){
            jsonObject.put("state","self");
            resp.getWriter().print(jsonObject);
            return;
        }

        int[] cm_li = new Community_likesDAO().cmLikesChecker(cm_b_code,member_code);
        int likeCount = 0;
        int result = -1;
        //좋아요를 누른적이 없음
        if(cm_li[0] == 0){
            result = new Community_likesDAO().likeBorder(cm_b_code, member_code);
            jsonObject.put("like",1);
        }
        //좋아요를 누른적이 있음
        else{
            //좋아요한 상태
            if(cm_li[1] == 1){
                result = new Community_likesDAO().likeStateChange(cm_li[0], 0);
                jsonObject.put("like",0);
            }
            //좋아요를 해제한 상태
            else if(cm_li[1] == 0){
                result = new Community_likesDAO().likeStateChange(cm_li[0], 1);
                jsonObject.put("like",1);
            }
        }
        
        switch (result){
            case 0:
                jsonObject.put("state", "fail");
                break;
            case 1:
                likeCount = new Community_likesDAO().countLikes(cm_b_code);
                new Community_borderDAO().updateLikes(cm_b_code, likeCount);
                jsonObject.put("state","success");
                jsonObject.put("count", likeCount);
                break;
            case -1:
                jsonObject.put("state", "internetError");
                break;
        }
        resp.getWriter().print(jsonObject);
    }
}
