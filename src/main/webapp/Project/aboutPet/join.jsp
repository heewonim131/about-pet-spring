<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@
include file="./header.jsp"

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){

})



</script>
<script type="text/javascript">
    const ybt = "확인";
    const nbt = "취소";
    const message = "undefined Message";

    //디폴트 콜백
    var defaultCbPostOption = {
        callBack : function(data){
            console.log(data);
        }
    }

    //콜백함수 set
    function setCbPostPopCallBack(callBack){
    	if(callBack != undefined){
    		defaultCbPostOption.callBack = callBack;
    	}	
    }
    
    //우편번호 콜백
    function cbPostPop(data){
    	defaultCbPostOption.callBack(data);
    }
    
    //관심태그 정보 변경 시 액션로그 api호출 - 호출 예 : fncTagInfoLogApi({ url:"/join/indexTag", targetUrl:"/join/indexResult",callback:console.log(data) });
    function fncTagInfoLogApi(config){
 				
    	var option = {
                 url : "/commonTagAction"
               , type : "GET"
               , data : {
            	   	url : config.url,
            	   	targetUrl : config.targetUrl
            	 } 
               , done : function(data){
                     if(config.callback){
                         config.callback();
                     }else{
                         console.debug(data);
                     }
               }
		}; 
    	ajax.call(option);		
				
	}

    /*
     * SNS 로그인 ( 네이버, 카카오, 구글, 애플)
     */
    function snsLogin(snsLnkCd) {
    	 if('PC' == 'APP' &&  !(snsLnkCd == 40 && 'DEVICE_TYPE' == '10')  ){
            toNativeData.func = "onSnsLogin";
            if(snsLnkCd == 10) toNativeData.loginType ="N" //N : 네이버, K : 카카오톡, G :구글, A:애플
            else if(snsLnkCd == 20) toNativeData.loginType ="K"
            else if(snsLnkCd == 30) toNativeData.loginType ="G"
            else if(snsLnkCd == 40) toNativeData.loginType ="A"
            toNative(toNativeData);
        }else{
            var url = "";
            var options = {
                url : "/snsLogin",
                type:  'POST',
                data : {
                	snsLnkCd : snsLnkCd,
                    deviceTpCd  :$("#deviceTpCd").val(),
                    deviceToken : $("#appPushToken").val()
                },
                done : function(data){
                	
                	//로그인 app interface 호출 
					if('PC' == 'APP'){
						toNativeData.func = 'onLogin';
						toNative(toNativeData);
					}
                	
                    window.location.href = data.goUrl;
                    return;
                }
            };
            ajax.call(options);
        }
    }

    //입력 제한 유효성
    function validateTxtLength(selector,maxLength){
        var id = selector.id;
        var txt = $(selector).val();
        var errorId = "error-"+id;
        var length = txt.length;
        if(length>maxLength){
            var msg = maxLength + "자 이내로 입력해주세요.";
            var html ="<p class='validation-check' id='"+errorId+"'>"+msg + "</p>";
            if($("#"+errorId).length == -0){
                $(selector).parent().after(html);
            }
        }else{
            $("#"+errorId).remove();
        }

        $(selector).val(txt.substring(0,maxLength));
    }

    // 초점 벗어날 때 유효성 검사
    var validWhenBlur = {
               loginId : function(target,callBack1, callBack2){
                   $.ajax({
                       url : "/common/check-id"
                       ,   type : "POST"
                       ,   data : {loginId : target}
                       ,   dataType : "JSON"
                   }).done(function(result){
                       if(parseInt(result)){
                           if(callBack1){
                        	   callBack1();
                           }else{
                               console.debug("undefined callBack");
                           }
                       }else{
                           if(callBack2){
                               callBack2();
                           }
                       }
                   });
                } 
            ,    nickNm : function(target,callBack){
                    $.ajax({
                        url : "/common/check-nickNm"
                        ,   type : "POST"
                        ,   data : {nickNm : target}
                        ,   dataType : "JSON"
                    }).done(function(result){
                            if(callBack){
                                callBack(result);
                            }else{
                                console.debug("undefined callBack");
                            }
                   });
            }
            ,   email : function(target,callBack){
                    $.ajax({
                            url : "/common/check-email"
                        ,   type : "POST"
                        ,   data : {email : target}
                        ,   dataType : "JSON"
                    }).done(function(result){
//                         if(parseInt(result)){
                            if(callBack){
                                callBack(result);
                            }else{
                                console.debug("undefined callBack");
                            }
//                         }
                    });
            }
            ,   rcomCd : function(target,callBack){
                    var data = {};
                    if(valid.email.test(target)){
                        data.rcomLoginId = target;
                    }else{
                        data.rcomCd = target;
                    }
                    $.ajax({
                        url : "/common/check-rcom"
                        ,   type : "POST"
                        ,   data : data
                        ,   dataType : "JSON"
                    }).done(function(result){
                        var r = parseInt(result);
                        if(r != 1){
                            if(callBack){
                                callBack();
                            }else{
                                console.debug("undefined callBack");
                            }
                        }
                    });
        },banWord : function(target,callBack){
			$.ajax({
				url : "/common/check-banWord"
				,type : "POST"
				,data : {
					loginId : target.loginId
					, nickNm : target.nickNm
				}
				,dataType : "JSON"
			}).done(function(result){
				if(callBack){
					callBack(result.returnCode);
				}else{
					console.debug("undefined callBack");
				}
			});
	}
    };

    //점유 인증 -> 현재 사용 X
    function fnOtpManageDetail(){
        return;
        var options = {
            url : "/common/opt"
            ,   type : "GET"
            ,	data : {mobile : $("#mobile").val() }
            ,   dataType : "HTML"
            ,   done : function(result){
                $("#mobile-li-default").hide();
                $("#mobile-li-cert").empty().append(result);
                $("#tm").bind("input chage paste",function(){
                    $("#tm").val($("#tm").val().replace(/\D/g,'').substring(0,11));
                });
                $("#ctfKey").bind("input chage paste",function(){
                    $("#ctfKey").val($("#ctfKey").val().replace(/\D/g,''));
                });
            }
        };
        //ajax.call(options);
    }
