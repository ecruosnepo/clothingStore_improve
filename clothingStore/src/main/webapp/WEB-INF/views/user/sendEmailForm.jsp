<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
<style>
	.forgot-container{
		font-weight:600;
		margin-bottom:50px;
	}
	.firstCenter{
		text-align: center;
	}
	.page-header-title{
		text-align:center;
		font-size:28px;		
	}
	.page-header-sub{
		text-align:center;
		font-size:13px;
	}
	.box{
		background-color:#FAF9F8;
		text-align: left;
	}
	.size{
		font-size: 24px;
		text-align: center;
	}
	.sub{
		font-size: 12px;
		color: red;
	}
	.head{
		font-size: 12px;
	}
	.input-email{
		padding: 14px 25px 14px 10px !important;
		font-size:16px !important;
		margin-bottom:30px;		
	}
	.input-email:focus{
		border: 1px solid #222 !important;
		box-shadow:none !important;
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
	.submit-btn{
		background-color:#222 !important;
		font-size:13px !important;
		padding:16px !important;
		line-height: 1em !important;
	}
</style>
</head>
<body>
    <jsp:include page="../header.jsp" flush="false" />
	<div class="container forgot-container"> 
		<div class="row ">
			<div class="center-block" style="width: 55%; float:none; margin:0 auto">
			    <div class="firstCenter">
			        <p class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="/myPage" style="color: black; ">나의 계정</a>/<a href="/myPage/setting"  style="color: black; ">내 설정</a></p>
			    </div>
			    <div class="box" >
			        <div class="form-group has-success">
				        <div class="page-header">
				        	<p class="page-header-title">비밀번호를 잊으셨습니까?</p>
				            <p class="control-label page-header-sub">귀하의 계정을 만드는 데 사용한 이메일 주소를 입력하십시오. 임시 비밀번호를 보내 드립니다. 로그인 후 변경 해주세요.</p>
				        </div>
			            <form action="sendEmailForm" method="post">
			            	<label class="required-field" for="inputSuccess1">이메일</label>
			            	<input type="text" class="form-control input-email h-auto rounded-0" id="inputSuccess1" name="email">
			           	<button type="submit" class="btn btn-lg text-white rounded-0 submit-btn">확인</button> 
			          </form> 
			       	</div>  
			    </div>  
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>