<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!-- 커뮤메인 시작-->
<div class="comuMainStart">
    <!-- 메인메뉴 시작-->
    <form action="" name="" method="post">
        <!-- 메인메뉴 구성요소 4개 시작-->
        <div class="fourElements">
            <div class="ottSelect">
                <p>OTT Services</p>
                <select name="ottCategory" form="">
                    <option value="all">전체</option>
                    <option value="netflix">넷플릭스</option>
                    <option value="watcha">왓챠</option>
                    <option value="youtube">유투브프리미엄</option>
                    <option value="tving">티빙</option>
                </select>
            </div>
            <div class="periodSelect">
                <p>작성날짜범위</p>
                <select name="periodCategory" form="">
                    <option value="all">전체</option>
                    <option value="oneDay">지난 1일</option>
                    <option value="oneMonth">지난 1개월</option>
                    <option value="oneYear">지난 1년</option>
                </select>
            </div>
            <div class="writerName">
                <p>작성자</p>
                <input type="text" class="typeArea" value="" onclick="" />
            </div>
            <div class="titleName">
                <p>작품명</p>
                <input type="text" class="typeArea2" value="" onclick="" />
            </div>
        </div>
        <!-- 메인메뉴 구성요소 4개 끝-->
        <div class="searchButtonDiv">
            <!-- 검색버튼 디브 시작-->
            <input type="button" class="searchButton" value=" Search" onclick="" />
        </div>
        <!-- 검색버튼 디브 끝-->
        <div class="hadanPage">
            <div class="quickMenuDiv">
                <!-- 퀵메뉴 디브 시작-->
                <div class="quickSearchBar">
                    <div class="jumpeResult">
                        <p2>Page Move</p2>
                        <select name="resultlimit" id="jumpOptions" ng-model="resultlimit" ng-init="resultlimit=5"
                                form="">
                            <option value="1">1</option>
                            <option value="10">10</option>
                            <option value="30">30</option>
                            <option value="50">50</option>
                            <option value="70">70</option>
                            <option value="100">100</option>
                        </select>
                        <p2>Quick Search 🔎</p2>
                        <input type="text" class="typeArea2" value="" onclick="" />
                    </div>
                </div>
                <div class="quickMenuGenre">
                    <div class="quickTitle">
                        <h3>Genre List</h3>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Romance 💋</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Horror 🧛‍♂️</p2>
                            <p3>23</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Drama 📺</p2>
                            <p3>41</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Action 🤾‍♀️</p2>
                            <p3>55</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Comedy 😹</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                </div>

                <div class="quickMenuGrade">
                    <div class="quickTitle">
                        <h3>Grade</h3>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Bronze 🥉</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Siver 🥈</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Gold 🥇</p2>
                            <p3>22</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Platinum 🔮</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                    <div class="quickList">
                        <div class="quickElements">
                            <input type="checkbox" checked>
                            <p2>Diamond 💎</p2>
                            <p3>56</p3>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 퀵메뉴 디브 끝-->

            <div class="reviewDiv">
                <!-- 리뷰 디브 시작-->
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
                        <span>👍 356 👎25</span>
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
</div>
<!--커뮤메인 끝-->
</form>