</script>
  <script type="text/javascript">
	var imageResult = null;
	
	$(document).ready(function(){
		 $("input:text[onlyEng]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[ㄱ-힣]/gi,""));
		}); 
		if("PC" != "PC"){
			$(".mode0").remove();
			$("#footer").remove();
		}else{
			$(".mode7").remove();
		}			
		 //window.history.forward();

		/*추천인 코드 설정*/
		var rcomCode = "";
		rcomCode = rcomCode.replace("&quot;","");
		rcomCode = rcomCode.replace("&quot;","");
		if(rcomCode != "" ){
			$("#join_rcomId").val(rcomCode);
		}

		//푸쉬토큰 app interface 호출
		if('PC' == 'APP'){
			//alert("푸쉬토큰요청");
			toNativeData.func = 'onPushToken';
			toNativeData.callback= 'appPushToken';
			// 호출
			toNative(toNativeData);
		}

		 //엔터 작동 막기
		 $("#join_form").keypress(function(e) {
				if ( window.event.keyCode == 13 ) {
					e.preventDefault();
				}
		 });
	})
		//2021.05.06  김재윤 추가
		//2021.06.23 김준형 추가 (safari blur처리)
		
		$(document).ready(function(){		
			$("#join_login_id").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				setTimeout(function(){
					
					//var inputVal = $(this).val().replace(/[ㄱ-힣]/g,'');
					//$("#join_login_id").val(inputVal);
		
					var msg = "";
					var v = true;
					var loginId = $("#join_login_id").val();
		
					if($("#join_login_id").val().length < 6 || $("#join_login_id").val().length > 40){
						msg = "6~40자 이내로 입력해주세요.";
						v = false;
					}
					//아이디 공백있는 경우
					else if(!valid.login_id.test($("#join_login_id").val())){
						msg = "공백없이 영문, 숫자 또는 특수문자만 입력해주세요.";
						v = false;
					}else{
						 
						 var params =$("#join_form").serialize()+"&check=mem_id";
						
						 console.log(params);
						//var params=$("#join_login_id").val();
					              $.ajax({
					           url: "/AboutPet/Project/aboutPet/duplication.do"
					           , dataType:"json"
					           , type:"get"
					           , data: params
					           , cache:false
					           , success:function (data){
					              // json -> js Object 형 자동으로 변환
					              // alert( data.count );   { "count":1 }
					              if( data.count == 1){
					            	
					            	  $("#join_login_id_error").html("이미 사용 중인 아이디에요.");
					              }
					              }
					         });     
			            	  //msg="이미 사용 중인 아이디에요.";
					         
					         

					        
						
						
						 	/* var logid=$("#join_login_id").val();
						
						$.ajax({
							  
							   url:"pr4.jsp",
							    dataType:"json",
								type:"GET",
								cach:false,
								success:function(data,textStatus,jqXHR){
						   $(data.idname).each(function(i, element) {
					           if (element.id==logid) {
					        	    
					        	   $("#join_login_id_error").html("이미 사용 중인 아이디에요.");
					        	     
							} 
							  
							 })
								},
								error:function(){
									alert("에러발생")
								}
								
							}) */  
						 
						
						
						/* validWhenBlur.banWord({loginId : loginId}, function(returnCode){
							if(returnCode == "banWord"){
								if($("#join_login_id").val() != "" ){
									$("#join_login_id_error").html("금지어가 포함된 내용은 입력할 수 없어요.");
		//	 						$("#join_login_id").focus();
								}
							}else{
								 validWhenBlur.loginId(loginId,function(){
									if($("#join_login_id").val() != "" ){
										$("#join_login_id_error").html("이미 사용 중인 아이디에요.");
		//		 						$("#join_login_id").focus();
									}
								}); 
						
								
							}
						});  */
					}
					
					if( $("#join_pswd").val() != "" ){
						if(!pswdValid.checkIncludeIdValue($("#join_pswd").val(), $("#join_login_id").val().replace(/-/g, ''))){
							$("#join_pswd_error").html("아이디와 4자 이상 동일할 수 없어요.");
						}
					}
						
		
					/* if(!v && $("#join_login_id_error").html() == ""){
		// 				$("#join_login_id").focus();
					} */
					$("#join_login_id_error").html(msg);	
					
					$('.btnDel').click(function(){
						$('#join_login_id_error').html("");
					});
				},250)
				
			});
		})
		//2021.06.21 인풋태그에 값 입력 시, 오류 메세지 제거
		
		$(document).on("keydown input paste",".cleanValMsg", function(){
			$(this).parent().next().html("")
			
		})
		
		
		$(document).on("input paste keydown change","[name='nickNm']",function(){
					validateTxtLength(this, 20);
					 var nickNmNoSpace=$(this).val().replace(/ /gi, "");
					$(this).val(nickNmNoSpace); 
				})
				
				
		$(document).ready(function(){	
		
			$("#join_pswd").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				setTimeout(function(){
					if("N" != 'Y' || (!($("#join_pswd").val() == "" || $("#join_pswd").val() == 'undefined') && "" < 40) ) {
						var v = true;
						var msg = "";
		
						var pswdCheck = pswdValid.checkPswd($("#join_pswd").val());
		
						if(pswdCheck == "falseLength"){
							msg = "8~15자 이내로 입력해주세요.";
							v = false;
						}
						//공백, 특수문자 포함일때
						else if($("#join_pswd").val().search(/[|]/gi) > 0 || $("#join_pswd").val().search(/\s/g) > 0){
							msg = "공백이나 제한된 특수문자는 사용하실 수 없어요.";
							v = false;
						}
						else if(pswdCheck == "falseCheck"){
							msg = "영문,숫자,특수문자를 각각 1자리 이상 포함해주세요.";
							v = false;
						}
						else if(!pswdValid.checkPswdMatch($("#join_pswd").val())){
							msg = "3자리 연속 반복된 문자나 숫자는 입력할 수 없어요.";
							v = false;
						}
						else if(!pswdValid.checkIncludeIdValue($("#join_pswd").val(), $("#join_login_id").val().replace(/-/g, '')) ){
							msg = "아이디와 4자 이상 동일할 수 없어요.";
							v = false;
						}
		
						if(!v && $("#join_pswd_error").html() == ""){
		// 					$("#join_pswd").focus();
						}
						$("#join_pswd_error").html(msg);
						
						$('.btnDel').click(function(){
							$('#join_pswd_error').html("");
						});
					}
				},250)
			});
			$("#join_pswd_check").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				setTimeout(function(){
					if("N" != 'Y' || (!($("#join_pswd").val() == "" || $("#join_pswd").val() == 'undefined') && "" < 40) ) {
						if(pswdValid.checkPswd($("#join_pswd").val()) == "true" && $("#join_pswd_check").val() != $("#join_pswd").val()){
							$("#join_pswd_check_error").html("동일한 비밀번호를 입력해주세요.");
						}else{
							$("#join_pswd_check_error").html("");
						}
						
						$('.btnDel').click(function(){
							$('#join_pswd_check_error').html("");
						});
					}
				},250)
			});
	
			 $("#join_nickname").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				 setTimeout(function(){
					var v = true ;
					var msg = "";
					var nickNm = $("#join_nickname").val();
					var chkNickNm = nickNm.replace(/ /gi, "");
					nickNm = chkNickNm;
					if($("#join_nickname").val() == ""){
						msg = "닉네임을 입력해주세요.";
						v = false;
					}else{
						
						//$("#formId").serialize().replace(/%/g,'%25');

					
						var params =$("#join_form").serialize().replace(/%/g,'%25')+"&check=nickname";
							
						 console.log(params);
					              $.ajax({
					           url: "/AboutPet/Project/aboutPet/duplication.do"
					           //url: "duplicationCheck.jsp"
					           , dataType:"json"
					           , type:"get"
					           , data: params
					           , cache:false
					           , success:function (data){
					        
					              if( data.count == 1){
					            	
					            	  $("#join_nickNm_error").html("이미 사용 중인 닉네임이에요.");
					              }
					              }
					         });     
					
					              
					              /*
					 	var logname=$("#join_nickname").val();
						
						 $.ajax({
							  
							   url:"pr4.jsp",
							    dataType:"json",
								type:"GET",
								cach:false,
								success:function(data,textStatus,jqXHR){
						   $(data.idname).each(function(i, element) {
					           if (element.nickName==logname) {
					        	    
					        	   $("#join_nickNm_error").html("이미 사용 중인 닉네임이에요.");
					        	     
							} 
							  
							 })
								},
								error:function(){
									alert("에러발생")
								}
								
							})  
						*/
						
						/* validWhenBlur.banWord({nickNm : nickNm}, function(returnCode){
							if(returnCode == "banWord"){
								if($("#join_nickname").val() != "" ){
									$("#join_nickNm_error").html("금지어가 포함된 내용은 입력할 수 없어요.");
		//	 						$("#join_login_id").focus();
								}
							}else{
						
								
								
								
								 validWhenBlur.nickNm(nickNm,function(result){
									if($("#join_nickname").val() != ""){
										if(result!=0){
									$("#join_nickNm_error").html("이미 사용 중인 닉네임이에요.");
										}
									}
								}); 
							}
						}); */
						
					}
		
					if(!v && $("#join_nickNm_error").html() == ""){
		// 				$("#join_nickname").focus();
					}
					$("#join_nickNm_error").html(msg);
					
					$('.btnDel').click(function(){
						$('#join_nickNm_error').html("");
					});		 
				 },250)
			}); 
			 
			$("#join_email_id").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				setTimeout(function(){
					var e = $("#join_email_id").val();
					var v = true;
					var msg = "";
					if(e == ""){
						v = false;
						msg = "메일 주소를 입력해주세요.";
					}
					/* else if(!valid.email.test(e)){
						v = false;
						msg = "메일 주소를 다시 확인해주세요.";
					} */
					  else if(!valid.ko.test(e)){
						v = false;
						msg = "메일 주소를 다시 확인해주세요.";
					}  
					
					$("#join_email_error").html(msg);
					
					/* $('.btnDel').click(function(){
						$('#join_email_error').html("");
					}); */	
				},250)
			}).on("input paste change","#join_email_id",function(){
				var inputVal = $(this).val().replace(/[ㄱ-힣]/gi,'');
	// 			$("#join_email_id").val(inputVal);
				validateTxtLength(this,40);
			});
			
			
			$("#join_rcomId").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
				setTimeout(function(){
					$("#join_rcomId_error").html("");
					if($("#join_rcomId").val() != ""){
						
                     var rcomId=$("#join_rcomId").val();
					var flag=false;	
						
					var params =$("#join_form").serialize()+"&check=mem_invite";

					
					 console.log(params);
					//var params=$("#join_login_id").val();
				              $.ajax({
				           url: "/AboutPet/Project/aboutPet/duplication.do"
				           , dataType:"json"
				           , type:"get"
				           , data: params
				           , cache:false
				           , success:function (data){
				              // json -> js Object 형 자동으로 변환
				              // alert( data.count );   { "count":1 }
				              if( data.count == 0){
				            	
				            	  $("#join_rcomId_error").html("추천인 정보를 다시 확인해주세요.");
				              }
				              }
				         });     
						
						
					/* 	validWhenBlur.rcomCd($("#join_rcomId").val(),function(){
							if($("#join_rcomId").val() != ''){
							$("#join_rcomId_error").html("추천인 정보를 다시 확인해주세요.");
							}
						}); */
					}					
				},250)
			})
		})

		/* 필수입력칸 입력여부 체크 - 버튼 활성화 */
		$(document).on("input paste change",".required_join_input",function()  {
			var required_value_fill = true;

			$(".required_join_input").each(function(){
				if($(this).val() == '') required_value_fill = false;
			});

			//if($("input:radio[name='gdGbCd']:radio").val() == '')  required_value_fill = false;
			if("N" == 'Y' && "" > 30 ){
				if($("#join_login_id").val() == '' || $("#join_nickname").val() == '') required_value_fill = false;
				else required_value_fill =true;
			}

			if(required_value_fill){
				$("#activeBtn").show();
				$("#inactiveBtn").hide();
			}else{
				$("#inactiveBtn").show();
				$("#activeBtn").hide();
			}
		});
		

	

	
	//App 푸쉬토큰 콜백
	function appPushToken(data){
		var dataJson = JSON.parse(data);
		$("#appPushToken").val(dataJson.token);
	}


	
	/*회원가입 처리*/
	function insertMember(){

			var flag = true;

			$(".validation-check").each(function(e){
				$(this).remove;
			});

			if($("#join_login_id").val().length < 6 || $("#join_login_id").val().length > 40){
				$("#join_login_id_error").html("6~40자 이내로 입력해주세요.");
				flag = false;
			}
			//아이디 공백있는 경우
			if(!valid.login_id.test($("#join_login_id").val())){
				$("#join_login_id_error").html("공백없이 영문, 숫자 또는 특수문자만 입력해주세요.");
				flag = false;
			}

			//비밀번호 체크 - sns회원가입인 경우는 비밀번호 필수아님.
			if("N" != 'Y' || (!($("#join_pswd").val() == "" || $("#join_pswd").val() == 'undefined') && "" < 40) ){
				if($("#join_pswd").val() == ""){
					$("#join_pswd_error").html("비밀번호를 입력해주세요.");
					flag = false;
				}

				var pswdCheck = pswdValid.checkPswd($("#join_pswd").val());
				if(pswdCheck == "falseLength"){
					$("#join_pswd_error").html("8~15자 이내로 입력해주세요.");
					flag = false;
				}

				if($("#join_pswd").val().search(/[|]/gi) > 0 || $("#join_pswd").val().search(/\s/g) > 0){
					$("#join_pswd_error").html("공백이나 제한된 특수문자는 사용하실 수 없어요.");
					flag = false;
				}

				if(pswdCheck == "falseCheck"){
					$("#join_pswd_error").html("영문,숫자,특수문자를 각각 1자리 이상 포함해주세요.");
					flag = false;

				}

				if(!pswdValid.checkPswdMatch($("#join_pswd").val())){
					$("#join_pswd_error").html("3자리 연속 반복된 문자나 숫자는 입력할 수 없어요.");
					flag = false;
				}

				if(!pswdValid.checkIncludeIdValue($("#join_pswd").val(), $("#join_login_id").val().replace(/-/g, '')) ){
					$("#join_pswd_error").html("아이디와 4자 이상 동일할 수 없어요.");
					flag = false;
				}
			}

			if("N" == 'Y' && "" > 30 ){
				if($("#join_nickname").val() == ""){
					$("#join_nickNm_error").html("닉네임을 입력해주세요.");
					flag = false;
				}
			}else{
				if($("#join_pswd_check").val() != $("#join_pswd").val()){
					$("#join_pswd_check_error").html("동일한 비밀번호를 입력해주세요.");
					flag = false;
				}

				if($("#join_nickname").val() == ""){
					$("#join_nickNm_error").html("닉네임을 입력해주세요.");
					flag = false;
				}
				if(!valid.ko.test($("#join_email_id").val())){
					$("#join_email_error").html("메일 주소를 다시 확인해주세요.");//("메일 주소를 다시 확인해 주세요.");
					flag = false;

				}
				if($("#join_nickname").val() != ''){
					var nickNm = $("#join_nickname").val();
					var chkNickNm = nickNm.replace(/ /gi, "");
					nickNm = chkNickNm;
					validWhenBlur.banWord({nickNm : nickNm}, function(returnCode){
						if(returnCode == "banWord"){
							if($("#join_nickname").val() != "" ){
								$("#join_nickNm_error").html("금지어가 포함된 내용은 입력할 수 없어요.");
								flag = false
							}
						}else{
							validWhenBlur.nickNm(nickNm,function(result){
								if(result!=0){
								$("#join_nickNm_error").html("이미 사용 중인 닉네임이에요.");
								flag = false
								}
							});
						}
					});
				}
			}
			//스크롤 처리
			if(($("#join_login_id_error")!="") || ($("#join_pswd_error")!="")){
				window.scroll(0,0)
			}
			setTimeout(function(){
				$(".validation-check").each(
						function(){
							if(($(this).html())!=""){
								$t =$(this).siblings("div").find("input")
								$t.focus();
								return false;
							}
						})
		 	},500);

		$("#join_form").submit();
	}

	 function inputDisabled(){
		if("" != null && "" != "")  $("#join_nickname").attr('disabled',true);
		if("" != null && "" != "" && 'N' != 'Y' )  $("#join_email_id").attr('disabled',true);
		if("N" == 'Y' && "" > 30) $("#join_login_id").attr('disabled',true);
		//$("#join_road_addr_input").attr('disabled',true);
	} 
	
