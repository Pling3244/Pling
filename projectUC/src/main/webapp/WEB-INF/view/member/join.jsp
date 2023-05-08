<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
<body class="bg-gradient-dark">

  <%@ include file="../include/content_topbar.jsp" %>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h1 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form id="join_form" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input name="id" type="text" class="form-control form-control-user id_input" placeholder="아이디">
                                    </div>
                                   <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
									<span class="id_input_re_2">중복된 아이디입니다.</span>
									<span class="final_id_ck">아이디를 입력해주세요.</span>  
                                </div>
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0 ">
                                        <input name="m_name" type="text" class="form-control form-control-user name_input" placeholder="이름">
                                    </div>
                                    <span class="final_name_ck">이름을 입력해주세요.</span>  
                                </div>
                                <div class="form-group  row">
                               	 <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input name="phone" type="phone" class="form-control form-control-user phone_input" placeholder="phone">
                               	 </div>                               	 
                               	 <span class="final_phone_ck">휴대폰 번호를 입력해주세요.</span>  
                               	 </div>
                               	 <div class="form-group  row">
                               	 <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input name="region" type="text" class="form-control form-control-user region_input" placeholder="지역">
                                    </div>
                                  <span class="final_region_ck">사는 지역을 입력해주세요.</span>  
                                </div>
                                <div class="form-group  row">
<!-- 								<label class="col-sm-2">성별</label> -->
									<div class="col-sm-3">
										<input name="gender" type="radio" value="남" /> 남 
										<input name="gender" type="radio" value="여" /> 여
									</div>
									<span class="final_gender_ck">성별을 체크해주세요.</span>  
								</div>								
                                <div class="form-group">
                                    <input name="email" type="email" class="form-control form-control-user mail_input" placeholder="Email Address">
                                    <span class="final_mail_ck_1">이메일을 입력해주세요.</span>
<!--                                     <span class="final_mail_ck_2">올바르지 못한 이메일 형식입니다.</span> -->
                                    <span class="mail_input_box_warn"></span>  
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input name="password" type="password" class="form-control form-control-user pw_input" placeholder="Password">
                                        <span class="final_pw_ck">비밀번호를 입력해주세요.</span>  
                                    </div>
                                    <div class="col-sm-6">
                                        <input name="password_confirm" type="password" class="form-control form-control-user pwck_input" placeholder="Repeat Password">
                                        <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                                        <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
             					   	   <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> 
                                    </div>
                                </div>
                                <a class="join_button">
											<button class="btn btn-primary btn-user btn-block">회원가입</button>
										</a>
                                <hr>
<!--                                 <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                                     <i class="fab fa-google fa-fw"></i> Register with Google -->
<!--                                 </a> -->
<!--                                 <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                                     <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook -->
<!--                                 </a> -->
                            </form>
<!--                             <hr> -->
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">아이디 찾기</a>
                                <a class="small" href="forgot-password.html">비밀번호 찾기</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login">로그인하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>       
    </div>             
</body>

<script>

	/* 유효성 검사 통과유무 변수 */
	 var idCheck = false;            // 아이디
	 var idckCheck = false;            // 아이디 중복 검사
	 var pwCheck = false;            // 비번
	 var pwckCheck = false;            // 비번 확인
	 var pwckcorCheck = false;        // 비번 확인 일치 확인
	 var nameCheck = false;            // 이름
	 var mailCheck = false;            // 이메일
	 var regionCheck = false;         // 주소	
	 var genderCheck = false;			// 성별
	 var phoneCheck = false;			  // 전화번호 
// 	 var mailtxtCheck = false
	
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){

		/* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.name_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var region = $('.region_input').val();        // 주소 입력란
        var phone = $('.phone_input').val();		  // 폰 입력란
        var gender = $("input[name=gender]:radio:checked").length;
//         var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            $('.id_input_re_1').css("display", "none");
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            $('.pwck_input_re_2').css('display','none');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck_1').css('display','block');
//             $('.final_mail_ck_2').css('display', 'none');
            mailCheck = false;
        }else{
            $('.final_mail_ck_1').css('display', 'none');
            mailCheck = true;
        }
        
        /* 지역 유효성 검사 */
        if(region == ""){
            $('.final_region_ck').css('display','block');
            regionCheck = false;
        }else{
            $('.final_region_ck').css('display', 'none');
            regionCheck = true;
        }
        
        /* 성별 유효성 검사 */
        if(gender < 1){
            $('.final_gender_ck').css('display','block');
            genderCheck = false;
        }else{
            $('.final_gender_ck').css('display', 'none');
            genderCheck = true;
        }
        
        /* 폰번호 유효성 검사 */
        if(phone == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
        }
        
//         /* 이메일 형식 유효성 검사 */
//         if(mailFormCheck(email)){
//         	$('.final_mail_ck_2').css("display", "none");
//             mailtxtCheck = true;
//         } else {            
//         	$('.final_mail_ck_2').css("display", "inline-block");
//             mailtxtCheck = false;
           
//         }
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&regionCheck&&genderCheck&&phoneCheck&&mailtxtCheck ){
 			
        	$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
        }       
        return false;
	});
});

//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){
 

// 	console.log("keyup 테스트");	

	var id = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {id : id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
		
// 			 console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				$('.final_id_ck').css('display', 'none');
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				$('.final_id_ck').css('display', 'none');
				idckCheck = false;
			}
		}// success 종료
	}); // ajax 종료	

});// function 종료

/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
        
	 var pw = $('.pw_input').val();
	 var pwck = $('.pwck_input').val();
	 $('.final_pwck_ck').css('display', 'none');
    
	 if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	 } else {
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
}
}); 

// /* 입력 이메일 형식 유효성 검사 */
// function mailFormCheck(email){
	
// 	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
// 	    return form.test(email);
// }

	</script>
</html>