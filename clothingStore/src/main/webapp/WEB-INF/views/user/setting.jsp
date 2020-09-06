<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
	<style>
	  	body{
	  		background-color:#FAF9F8;
	  	}
	  	p{
	  		margin-bottom:0 !important;
	  	}
	  	.sitemap{
  		margin-bottom:15px !important;
  		font-size:11px;
  		text-decoration:none;
  		font-weight:600 !important;
	  	}
	  	.sitemap a {
	  		text-decoration:none !important;
	  		margin:11px 0;  		
	  	}
	  	.mysetting-header {
	  		font-weight:600;
	  		text-align:center;
	  		margin-bottom:20px;
	  	}
	  	.mysetting-header h1 {
	  		font-size:27px;
	  		font-weight:700;
	  		line-height: 1.142857143;  		
	  	}
	 	.mysetting-header p {
	 		font-size:13px;
	 	}
	  	.mysetting-wrap{
	  		max-width: 676px !important;
	  		padding: 0 24px 24px !important;
	  	}
	  	.mysetting-wrap a {
	    	color:#222;
	    	text-decoration:underline;
	  	}
	  	.mysetting-wrap a:hover {
	    	color:#222;    	
	  	}
	  	.center-block{
	  		width:100%;
	  	}
	    .group_p{
	       padding:1.8%;  
	    }
	    .box{
	      background-color:white;
	      text-align: left;
	      margin-bottom:50px;
	    }
	    .box-title{
	     	width:100%;
	     	background-color:#F4E6E3;
	     	margin-bottom:0;    
	    }
	    .box-title p{
	   	 	font-size:13px;
	   	 	padding:16px 24px;
	    }
	    .box-title a{
	    	float:right;
	    	font-size:13px;
	    }
	    .box *{
			font-weight:600;
		}
	    .box-content{
	     	padding:15px;
	    }
	    .headName{
	    	color:#707070;
	       font-size: 12px;
	    }
	    .subName{
	       font-size: 14px;
	    }
	    .address-content p:first-child{
	    	margin-bottom:10px !important;
	    }
	</style>
</head>
<body>
  <jsp:include page="../header.jsp" flush="false" />
	<div class="container mysetting-wrap">
	  <div class="mysetting-header">
	  	  <div class="sitemap">
          	<a href="#" style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet" style="color: black; ">내 설정</a>
	  	  </div>
          <h1><span>내 설정</span></h1>
	      <p>여기서 계정 및 구독을 관리할 수 있습니다</p>
   	  </div>
      <div class="row mx-0" class="row text-center">
        <div class="center-block">           
		 <div class="box" >
	    	<div class="box-title">
	    		<p>내 세부정보<a href="updateForm">수정</a></p>    		
	    	</div>
	    	<div class="box-content">
			    <div class="group_p">
					<p class="headName">이메일</p>
				    <p class="subName">${user.user_email}</p>
			    </div>
			    <div class="group_p">
				    <p class="headName">이름</p>
				    <p class="subName">${user.user_name}</p>
			    </div>  
			    <div class="group_p">
		   	      	<p class="headName">생년월일</p>
					<p class="subName">${user.user_birth}</p>
				</div>
				<div class="group_p">   
		  		  	<p class="headName">전화번호</p>
					<p class="subName">${user.user_phone}</p>
				</div>
				<div class="group_p">  
				  	<p class="headName">성별</p>
					<p class="subName">${user.user_gender}</p>
			    </div>		      
	    	</div>
		 </div>  
	     <div class="box" >
	     	<div class="box-title">
	    		<p>내 주소<a href="address">수정</a></p>    		
	    	</div>
	    	<div class="box-content address-content">
			    <div class="group_p">
			    	<p class="headName">또한 여기서 배송 주소를 추가하고 편집할 수 있습니다.</p>
					<p class="headName">청구지 주소</p>
				    <P class="subName">
				    	${user.main_address1}<br>
				    	${user.main_address2}<br>
				    	${user.main_address3} ${user.main_address4}
				    </P>
			    </div>			    
	    	</div>
		 </div>
	     <div class="box" >  
		 	<div class="box-title">
	    		<p>개인정보 보호</p>    		
	    	</div>
	    	<div class="box-content address-content">
			    <div class="group_p">
			    	<p class="headName"><a href="updatePassword">비밀번호 변경</a></p>
				    <!-- <form action="deleteInfoUser" method="post" name="delId">	  
			      		<input class="headName" type="button" onclick="deleteId()" class="btn btn btn-danger btn-round " value="계정삭제"/>
			      	</form> -->
					<p class="headName"><a href="/myPage/deleteInfoUser" onclick="return confirm('귀하의 계정을 삭제 하시겠습니까?');">계정삭제</a></p> 
			    </div>			    
	    	</div>
	      </div> 
   		</div>
	</div>
  </div>
  <jsp:include page="../footer.jsp" flush="false" />
</body>
<script>

function deleteId() {  
	
      if ( confirm("귀하의 계정을 삭제 하시겠습니까?") == true ) {
 	      document.delId.submit(); 
	  }else{
		  return false;
      }
 }
</script>
</html>