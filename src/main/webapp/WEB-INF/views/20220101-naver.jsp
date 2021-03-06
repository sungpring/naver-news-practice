<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title id="browserTitleArea">네이버 뉴스 따라해보기</title>
<meta charset="UTF-8" />
<style type="text/css"> /*MIME type 설정*/
@charset "UTF-8";
.is_hidden{display:none!important}
.blind{position:absolute;overflow:hidden;clip:rect(0 0 0 0);width:1px;height:1px;margin:-1px}
/*블라인드 클래스를 clip:rect() 모두 0으로 주어서 안보이게끔 설정한 것이다.*/

a { text-decoration:none; } /* a 태그 밑줄 없애기 */
* {margin:0; padding:0;} /* 상단 여백 없애는 css */
ul li {list-style-type: none; float:left; } /* li 태그 스타일 빼기 */
html,body { overflow: auto; }

/*html { overflow-x:hidden; }*/ /* 세로 스크롤 */

.main_body{  }

/* gnb */
.Ngnb { position:absolute; background : #4063bf; height: 50px; width:100%;  overflow: hidden;}
.Ngnb_both {position: relative; width: 900px; margin: 0 auto;}
.Ngnb_both>div {display: inline-block; }
.Naver_logo { position: relative; top: -3px; font-weight:bold; font-size:1.5em;}
.Nicon_service { font-weight:bold; font-size:1.2em; }

.Ngnb_left{ width:500px; margin-top: 5px; }
.Ngnb_left span {color:white;}
.Ngnb_left>div { position:relative; display: inline-block; top: 4px;}
.Nservice_news span { position:relative; top:-4px; }
.Nservice_subitem span {opacity: 0.33;display: inline-block; vertical-align: top; }
.Nicon_family::after{ content:"|"; font-weight:100; font-size:13px; opacity: 0.33; margin-left:5px; padding-bottom: 13px;}
.Nicon_premium::after{ content:""; } /*li 태그시엔 last-child 이용할 것*/

.Ngnb_right { position:absolute; width: 200px; height:30px; float:right; margin-left:275px; margin-top: 13px; }
.Ngnb_right span {color:white;}
.Ngnb_right>div { position:relative; display: inline-block;  }
.gnb_txt { width:15px; height:15px; padding:3px; border: 1px solid #4063bf; font-size:13px; background: #486ac3; } /* 로그인 */
.gnb_icon img { object-fit: cover; width:15px; height:15px; margin-left: 8px; } /* nine square */
.Nicon_search img { object-fit: cover; width:15px; height:15px; margin-left: 8px; margin-bottom: 4px; } /* 검색창 background-image: url("../resources/index/img/naver_magni_glass.png"); */
/* gnb end */

/* lnb */
.Nlnb{ position:absolute; top:50px; width:100%; height: 50px; overflow: hidden; border-bottom:1px solid #eeeeee;}
.Nlnb_menu_inner { width:900px; margin: 0 auto; }
.Nlnb_menu_list { width: 600px; height: 35px; padding-top: 15px;}
.gnb_lst>li { display:inline-block; margin-left:10px; }
.Nitem_link_menu { color:black; font-weight: 900; margin-left: 20px;}
.Nlnb_menu_list>li:first-child span{ margin-left:0px; }
/* lnb end */

/* main */
.main_wrap {position:absolute; width: 100%; height: 1920px; margin-top:100px; overflow: hidden;}
.lnb{position: relative; width: 900px; height: 30px; padding-top: 20px; margin: 0 auto;font-size: small; border-bottom: 1px solid #828691;}
.lnb_two_depth{}
.lnb_date{}
.lnb_side{ float:right; }
.lnb_side_li{ color:black; font-size:12px; margin-left:10px; }
.lnb_two_depth ul li::after{ content:"|"; font-weight:100; font-size:13px; opacity: 0.33; margin-left:5px; padding-bottom: 13px;}
.lnb_two_depth ul li:last-child::after { content: none; }

/* card_head */
.card_all{ height: 1520px; }
.card_head{position: relative; width: 900px; height: 50px; padding-top: 20px; margin: 0 auto; font-family: "NanumSquare","Apple SD Gothic Neo",sans-serif; }
.card_head .rank_news_head{position: absolute;
    left: 0;
    float: none;
    font-size: 25px;
    line-height: 40px;
    vertical-align: top;
    font-family: "NanumSquare","Apple SD Gothic Neo",sans-serif;}
.rank_news_head em{color:#3e63bf; font-style: normal;}
.rank_news_comment_or_view{display: inline-block;
    font-size: 18px;
    line-height: 40px;
    font-weight: bold;
    vertical-align: top;
    font-family: "NanumSquare","Apple SD Gothic Neo",sans-serif;
    letter-spacing: -0.5px;
    width: 300px;
    margin-left: 345px;}
.rank_news_view a {color: black;}
.rank_news_view a::after{content:"/"; font-weight:300; font-size:13px; opacity: 0.33; margin-left:5px; padding-bottom: 13px;}
.rank_news_comment a{color:#cecece;}
.sum_guidance{width:15px; height:15px; margin-left: 180px;
    font-size: 13px;
    line-height: 40px;
    vertical-align: top;}
.sum_guidance a{color:#a5a4a4;}
.naver_info_img{width: 15px;
    height: 15px;
    margin-top: 10px;
    float: right;}
/* card_head end */    

/* real_card_area */
.real_card_area{
	position: relative;
    width: 900px;
    /*height: 460px;*/
    /*padding-top: 20px;*/
    margin: 0 auto;}
.real_card_box{
    width: 270px;
    height: 440px;
    float: left;
    border-radius: 8px;
    border: solid 1px #e5e5e5;
    box-sizing: border-box; /* 이걸 설정해야 안에 들어갈 컨텐츠들의 배치가 쉬워진다. */
    text-align: left;
    margin-top: 30px;
    margin-right:45px;
    }
.real_card_box:nth-child(3n){
	margin-right:0px;
}
.real_card_box_head{
	position: relative;
    display: block;
    padding: 10px 10px;
    border-radius: 8px 8px 0 0;
    background: #f5f5f7;
    text-decoration: none;
}
.card_box_span_img_png{
	width: 25px;
    height: 25px; 
    border-radius: 70%;
    overflow: hidden;
    object-fit: contain;
}
.card_box_name{
	display: inline-block;
    font-size: 15px;
    line-height: 26px;
    color: #1e1e23;
    vertical-align: top;
}
.card_box_list{
	margin-top: 8px;
    margin-left: 15px;
}
.card_box_list li{
	margin-top: 5px;
}
.card_box_num{
	width: 30px;
    height: 30px;
    font-size: 17px;
    font-weight: 600;
    font-style: normal;
    display: table-cell;
    vertical-align: top;
    margin-top: 20px;
}
.card_box_num_real{
	margin-top: 7px;
}
.list_content{
	display: table-cell;
    width: 100%;
    padding-top: 5px;
    padding-right: 16px;
    padding-left: 11px;
    vertical-align: top;
}
.card_box_list li::after{
	display: block;
    left: 10px;
    top: 150px;
    width: 170px;
    border-bottom: 1px solid #efeff0;
    content: '';
}
.card_box_list li:last-child::after{
	border-bottom: 0px;
	content: '';
}	
/*
.list_content::after{

	content: "";
  	display: block;
 	width: 80px;
  	border-top: 1px solid #efeff0;
	
  	position: absolute;
    left: 10px;
    top: 150px;
    width: 180px;
    border-bottom: 1px solid #efeff0;
    content: '';
    
}*/
.list_title{
	max-height: 40px;
    font-size: 13px;
    line-height: 20px;
    color: #303038;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
.list_time{
	font-size: 2px;
    color: #767678;
}
.list_img{
	display: table-cell;
    
}
.list_img_png{
	width: 55px;
    height: 55px;
    border-radius: 4px;
    overflow: hidden;
    vertical-align: middle;
    margin-right: 10px;
    margin-top: 10px;
    background: #f2f4f9;
    object-fit: cover;
}
/* real_card_area end */

/* bottom_button_area */
.bottom_button{
	width: 900px;
    height: 40px;
    margin: 0 auto;
    text-align: center;
}
.bottom_button_two_depth{
	display: inline-block;
}
.other_news_plus_button{
	width: 230px;
    height: 34px;
    font-weight: 600;
    background: white;
    border-radius: 3px;
    border: 1px solid #e4e5e8;
}
/* bottom_button_area end */

/* bottom_date_area */

.bottom_date{
	width: 900px;
    height: 40px;
    margin: 0 auto;
    text-align: center;
    margin-top:15px;
}
.bottom_date_two_depth{
	display: inline-block;
}
.bottom_date_list li{
	font-size: 0.8em;
    margin-left: 17px;
    color: #949598;
}
.bottom_date_list li:hover{
	text-decoration:underline;
	cursor:pointer;
}
.bottom_date_list li:first-child{
	margin-left:0px;
	color:#4063bf;
}
.bottom_date_list li::after{
    position: absolute;
    width: 2px;
    height: 2px;
    border-radius: 1px;
    background: #949598;
    margin-top: 8px;
    margin-left: 6px;
    content: "";
}
.bottom_date_list li:last-child::after{
	width:0px;
	height:0px;
}
/* bottom_date_area end */

/* bottom_list_n_myscrap area */
.bottom_list_n_myscrap{
	height: 40px;
    width: 100%; 
    /*top: 700px;
    position: absolute; */
    border-top: 1px solid #eeeeee;
    border-bottom: 1px solid #eeeeee;
}
.bottom_list_n_myscrap_two_depth{
	width: 900px;
    height: 28px;
    margin: 0 auto;
    text-align: center;
    margin-top: 11px;
    font-size: 12px;
    font-weight: 900;
	
}
.bottom_list{
	float: left;
    width: 100px;
}
.bottom_list_img{
	width: 10px;
    height: 6px;
    margin-left: 3px;
}

.bottom_myscrap{
	float: right;
    width: 100px;
}
.bottom_list_img_right{
	width: 6px;
    height: 10px;
    margin-left: 3px;
}
/* bottom_list_n_myscrap area end */

/* news_rank_footer */

.news_rank_footer{
   	width: 100%;
    height: 250px;
    display: flex;
    /* top: 740px;
    position: absolute; */
    background: #f3f4f8;
    
}
.news_rank_footer_two_depth{
	width:900px;
	margin: 0 auto;
    text-align: center;
    margin-top: 30px;
    font-size: 12px;
    font-weight: lighter;
}

.news_rank_footer_list{
    width: 810px;
	height:30px;
	display:inline-table;
}
.news_rank_footer_list li{
	display: inline;
}
.news_rank_footer_list li::after{
	content: "|";
    font-weight: 100;
    font-size: 13px;
    opacity: 0.33;
    margin-left: 5px;
    margin-right:5px;
    padding-bottom: 13px;
}
.news_rank_footer_list li:last-child::after{
	content: "";
    margin: 0;
    padding: 0;
}
.news_rank_footer_two_depth span:first-of-type{
	font-size:6px;
	color:#949598;
	display: inline-block;
    margin-bottom: 13px;
}
.news_rank_footer_two_depth span:last-of-type{
	font-size:6px;
}
.bottom_naver_logo_img{
	width: 50px;
    vertical-align: middle;
    margin-right: 10px;
}
/* news_rank_footer end */


</style>
</head>
<body class="main_body">

<section class="news_header">
	<header class="nh_header" role="banner"><!--header 요소 안에  role 이라는 속성을 정의해주고 값을 banner 로 정의  -->
		<div class="Ngnb">
			<div class="Ngnb_inner">
				<div class="Ngnb_both">
					<div class="Ngnb_left">
						<div class="Ngnb_logo">
							<a href="https://www.naver.com" onclick="return false;" class="Nlogo_link">
								<span class="Naver_logo">N</span>
							</a>
						</div>
						<div class="Ngnb_service">
							<span class="Nservice_news">
								<a href="https://news.naver.com" onclick="return false;">
									<span class="Nicon_family Nicon_service">뉴스<!-- before 뉴스 --></span>
								</a>
							</span>
							<span class="Nservice_subitem">
								<a href="https://entertain.naver.com/home" onclick="return false;">
									<span class="Nicon_family Nicon_entertain">연애<!-- before 연예 --></span>
								</a>
							</span>
							<span class="Nservice_subitem">
								<a href="https://sports.naver.com/index" onclick="return false;">
									<span class="Nicon_family Nicon_sports">스포츠<!-- before 스포츠 --></span>
								</a>
							</span>
							<span class="Nservice_subitem">
								<a href="https://weather.naver.com/" onclick="return false;">
									<span class="Nicon_family Nicon_weather">날씨<!-- before 날씨 --></span>
								</a>
							</span>
							<span class="Nservice_subitem">
								<a href="https://contents.premium.naver.com/" onclick="return false;">
									<span class="Nicon_family Nicon_premium">프리미엄<!-- before 프리미엄 --></span>
								</a>
							</span>
						</div>
					</div>
					<div class="Ngnb_right">
						<div class="Ngnb_group">
							<div id="gnb" class="gnb_dark_type2">
								<strong class="blind">사용자 링크</strong>
								<ul class="gnb_lst" id="gnb_lst">
									<li class="gnb_login_li" id="gnb_login_layer" style="display:inline-block;">
										<a class="gnb_btn_login" href="https://nid.naver.com/nidlogin.login" id="gnb_login_button">
											<span class="gnb_bg"></span>
											<span class="gnb_bdr"></span>
											<span class="gnb_txt">로그인</span>
										</a>
									</li>
									<li class="gnb_service_li gnb_lyr_opened" id="gnb_service_layer" style="display: inline-block;">
										<a href="javascript:;" class="gnb_service" onclick="return false;">
											<span class="gnb_icon"><img src="../resources/index/img/naver_multi_square.png" alt=""></span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="Ngnb_search is_hidden"></div>
						<div class="Ngnb_tool">
							<a href="javascript:;" class="Ntool_button" onclick="return false;">
								<span class="Nicon_search"><img src="../resources/index/img/naver_magni_glass.png" alt="search"><!-- 검색 --></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Global Navigator Bar -->
		<div class="Nlnb"> <!-- Local Navigator Bar -->
			<div class="Nlnb_inner">
				<div class="Nlnb_both">
					<div class="Nlnb_left _lnb_scroll">
						<div class="Nlnb_menu Ntype_scroll">
							<div class="Nlnb_menu_inner _scroll">
							<!-- style="touch-action:pan-y pinch-zoom; height:46px; position:relative; overflow:hidden;" pinch-zoom 핀치줌 (여러손가락을 사용한 확대 축소 가능) pay-y 의 경우 y축 즉 세로축 방향으로만 끌기 가능. x일 가로 경우  -->
								<ul class="Nlnb_menu_list" role="menu">
								<!-- style="position: absolute; transition-timing-function: cubic-bezier(0.1,0.57,0.1,1); transition-duration:0ms; transform: translate(0px, 0px) translateZ(0px);"
									 transition-timing-function: cubic-bezier(0.1,0.57,0.1,1); css transition 움직임 속도를 지정할 수 있다. cubic-bezier 로 설정하면 그래프 모양으로 속도를 설정가능 
									 transition-duration 끝날 때까지 걸리는 시간을 정한다. 0ms 이므로 끝날때까지 0ms 시간 소요
									 transform 애니메이션의 방향을 설정할 수도 움직임을 설정할 수도 있다. 위의 경우 translate(0px, 0px) 첫번째는 가로축, 두번째는 세로축
								-->
									<li class="Nlist_item is_active"><a href="https://news.naver.com/" class="Nitem_link" role="menuitem" aria-selected="true" onclick="nclk(event,'lnb.pcmedia','','');"><span class="Nitem_link_menu">언론사별</span></a></li>
									<li class="Nlist_item"><a href="https://news.naver.com/main/main.naver?mode=LSD&amp;mid=shm&amp;sid1=100" class="Nitem_link" role="menuitem" aria-selected="false" onclick="return false;"><span class="Nitem_link_menu">정치</span></a></li>
									<li class="Nlist_item"><a href="https://news.naver.com/main/main.naver?mode=LSD&amp;mid=shm&amp;sid1=101" class="Nitem_link" role="menuitem" aria-selected="false" onclick="return false;"><span class="Nitem_link_menu">경제</span></a></li>
									<li class="Nlist_item"><a href="https://news.naver.com/main/main.naver?mode=LSD&amp;mid=shm&amp;sid1=102" class="Nitem_link" role="menuitem" aria-selected="false" onclick="return false;"><span class="Nitem_link_menu">사회</span></a></li>
									<li class="Nlist_item"><a href="https://news.naver.com/main/main.naver?mode=LSD&amp;mid=shm&amp;sid1=103" class="Nitem_link" role="menuitem" aria-selected="false" onclick="return false;"><span class="Nitem_link_menu">생활/문화</span></a></li>
									<li class="Nlist_item"><a href="" class="Nitem_link" role="menuitem" aria-selected="false" onclick="return false;"><span class="Nitem_link_menu">랭킹</span></a></li>
									<!-- aria-selected 탭메뉴의 선택값을 알려준다. true 일 경우 선택이며, false 일 경우 선택되지 않음을 나타낸다. -->
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Local Navigator Bar -->
	</header>
</section>

<hr>

<div id="main" role="main" class="main_wrap">
	<div class="lnb">
		<div class="lnb_two_depth">
			<span class="lnb_date">
			<c:set var="day" value="${fn:split(dayList[0],' ')}" />
				<strong><c:set var="strZero" value="${fn:replace(day[0], '월', '')}" />${strZero}</strong>.<strong><c:set var="strOne" value="${fn:replace(day[1], '일', '')}" />${strOne}</strong><span class="day">${day[2]}</span>
			</span>
			<ul class="lnb_side">
				<li><a href="javascript:;" class="lnb_side_li" title="전체 언론사">전체 언론사</a></li>
				<li><a href="javascript:;" class="lnb_side_li" title="뉴스스탠드">뉴스스탠드</a></li>
				<li><a href="javascript:;" class="lnb_side_li" title="라이브러리">라이브러리</a></li>
			</ul>
		</div>
	</div>
	<div class="card_all">
		<div class="card_head">
			<h2 class="rank_news_head">언론사별 <em>랭킹뉴스</em> </h2>
			<ul class="rank_news_comment_or_view">
				<li class="rank_news_view"><a href="javascript:;">많이 본 뉴스&nbsp;</a></li>
				<li class="rank_news_comment"><a href="javascript:;">&nbsp;&nbsp;댓글 많은 뉴스</a></li>
			</ul>
			<span class="sum_guidance"><a href="javascript:;">집계안내<img class="naver_info_img" src="../resources/index/img/naver_info.png" alt=""></a></span>
		</div>
		<div class="real_card_area">
			<div class="real_card_area_two_depth">
			<c:forEach var="item" items="${titleImg}" begin="0" end="8" step="1" varStatus="status">
				<div class="real_card_box">
					<a href="javascript:;" class="real_card_box_head">
						<span class="card_box_span_img">
							<img class="card_box_span_img_png" src="${item.get('img')}" alt="MBC">
						</span>
						<strong class="card_box_name">${item.get('title')}</strong>
					</a>
					<ul class="card_box_list">
					<c:set var="itemContents" value="${item.get('contents')}" />
						<c:forEach var="contents" items="${itemContents}" begin="0" end="4" step="1" varStatus="statusContents">
							
							<li>
								<div class="card_box_num"><div class="card_box_num_real">${statusContents.count}</div></div> <!-- {statusContents.count} -->
								<div class="list_content">
									<a href="javascript:;" class="list_title">${contents.get('title')}</a>
									<span class="list_time"><c:if test="${contents.get('publishedDate') <= 0 }">방금 전</c:if><c:if test="${contents.get('publishedDate') > 0 }">${contents.get('publishedDate') } 시간전</c:if></span> 
								</div>
								<a href="javascript:;" class="list_img"><img class="list_img_png" src="${contents.get('imgUrl')}"> </a>
							</li>
							
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
				
			</div>
		</div>
	</div>
	<div class="bottom_button">
		<div class="bottom_button_two_depth">
			<a href="javascript:;"><button class="other_news_plus_button">다른 언론사 랭킹 더보기</button></a>
			<a href="javascript:;"><button class="other_news_plus_button">랭킹 뉴스 집계 기준</button></a>
		</div>
	</div>
	<div class="bottom_date">
		<div class="bottom_date_two_depth">
			<ul class="bottom_date_list">
				<c:forEach var="item" items="${dayList}" begin="0" end="4" step="1">
					<li>${item}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="bottom_list_n_myscrap">
		<div class="bottom_list_n_myscrap_two_depth">
			<div class="bottom_list"><span>언론사 목록</span><img class="bottom_list_img" src="../resources/index/img/bottom_list_area/bottom_list_bottom_arrow.png"></div>
			<div class="bottom_list"><span>분야별 목록</span><img class="bottom_list_img" src="../resources/index/img/bottom_list_area/bottom_list_bottom_arrow.png"></div>
			<div class="bottom_myscrap"><span>마이스크랩</span><img class="bottom_list_img_right" src="../resources/index/img/bottom_list_area/bottom_list_right_arrow.png"></div>
		</div>
	</div>
	<div class="news_rank_footer">
		<div class="news_rank_footer_two_depth">
			<ul class="news_rank_footer_list">
				<li>이용약관</li>
				<li>서비스 안내</li>
				<li>기사배열 원칙 책임자 : 유봉석</li>
				<li>청소년 보호 책임자 : 이희만</li>
				<li style="font-weight:800">개인정보처리방침</li>
				<li>책임의 한계와 법적고지</li>
				<li>뉴스 고객센터</li>
			</ul>
			<br>
			<span>본 콘텐츠의 저작권은 제공처 또는 네이버에 있으며 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다.</span>
			<br>
			<span><img class="bottom_naver_logo_img" src="../resources/index/img/bottom_list_area/bottom_naver_logo.png">Copyright &copy; <strong>NAVER Corp.</strong> All Rights Reserved.</span>
		</div>
	</div>
</div>
<script type="text/javascript">

</script>
</body>
</html>