</script>

</head>
<body>


<div class="wrap" id="wrap">
		<!-- mobile header -->
			
		<!-- // mobile header -->	
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container page login srch" id="container">
			<div class="inr" style="min-height: 354px;">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<div class="pc-tit">
						<h2>회원가입</h2>
					</div>
					<div class="fake-pop">
						<div class="pct">
							<div class="poptents">
								 <form id="join_form" action="/AboutPet/Project/aboutPet/signUp.do" method="post">

								<input type="hidden" id="snsYn" name="snsYn" value="N">
								<input type="hidden" id="termsNo" name="termsNo" value="[{termsNo:1,rcvYn:Y},{termsNo:94,rcvYn:Y},{termsNo:90,rcvYn:Y},{termsNo:93,rcvYn:Y},{termsNo:5,rcvYn:N},{termsNo:9,rcvYn:N}]">
								<input type="hidden" id="pstInfoAgrYn" name="pstInfoAgrYn" value="N">
								<input type="hidden" id="mkngRcvYn" name="mkngRcvYn" value="N">
								<input type="hidden" id="joinEnvCd" name="joinEnvCd" value="PC">
								<input type="hidden" id="deviceTpCd" name="deviceTpCd" value="DEVICE_TYPE">
								<input type="hidden" name="deviceToken" id="appPushToken"> 
								<input type="hidden" name="mbrNo" id="mbrNo"> 
								<input type="hidden" name="gdGbCd" id="gdGbCd" value=""> 
								
		
								<!-- 프로필 사진 -->
								<!-- // 프로필 사진 -->
								<!-- 회원 정보 입력 -->
								<div class="member-input">
									<ul class="list">
									<li>
											<strong class="tit requied">아이디</strong>
											<p class="info">필수입력정보</p>
											<div class="input del">
												<input type="text" id="join_login_id" class="required_join_input cleanValMsg" name="loginId" placeholder="6자 이상 입력해주세요." maxlength="40" value="" style="ime-mode:disabled;">
											</div>
											<p class="validation-check" id="join_login_id_error"></p>
										</li>
										<li>
											<strong class="tit requied">비밀번호</strong>
											<div class="input del">
												<input type="password" name="pswd" id="join_pswd" placeholder="영문, 숫자, 특수문자 포함 8자 이상" maxlength="15" autocomplete="new-password" class="required_join_input cleanValMsg ">
											</div>
											<p class="validation-check" id="join_pswd_error"></p>
										</li>
										<li>
											<strong class="tit requied">비밀번호 확인</strong>
											<div class="input del">
												<input type="password" id="join_pswd_check" placeholder="비밀번호를 다시 한번 입력해주세요." maxlength="15" autocomplete="new-password" class="required_join_input cleanValMsg">
											</div>
											<p class="validation-check" id="join_pswd_check_error"></p>
										</li>
										<li style="display:none;">
											<strong class="tit requied">이름</strong>
											<div class="input del">
												<input type="text" class="cleanValMsg" id="join_mbr_nm" name="mbrNm" value="" maxlength="10" placeholder="이름을 입력해주세요.">
											</div>
											<p class="validation-check" id="join_mbr_nm_error"></p>
										</li>
										<li style="display:none;">
											<strong class="tit requied">휴대폰 번호</strong>
											<div class="input del">
												<input type="number" class="cleanValMsg" id="join_mobile" name="mobile" title="휴대폰번호" value="" maxlength="20" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="-없이 번호만 입력해주세요">
											</div>
											<p class="validation-check" id="join_mobile_error"></p>
										</li>
										<li style="display:none;">
											<strong class="tit">생년월일</strong>
											<div id="join_birth_not_accept" class="input del">
												<input type="number" class="cleanValMsg" id="join_birth" name="birth" value="" maxlength="8" placeholder="숫자 8자리 입력(예:20210101)"> 
											</div>
											<p class="validation-check" id="join_birth_error"></p>
										</li>
										<li style="display:none;">
											<strong class="tit">성별</strong>
											<div class="flex-wrap">
												<label class="radio"><input type="radio" id="join_gd_gb_cd2" name="gdGbCd" value="10"><span class="txt">남자</span></label>
												<label class="radio"><input type="radio" id="join_gd_gb_cd1" name="gdGbCd" value="20"><span class="txt">여자</span></label>
											</div>
										</li> 
										<li>
											<strong class="tit requied">닉네임</strong>
											<div class="input del">
												<input type="text" id="join_nickname" name="nickNm" class="required_join_input cleanValMsg" placeholder="닉네임을 입력해주세요." maxlength="20" value="">
											</div>
											<p id="join_nickNm_error" class="validation-check"></p>
										</li>
									<li>
											<strong class="tit requied">이메일</strong>
											<div class="input del">
												<input type="text" id="join_email_id" name="email" class="required_join_input cleanValMsg" placeholder="이메일을 입력해주세요." maxlength="40" value="">
											</div>
											<p class="validation-check" id="join_email_error"></p> 
										</li>
										<!-- <li style="display:none;">
											<strong class="tit ">주소</strong>
											<div class="adrbox basic" id="addrDiv" >
												<div class="adr on"  id="join_road_addr_input" >&nbsp;</div>
												<a href="javascript:;" class="btAdr">주소검색</a>
												<input type="hidden" id="join_prcl_addr" name="prclAddr" title="지번주소" value="" />
												<input type="hidden" id="join_prcl_dtl_addr" name="prclDtlAddr" title="지번주소 상세" value="" />
												<input type="hidden" id="join_post_no_new" name="postNoNew"  title="우편번호"  />
												<input type="hidden" id="join_road_addr" name="roadAddr"  title="도로명주소"  />
											</div>
											// 04.14 : 수정
											<div class="input disabled" id="roadDtlAddrDiv" style="display:none;">
												<input type="text" class="text-input" id="join_road_dtl_addr" name="roadDtlAddr" maxlength="30"  placeholder="주소를 검색해주세요." >
											</div>
											<p class="validation-check">error message</p>
										</li> -->
										
										<li>
											<strong class="tit">추천인</strong>
											<div class="input">
												<input type="text" class="cleanValMsg" id="join_rcomId" name="rcomLoginId" placeholder="추천인 정보를 입력해주세요.">
											</div>
											<p class="validation-check" id="join_rcomId_error"></p>
										</li>
										</ul>
								</div>
								<!-- // 회원 정보 입력 -->
								</form>
							</div>
						</div>
						<div class="pbt pull">
							<div class="bts" id="inactiveBtn">
								<a href="javascript:;" id="nextBtn" class="btn lg gray" data-content="" data-url="">다음</a><!--pointer-events: none;  -->
							</div>
							<div class="bts" id="activeBtn" style="display:none;">
								<a href="javascript:insertMember();" id="nextBtn" class="btn lg a" data-content="" data-url="">다음</a><!--pointer-events: none;  -->
							</div>
						</div>
						<form id="imgAppForm" style="display:none;">
						</form>
					</div>
				</div>

			</div>
		</main>

		<div class="layers">
			<!-- 레이어팝업 넣을 자리 -->
		</div>
		<!-- 바디 - 여기 밑으로 템플릿 -->

		<!-- 하단메뉴 -->
		<!-- <include class="menubar" data-include-html="../inc/menubar.html"></include> -->
		<!-- 푸터 -->
		<!-- <include class="footer" data-include-html="../inc/footer.html"></include> -->
		</div>




<%@
include file="./footer.jsp"

%>
</body>
</html>