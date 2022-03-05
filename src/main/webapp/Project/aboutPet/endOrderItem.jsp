<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% int mem_code=0;
if(session.getAttribute("num")!=null){
   mem_code=(int)session.getAttribute("num");
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set>
<c:if test='${ mem_code eq 0 }'>
   <c:import url="header.jsp" />
</c:if>
<c:if test='${ mem_code ne 0 }'>
   <c:import url="loginheader.jsp" />
</c:if>
<div class="layers">
         <!-- 레이어팝업 넣을 자리 -->
         <!-- 등급안내 팝업 추가 2021.05.13 -->
         <article class="popLayer a popLank " id="popLank">
            <div class="pbd">
               <div class="phd">
                  <div class="in">
                     <h1 class="tit"></h1>
                     <button type="button" class="btnPopClose">닫기</button>
                  </div>
               </div>
               <div class="pct">
                  <main class="poptents">
                     <div class="rankCont">
                        <div class="rank_imgBox rank_pc">
                                 <img src="/_images/common/img-level-pc.png" alt="어바웃펫 패미리 등급별 혜택 이미지">
                              </div>
                           </div>
                  </main>
               </div>
            </div>
         </article>
         <!-- //등급안내 팝업 추가 2021.05.13 -->
      </div>
<!--// header pc--><!-- e : header 영역 -->
               <!-- s : gnb 영역 -->
               <script type="text/javascript">
function setCateList(dispClsfNo, upDispClsfNo) {
   var dispClsfNo2 ='';   
   if('12564' == upDispClsfNo ) {         // 강아지
      dispClsfNo2 = '300000173'
   } else if('12565' == upDispClsfNo ) {   // 고양이
      dispClsfNo2 = '300000174'
   } else if('14111' == upDispClsfNo ) {   // 관상어
      dispClsfNo2 = '300000175'
   } else if('14196' == upDispClsfNo ) {   // 소동물
      dispClsfNo2 = '300000176'
   }
   
   location.href = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+upDispClsfNo+"&cateCdM="+dispClsfNo;
}

function goIndexLoginSettings() {
   location.href = "/indexLoginSettings?returnUrl=" + window.location.pathname;
}

//시리즈 팝업
function seriesOpen(){
   var options = {
      url : "/tv/series/getSeriesList"
      , type : "POST"
      , dataType : "html"
      , data : { }
      , done : function(result){
         $("#gnbSrisListPopup").empty();
         $("#gnbSrisListPopup").html(result);
         ui.gnb.using("close"); //시리즈 목록 레이어 팝업 실행시 gnb메뉴(전체메뉴) 닫기
         ui.popLayer.open('popSeriesList');
      }
   };
   ajax.call(options);
}


function goMyPetLogGnb(){
   if( checkLoginGnb() && checkRegPetGnb() ){
      location.href = "https://aboutpet.co.kr/log/indexMyPetLog/F3989679D6?mbrNo=951865";
   }
}


function checkLoginGnb(){
   if( "true" != "true" ){
      ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
         ycb:function(){
            location.href = "https://aboutpet.co.kr/indexLogin";
         },
         ncb:function(){
            return false;
         },
         ybt:"로그인", // 기본값 "확인"
         nbt:"취소"  // 기본값 "취소"
      });
   }else{
      return true;
   }
}


function checkRegPetGnb(){   
   if( "30532" == null || "30532" == ""){
      ui.confirm('마이펫 등록 후 이용할 수 있어요<br/>펫정보를 등록할까요?',{ // 컨펌 창 옵션들
         ycb:function(){
            // 반려동물 등록 화면으로 이동.
            location.href = "https://aboutpet.co.kr/my/pet/petInsertView";
         },
         ncb:function(){
            //alert('취소');
            return false;
         },
         ybt:"예", // 기본값 "확인"
         nbt:"아니요"  // 기본값 "취소"
      });
   }else{
      return true;
   }
}

</script>
<c:import url="./sidebar.jsp"></c:import>

