<%@ page import="community.Community_borderDAO" %>
<%@ page import="com.sun.javadoc.MemberDoc" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.Community_border" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    String member_code = new MemberDAO().idToCode(member_id);
    int writtenCount = new Community_borderDAO().memberToCount(member_code);
    int likeCount = new Community_borderDAO().memberToLikeCount(member_code);
    int dislikeCount = new Community_borderDAO().memberToDisLikeCount(member_code);
    int hitsCount = new Community_borderDAO().memberToHits(member_code);
%>
<div class="contents-box">
    <!-- 현재 파티에 대한 div -->
    <div class="now-party">
        <div class="contents-area">
            <h1 style="margin-bottom: 10px">작성글 관리</h1>
            <div class="dd">

                <div class="border-area">

                    <div class="write one">
                        <h3>작성 게시물</h3>
                        <h4><%=writtenCount%>개</h4>
                    </div>

                    <div class="write two">
                        <h3>좋아요 누른 게시물</h3>
                        <h4><%=likeCount%>개</h4>
                    </div>

                    <div class="write three">
                        <h3>싫어요 누른 게시물</h3>
                        <h4><%=dislikeCount%>개</h4>
                    </div>


                    <div class="write four">
                        <h3>내 글 조회수</h3>
                        <h4><%=hitsCount%>회</h4>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- 게시글 콘텐츠박스 -->
    <div class="write-contents">
        <%
            String currentParam = request.getParameter("page"); //현재 파라미터 저장
            int currentPage; //현재페이지번호
            if (currentParam == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(currentParam);
            }
            int rowSize = 10; //한 페이지에 보여줄 글 갯수
            int rowCount = new Community_borderDAO().upTimeMyBorderCount(member_code); //DB에 저장된 총 글 갯수
            int startRow = (currentPage - 1) * rowSize; //db 조회시 처음 레코드 번호
//    int endRow = currentPage * rowSize; //db 조회시 끝 레코드 번호(MySQL LIMIT 구문을 사용하기 때문에 필요없는 변수)

            int pageCount = (int) Math.ceil(rowCount / (double) rowSize); // 총 페이지 갯수
            int pageSize = 10; //한 페이지에 보여줄 페이지 갯수
            int startPage = ((currentPage - 1) / pageSize) * pageSize + 1; //한 페이지의 처음 페이지 번호
            int endPage = startPage + pageSize - 1; //한 페이지의 마지막 페이지 번호
        %>
        <div class="small-title">

            <h3>유저님의 게시물</h3>
            <div class="list">
                <input type="checkbox" class="firstcheck" name="check">
                <div class="title">제목</div>
                <div class="date">날짜</div>
                <p class="count-write">게시물 수 <%=rowCount%>개</p>
            </div>

            <hr>
            <%
                ArrayList<Community_border> list = new Community_borderDAO().selectMyBorder(member_code, startRow, rowSize);
                for (int i = 0; i < list.size(); i++) {
            %>
            <div class="list">
                <input type="checkbox" class="check" name="check">

                <div class="writeinfo">
                    <div class="write-title"><%=list.get(i).getCm_b_title()%>
                    </div>
                    <div class="write-date"><%=list.get(i).getCm_b_date()%>
                    </div>
                </div>

                <div class="edit-btn">
                    <a href="mypageDetail.jsp?category=borderView&pageNo=<%=list.get(i).getCm_b_code()%>"><input
                            type="button" value="게시물 보기" class="look-border"></a>
                    <a href="mypageDetail.jsp?category=borderEdit&pageNo=<%=list.get(i).getCm_b_code()%>"><input
                            type="button" value="게시물 수정" class="edit-border"></a>
                    <a href="javascript:void(0)"><input type="button" value="삭제하기" class="delete-border"></a>
                </div>
            </div>
            <hr>
            <%
                }
            %>


            <div class="bottom-box">

                <div class="btn-box">
                    <input id="selectedDelete" type="button" value="선택 삭제">
                </div>

                <%
                    for (int i = startPage; i <= endPage; i++) {
                        if (i <= pageCount) {
                %>
                <div class="pagenumber">
                    <a href="mypageDetail.jsp?category=border&page=<%=i%>" class="pagemove"><%=i%>
                    </a>
                </div>
                <%
                        }
                    }

                    if (currentPage != endPage) {
                %>
                <div class="prev-next-btnbox">
                    <% if (currentPage > 1) {%>
                    <input type="button" value="이전">
                    <% }
                        if (currentPage < pageCount) {%>
                    <input type="button" value="다음">
                    <% }%>
                </div>
                <% }%>
            </div>
        </div>
    </div>
</div>
<script>
    let temp = [];
    <%for (int i=0; i<list.size(); i++){%>
        temp[<%=i%>] = <%=list.get(i).getCm_b_code()%>
    <%}%>
    const borderIndex = [...temp];
    temp = [];
</script>