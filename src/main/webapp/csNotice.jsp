<%@ page import="member.MemberDAO" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="javabean.Notice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    String member_code = new MemberDAO().idToCode(member_id);
    String[] member = new MemberDAO().memberPartyInfo(member_code);
    if (member[0] == null) member[0] = "비회원";
%>
<div class="firstdiv">
    <div class="sidebar">
        <!-- 유저 정보 -->
        <div>
            <div class="userinfo">
                <h3><%=member[0]%>님 </h3> <!-- 유저 이름-->
                <h3>안녕하세요</h3>
            </div>
            <hr>
            <!-- 메뉴목록 -->
            <ul class="bigul">
                <li class="main-topic">
                    <a href="cs.jsp?category=csNotice">공지사항</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=csQnA">자주묻는질문</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=ask">1:1문의</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=askList">1:1문의 내역</a>
                </li>
            </ul>
            <hr>
        </div>
    </div>

    <!-- 슬라이드 방향 끝 -->
<%
    String currentParam = request.getParameter("pageIndex"); //현재 파라미터 저장
    int currentPage; //현재페이지번호
    if(currentParam == null){
        currentPage = 1;
    }else{
        currentPage = Integer.parseInt(currentParam);
    }
    int rowSize = 10; //한 페이지에 보여줄 글 갯수
    int rowCount = new NoticeDAO().upTimeNoticeCount(); //DB에 저장된 총 글 갯수
    int startRow = (currentPage-1) * rowSize; //db 조회시 처음 레코드 번호
//    int endRow = currentPage * rowSize; //db 조회시 끝 레코드 번호(MySQL LIMIT 구문을 사용하기 때문에 필요없는 변수)

    int pageCount = (int) Math.ceil(rowCount /(double) rowSize); // 총 페이지 갯수
    int pageSize = 10; //한 페이지에 보여줄 페이지 갯수
    int startPage = ((currentPage-1)/pageSize) * pageSize + 1; //한 페이지의 처음 페이지 번호
    int endPage = startPage + pageSize - 1; //한 페이지의 마지막 페이지 번호
%>
<div class="real-big">

    <div class="bigbox">

        <div class="textbox">
            <h2>공지사항</h2>
            <hr>
        </div>

        <!-- ul li시작 -->
        <ul class="contents">
            <li>
                <span class="number-list">작성번호</span>
                <span class="title">제목</span>
                <span class="date">작성날짜</span>
            </li>
            <%
                ArrayList<Notice> list = new NoticeDAO().pageSelectNotice(startRow, rowCount);
                for (int i=0; i<list.size(); i++) {
            %>
            <a href="cs.jsp?category=csNoticeInfo&index=<%=list.get(i).getNotice_code()%>">
                <li class="post">
                    <span class="number-list"><%=list.get(i).getNotice_code()%></span>
                    <span class="title"><%=list.get(i).getNotice_title()%></span>
                    <span class="date"><%=list.get(i).getNotice_date()%></span>
                </li>
            </a>
            <%
                }
            %>

        </ul>

        <!-- 내용 끝 -->
        <div class="bottom-box">

            <div class="pagenumber">
                <%
                    for(int i=startPage; i<=endPage; i++){
                        if(i <= pageCount){
                %>
                <a href="cs.jsp?category=csNotice&pageIndex=<%=i%>" class="pagemove"><%=i%></a>
                <%
                        }
                    }
                %>
            </div>

            <div class="prev-next-btnbox">
                <%
                    if(currentPage != 1){
                %>
                <a href="cs.jsp?category=csNotice&pageIndex=<%=currentPage-1%>"><input type="button" value="이전"></a>
                <%
                    }if(currentPage != pageCount){
                %>
                <a href="cs.jsp?category=csNotice&pageIndex=<%=currentPage+1%>"><input type="button" value="다음"></a>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</div>
</div>