<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->         
               <!-- s : LNB 영역 -->
               <!-- e : LNB 영역 -->
            <!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
            
      <!-- s : 본문영역 -->         
      <style>
         .custom_ellipsis_dlvr{
            display: -webkit-box;
            text-overflow: ellipsis;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
            overflow: hidden;
         }
      </style>

      <main class="container page shop od order com" id="container">
         <div class="pageHeadPc">
            <div class="inr">
               <div class="hdt">
                  <h3 class="tit">주문완료</h3>
               </div>
            </div>
         </div>
         <div class="inr" style="min-height: 442.926px;">
            <!-- 본문 -->
            <div class="contents" id="contents">
               <div class="ordersets">
                  <section class="topbox">
                     <div class="hdd">
                        <div class="hd">
                           <em class="nm">${ oap.mem_name }</em>님 <br>주문이 완료되었습니다.
                        </div>
                        <div class="dd">주문하신 내역은 ‘주문/배송’ 에서 확인하실 수 있습니다.</div>
                     </div>
                     </section>

                  <section class="sect odnb">
                     <div class="hdts"><span class="tit">주문 번호</span></div>
                     <div class="cdts">
                        <div class="box">
                           <i class="nums">1</i>
                        </div>
                     </div>
                  </section>

                  <section class="sect addr">
                     <div class="hdts"><span class="tit">배송지</span></div>
                     <div class="cdts">
                        <div class="adrset">
                           <div class="name">
                              <em class="t">${ oap.adr_name }</em>
                           </div>
                           <div class="adrs">
                              ${ oap.adr_detail }</div>
                           <div class="tels">${ oap.recipient } | ${ oap.d_contact }</div>
                        </div>


                     </div>
                  </section>
                  <section class="sect bprc">
                     <div class="hdts"><span class="tit">결제 정보</span></div>
                     <div class="cdts">
                        <ul class="prcset">
                           <li>
                              <div class="dt">총 상품금액</div>
                              <div class="dd">
                                 <span class="prc"><em class="p">${ oap.f_price }</em><i class="w">원</i></span>
                              </div>
                           </li>
                           <li>
                              <div class="dt">배송비</div>
                              <div class="dd">
                                 <span class="prc"><em class="p">${ 2500 - oap.item_fee }</em><i class="w">원</i></span>
                              </div>
                           </li>
                        </ul>
                        <div class="tot">
                           <div class="dt">총 결제금액</div>
                           <div class="dd">
                              <span class="prc"><em class="p">${ oap.f_price + (2500 - oap.item_fee) }</em><i class="w">원</i></span>
                           </div>
                        </div>
                        <div class="gdpnt">구매확정 후 GS&amp;POINT <em class="p"><fmt:formatNumber pattern="#,###"
                                 value="${ oap.f_price *0.001  }"></fmt:formatNumber>P 적립</em></div>
                     </div>
                  </section>
                  <section class="sect binf">
                        <div class="hdts"><span class="tit">결제수단 정보</span></div>
                        <div class="cdts">
                           <div class="result">
                              <div class="hd">
                                 <em class="b">일반결제</em>
                                    <i class="t">신용카드</i>
                                    </div>
                              <div class="dd">${oap.card }/일시불</div>
                                 </div>
                        </div>
                     </section>
                  <div class="my_btnWrap">
                     <div class="btnSet">
                        <a href="orderList.do" class="btn lg d">상세 주문내역</a>
                        <a href="shop_home.do" class="btn lg a">계속 쇼핑하기</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </main><!-- location 영역 포함  -->         
      <!-- e : 본문영역 -->
            
      <!-- s : layerPop 영역 -->
      <!-- e : layerPop 영역 -->
      
      <!-- s : menubar 영역 -->
      <script type="text/javascript">
   $(document).ready(function(){
      $("li[id^=liTag_]").one('click', function(){
         $(this).addClass("active");
       });
      
   });
</script>

