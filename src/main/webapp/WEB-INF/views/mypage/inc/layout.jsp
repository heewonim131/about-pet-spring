<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aboutPet</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="">
<meta name="description" content="">
<meta name="keywords" content="">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">
<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
<link href="<tiles:getAsString name="css" />" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/googleAnalytics.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.countdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/clipboard.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/popup.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/adbrix.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Project/js/ui.mo.js"></script>
</head>
<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<div class="wrap" id="wrap">

<!-- header -->

<!-- sidebar -->

<!-- mypage aside -->
<tiles:insertAttribute name="aside"></tiles:insertAttribute>

<!-- main content -->
<tiles:insertAttribute name="content"></tiles:insertAttribute>

<!-- footer -->

</div>
</body>
</html>