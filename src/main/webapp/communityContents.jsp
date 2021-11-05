<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- 커뮤메인 시작-->
<div class="comuMainStart">
    <!-- 메인메뉴 시작-->
    <form action="" name="" method="post">
        <!-- 메인메뉴 구성요소 4개 시작-->
        <div class="fourElements">
            <div class="searchDiv">
                <label for="subject" class="itemTitle">OTT Services</label>
                <select id="subject" name="ottCategory">
                    <option value="all">전체</option>
                    <option value="netflix">넷플릭스</option>
                    <option value="watcha">왓챠</option>
                    <option value="youtube">유투브프리미엄</option>
                    <option value="tving">티빙</option>
                </select>
            </div>
            <div class="searchDiv">
                <label for="period" class="itemTitle">작성날짜범위</label>
                <select id="period"  name="periodCategory">
                    <option value="all">전체</option>
                    <option value="oneDay">지난 1일</option>
                    <option value="oneMonth">지난 1개월</option>
                    <option value="oneYear">지난 1년</option>
                </select>
            </div>
            <div class="searchDiv">
                <label for="writerTitle" class="itemTitle">작성자</label>
                <input type="text" id="writerTitle"  class="typeArea" value="" onclick="" />
            </div>
            <div class="searchDiv">
                <label for="workTitle"  class="itemTitle">작품명</label>
                <input type="text" id="workTitle" class="typeArea2" value="" onclick="" />
            </div>
        </div>
        <!-- 메인메뉴 구성요소 4개 끝-->
        <div class="searchButtonDiv">
            <!-- 검색버튼 디브 시작-->
            <input type="button" class="searchButton" value=" Search" onclick="" />
        </div>
        <!-- 검색버튼 디브 끝-->
        <div class="belowPage">
            <div class="quickMenuDiv">
                <!-- 퀵메뉴 디브 시작-->
                <div class="quickSearchBar">
                    <div class="jumpResult">
                        <label for="jumpOptions"  class="itemTitle">Page Move</label>
                        <select name="resulting" id="jumpOptions">
                            <option value="1">1</option>
                            <option value="10">10</option>
                            <option value="30">30</option>
                            <option value="50">50</option>
                            <option value="70">70</option>
                            <option value="100">100</option>
                        </select>
                        <label for="quickText"  class="itemTitle">Quick Search 🔎</label>
                        <input type="text"  id="quickText" class="typeArea2" value="" onclick="" />
                    </div>
                </div>
                <div class="quickMenuGenre">
                    <div class="quickTitle">
                        <h3>Genre List</h3>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="qE1" checked>
                            <label for="qE1"  class="itemTitle">Romance 💋</label>
                            <label for="qE1"  class="itemTitle">56</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="qE2" checked>
                            <label for="qE2"  class="itemTitle">Horror 🧛‍</label>
                            <label for="qE2"  class="itemTitle">23</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="qE3" checked>
                            <label for="qE3"  class="itemTitle">Drama 📺</label>
                            <label for="qE3"  class="itemTitle">41</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="qE4" checked>
                            <label for="qE4"  class="itemTitle">Action 🤾‍</label>
                            <label for="qE4"  class="itemTitle">55</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="qE5" checked>
                            <label for="qE5"  class="itemTitle">Comedy 😹</label>
                            <label for="qE5"  class="itemTitle">56</label>
                        </div>
                    </div>
                </div>

                <div class="quickMenuGrade">
                    <div class="quickTitle">
                        <h3>Grade</h3>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="gE1" checked>
                            <label for="gE1"  class="itemTitle">Bronze 🥉</label>
                            <label for="gE1"  class="itemTitle">56</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="gE2" checked>
                            <label for="gE2"  class="itemTitle">Siver 🥈</label>
                            <label for="gE2"  class="itemTitle">56</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="gE3" checked>
                            <label for="gE3"  class="itemTitle">Gold 🥇</label>
                            <label for="gE3"  class="itemTitle">22</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="gE4" checked>
                            <label for="gE4"  class="itemTitle">Platinum 🔮</label>
                            <label for="gE4"  class="itemTitle">12</label>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" id="gE5" checked>
                            <label for="gE5"  class="itemTitle">Diamond 💎</label>
                            <label for="gE5"  class="itemTitle">52</label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 퀵메뉴 디브 끝-->

            <div class="reviewDiv">
                <!-- 리뷰 디브 시작-->
                <div class="review-box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>👍 356 👎25</span>
                    </div>
                </div>
                <div class="review-box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>👍 356 👎25</span>
                    </div>
                </div>
                <div class="review-box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>👍 356 👎25</span>
                    </div>
                </div>
                <div class="review-box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>👍 356 👎25</span>
                    </div>
                </div>
                <div class="review-box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>👍 356 👎25</span>
                    </div>
                </div>
                <div class="review-box" id="box">
                    <div class="boxHeader">
                        <div>듄</div>
                    </div>
                    <div class="boxHeaderTwo">
                        <img src="http://placehold.it/15x15" alt="">
                        <div>최문철</div>
                    </div>
                    <div class="boxContent">
                        '듄'은 학생들이 무조건 봐야한다. 듄을 영어 타자로 치면 'ebs'이기 때문이다. '듄'은 학생들이 무조건 봐야한다.
                    </div>
                    <div class="boxJudgePoint">
                        <span>☆☆☆☆☆</span>
                        <span>
                            <span>👁55</span>
                            <span>👍356</span>
                            <span>👎25</span>
                        </span>
                    </div>
                </div>
            </div>

            <!-- 리뷰 디브 끝-->
        </div> <!-- 하단 페이지 끝-->
        <div class="paging">
            <input type="button" class="backward" id="first" value="first" onclick="" />
            <input type="button" class="backward" id="prev" value="previous" onclick="" />
            <div class="pageIndex">
                <a href="">1</a>
            </div>
            <div class="pageIndex">
                <a href="">2</a>
            </div>
            <div class="pageIndex">
                <a href="">3</a>
            </div>
            <div class="pageIndex">
                <a href="">4</a>
            </div>
            <div class="pageIndex">
                <a href="">5</a>
            </div>
            <div class="pageIndex">
                <a href="">6</a>
            </div>
            <div class="pageIndex">
                <a href="">7</a>
            </div>
            <div class="pageIndex">
                <a href="">8</a>
            </div>
            <div class="pageIndex">
                <a href="">9</a>
            </div>
            <input type="button" class="forward" id="next" value="next" onclick="" />
            <input type="button" class="forward" id="last" value="last" onclick="" />
            <input type="button" class="writeButton" value="write" onclick="" />
        </div>
    </form>
</div>
<!--커뮤메인 끝-->