<nav class="menubar">
   <div class="inr">
      <ul class="menu">
      <!--  펫로그 파트너사인 경우 메뉴가 비활성 -->
      <li id="liTag_20" class="tv ">
               <a href="#" onclick="location.href='https://aboutpet.co.kr/tv/home/'" class="bt"><span>TV</span></a>
            </li>
            <li id="liTag_30" class="log ">
               <a href="#" onclick="location.href='https://aboutpet.co.kr/log/home/'" class="bt"><span>로그</span></a>
            </li>
            <li id="liTag_10" class="shop ">
               <a href="#" onclick="location.href='https://aboutpet.co.kr/shop/home/'" class="bt"><span>샵</span></a>
            </li>
            <li id="liTag_00" class="my ">
               <a href="#" onclick="location.href='https://aboutpet.co.kr/mypage/indexMyPage/'" class="bt"><span>MY</span></a>
            </li>
         </ul>
   </div>
</nav><!-- e : menubar 영역 -->
      
      <!-- s : footer 영역 -->
      <script type="text/javascript">
   /* 사업자정보 팝업 */
   function openLicensee(licensee) {
      var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+licensee;
      window.open(url, "communicationViewPopup", "width=750, height=700;");
   }
   
   /* Escrow */
   function openEscrow() {
      var options = {
         url : "/introduce/terms/indexEscrow",
         params : {},
         width : 640,
         height: 690,
         callBackFnc : "",
         modal : true
      };
      pop.open("escrow", options);
   }
   
   // 이용약관 pop
   function openTerms(termsCd , settingYn){
      if("false" == "true"){
         var url = "/introduce/terms/indexTermsApp?termsCd="+ termsCd +"&settingYn="+ settingYn;
         window.open(url, "termsContentPop");
      }else{
         var options = {
            url : "/introduce/terms/indexTerms"
            , data : {
               termsCd : termsCd
               , settingYn : settingYn
            }
            , dataType : "html"
            , done : function(html){
               $("#layers").html(html);
               ui.popLayer.open("termsContentPop");
            }
         }
         ajax.call(options);
      }
   }
   // 입점/제휴 문의 pop
   function openPartnershipInquiry(){
         var options = {
            url : "/customer/notice/indexPartnerNoticeList"
            , data : ''
            , dataType : "html"
            , done : function(html){
               $("#layers").html(html);
               ui.popLayer.open("popInqry");
            }
         }
         ajax.call(options);
      } 
   function convertVerBtn(gb){
      if(gb == 'MO'){
         $.cookie("DEVICE_GB", "MO",  {path: '/'});
          window.location.reload();
      }else{
         $.cookie("DEVICE_GB", "PC",{path: '/'});
          window.location.reload();
      }      
   }
</script>

<!-- footer -->   
<footer class="footer" id="footer">
   <div class="inr">
      <div class="link">
         <ul class="list">
            <li><a href="#" onclick="openTerms('2001' , 'Y'); return false;">서비스 이용약관</a></li>
            <li><a href="#" onclick="openTerms('2002' , 'Y'); return false;">개인정보 처리방침</a></li>
            <li><a href="#" onclick="openPartnershipInquiry()">입점/제휴 문의</a></li>
            <!-- 무조건 모바일웹으로 들어간 1경우에만 나타나게 만들기 -->
            </ul></div>
      <div class="info">
         <ul class="list">
            <li>(주)어바웃펫 대표 : 김경환, 나옥귀</li>
            <li>사업자 등록번호 : 120-87-90035</li>
            <li class="dn">통신판매업신고번호 : 제 2020-서울강남-03142호</li>
            <li>개인정보관리자 : 정명성  hello@aboutpet.co.kr</li>
            <li>TEL : 1644-9601</li>
         </ul>
         <p class="adr">서울특별시 강남구 테헤란로 151 (역삼하이츠빌딩) 지하2층</p>
      </div>
      <div class="copy">© copyright (c) www.aboutpet.co.kr all rights reserved.</div>
   </div>
</footer>
<!--// footer -->

<div id="layers">
</div><!-- e : footer 영역 -->
   </div>


<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","294635025485174");fbq("track","PageView");</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=294635025485174&amp;ev=PageView&amp;noscript=1"></noscript>
<script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script> 
<script type="text/javascript" id="" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" id="">kakaoPixel("1040077214249338373").pageView();</script> 
<script type="text/javascript" id="">if(!wcs_add)var wcs_add={};wcs_add.wa="s_1427fe4473b3";if(!_nasa)var _nasa={};window.wcs&&(wcs.inflow(),wcs_do(_nasa));</script>
</body>
</html>