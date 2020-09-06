<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
<style>
	.login-container{
		font-weight:600 !important;
	}
    .login-container a{
    	text-decoration: none;
    	color: black !important;    	
    }
    .sitemap a{
    	font-size:11px;
    }
    .login-header{
    	text-align:center;
    	margin-bottom:48px;
    }
    input[type=submit], [type=button]{
        background-color: black;
        color: white;
        height: 40px;
    }
    input[type=text], input[type=password]{
        height: 45px;
    }
    p{
        text-align: center;
    }
    .login-form{
    	max-width:540px;
    	padding: 20px 60px 60px;
    	margin:0 auto;
    	font-size:13px;
    }
    .required-field{
    	font-size:13px;
    }
    .required-field:after {
		content: "*";
		color: #d6001c;
		font-size:11px;
		margin-left:2px
	}
	.extra-form{
		padding:0 !important;
	}
	.save-login{
		float:left;
	}
	#findPass{
		width:100%;
		text-align:right;
		display:block;
	}
	.input-column{
		display:inline-block;
		width:calc(100% / 2 - 5px);
		font-size: 13px;		
	}
	.login-btn{
		width:100%;
		background-color:#222 !important;
		margin-top:13px;
		padding:16px !important;
		font-size:13px !important;
		line-height:1em !important;
	}
	.login-btn:hover{
		background-color:#707070 !important;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" flush="false" />
	<div class="container login-container">
		<div class="row">
			<div class="col-md-12">
				<div class="login-header">
					<p class="sitemap"><a href="index">Home</a>/<a href="login">로그인/등록</a></p>
			        <h5>로그인</h5>
				</div>
			    <div id="login">
			        <div class="login-form">
			            <form action="/loginForm" method="post" name="loginFrm">
			                <div class="form-group">
			                    <label for="email" class="required-field">이메일</label>
			                    <input required type="text" class="form-control rounded-0" id="email" name="user_email" >
			                </div> 
			                <div class="form-group">
			                    <label for="passwrod" class="required-field">비밀번호</label>
			                    <input type="password" class="form-control rounded-0" id="password" name="user_password">
			                </div>
			                <div class="form-group form-check extra-form">
			                	<div class="input-column">
				                    <input type="checkbox" class="form-check-input save-login mx-0" id="exampleCheck1" name="saveInfo">
				                   	<label class="form-check-label" for="exampleCheck1" style="font-size: small; padding-left:18px">로그인 상태 유지!</label>
			                	</div>
			                	<div class="input-column">
				                    <a id="findPass" href="sendEmail">비밀번호를 잊으셨습니까?</a>
			                	</div>
			                </div>
			                <button type="submit" onclick="loginBtn()" class="btn text-white login-btn rounded-0">로그인</button>
			            </form>
				        <p style="margin-top:12px;"><a href="userSignUp">아직 계정이 없으세요? 여기서가입하세요!</a></p>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function loginBtn(){      
		// 입력 값 체크
		if($.trim($('#email').val()) == ''){
			alert('이메일을 입력해 주세요.');
			$('#email').focus();
			return;
		} else if($.trim($('#password').val()) == ''){
			alert('패스워드를 입력해 주세요.');
			$('#email').focus();
			return; 
		}else{
			document.loginFrm.submit();
		}              
	};
</script>
<jsp:include page="../footer.jsp" flush="false" />
</html>