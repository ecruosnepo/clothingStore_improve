<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
<style>
	.changePass-wrap{
		max-width:676px !important;		
	}
	.inner-content{
		width:100%;
		padding: 0 24px;
	}
	.sitemap{
  		margin-bottom:24px !important;
  		font-size:11px;
  		text-decoration:none;
  		font-weight:600 !important;
  	}
  	.sitemap a {
  		text-decoration:none !important;
  		margin:11px 0;  		
  	}
  	.content-header {
  		font-weight:600;
  		text-align:center;
  	}
  	.content-header p {
  		font-size:27px;
  		font-weight:700;
  		line-height: 1.142857143;
  		margin-bottom:8px;	
  	}
 	.content-header p {
 		font-size:13px;
 	}
	.firstCenter{
		text-align: center;
	}
	.box{
		background-color:#FAF9F8;
		text-align: left;
		font-weight:600;
		padding:32px;
	}
	.size{
		font-size: 24px;
		text-align: center;
	}
	.headName{
		color:#707070;
		font-size: 13px;
	}
	.input-text{
		padding:8px !important;
		height: 48px !important;
	}
   .address-btn {
		background-color:#222 !important;
		font-size:13px !important;
		margin-right:20px;
		margin-bottom:16px;
		padding:13px 16px !important;
		font-weight:600 !important;
   }
   .address-btn-w {
	   	background-color:white !important;
	   	border:1px solid #222 !important;
   }
    .required-field:after {
		content: "*";
		color: #d6001c;
		font-size:13px;
		font-weight:600 !important;
		margin-left:2px
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />  
<div class="container changePass-wrap"> 
	<div class="row ">
        <div class="inner-content">
		    <div class="content-header">
		        <label class="sitemap"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet"  style="color: black; ">내 설정</a></label>
		        <p style="font-size: 28px;"><b>비밀번호 변경</b></p>
		    </div>
		    <div class="box" >
		        <div class="form-group has-success">
		            <p class="control-label">비밀번호 변경</p>
		            <form action="updatePasswordForm" method="post" name="delId">
			            <label class="headName required-field">현재 비밀번호</label>			            
			            <input type="password" class="form-control input-text rounded-0" id="getPassword" onkeyup="pwCheckFunction();" name="getPassword">
			            <label class="headName  required-field">새 비밀번호</label>			            
			            <input type="password" class="form-control input-text rounded-0" id="password" onkeyup="pwCheckFunction();" name="updatePassword1">
		             	<p class="headName" >8 characters1 lowercase1 uppercase1 number</p>
		            	<label class="headName required-field">새 비밀번호 확인</label>
		           		<input type="password" class="form-control input-text rounded-0" id="password2" onkeyup="pwCheckFunction();" name="updatePassword2">
		           		<p id="pwCheckMessage"></p>
             			<input type="button" onclick="update()" class="btn btn-lg rounded-0 btn-block address-btn text-white" value="비밀번호 변경"/>
	               		<button type="button" class="btn btn-lg rounded-0 btn-block address-btn address-btn-w" onclick="history.back();">취소</button>
		          	</form> 
				</div>
			</div>  
		</div>  
	</div>
</div>
<jsp:include page="../footer.jsp" flush="false" />  
<script>
 function pwCheckFunction(){ // 비밀번호 확인
	    var userPW1 = $('#password').val();
	    var userPW2 = $('#password2').val();
	    var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; 
	    if(userPW1.length < 8 || !pattern1.test(userPW1) || !pattern2.test(userPW1)) $('#pwCheckMessage').html('비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.').css('color', 'red').css('font-size', '16px');
	    else if(userPW1 == "" || userPW2 == "") $('#pwCheckMessage').html('');
	    else if(userPW1 != userPW2) $('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다').css('color', 'red').css('font-size', '16px');
	    else $('#pwCheckMessage').html('비밀번호가 서로 일치합니다').css('color','blue');
	  }

 function update(){
     if ( $.trim($('#getPassword').val()) == '') {
    	 alert('비밀번호를 입력 해주새요.');
    	 return;
    }if ( $.trim($('#password').val()) == '') {
    	     alert('비밀번호를 입력 해주새요.');
	    	 return;
    }if ( $.trim($('#password2').val()) == '') {
	    	 alert('비밀번호를 입력 해주새요.');
	    	 return;
    } else if( confirm("귀하의 비밀번호를 변경 하시겠습니까?") == true){
    	document.delId.submit();
    } 
};

           
</script> 
</body> 
</html>