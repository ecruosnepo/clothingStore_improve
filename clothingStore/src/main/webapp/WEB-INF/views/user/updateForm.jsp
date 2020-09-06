<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
  	.userUpdate-container{
  		font-weight:600;
  		max-width:676px !important;
  	}
  	.userUpdate-container p {
  		margin-bottom:0;  		
  	}
  	.userUpdate-header{
  		text-align:center;
  	}
  	.sitemap{
  		margin-bottom:24px !important;
  		font-size:10px;
  		text-decoration:none;
  	}
  	.sitemap a {
  		text-decoration:none !important;
  		margin:11px 0;
  	}
  	.group_p{
		margin-bottom:16px;	 
	}	
	.box{    
	   background-color: white;
	   padding:5%;
	   margin:5%;            
	}
	.userUpdate-content{
		width:100%;
	}
	.userUpdate-box-header{
		text-align:left;
		margin-bottom:8px !important;
	}
	.headName{
    	color:#707070;
       	font-size: 12px;
       	margin-bottom:8px !important;
    }
	.mypage-btn {
    	background-color:#222 !important;
    	font-size:13px !important;
    	margin-top:16px;    	
    	padding:13px 16px !important;
    	font-weight:600 !important;
    }
    .mypage-btn-w {
    	background-color:white !important;
    	border:1px solid #222 !important;
    }
  </style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />   
<div class="container userUpdate-container">
	  <div class="userUpdate-header">
		 <p class="sitemap"><a href="index"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet.html"  style="color: black; ">내 설정</a>/<a href="updateForm"  style="color: black; ">내 상세 정보 편집</a></p>
       	 <p style="font-size: 26px;">내 상세정보 편집</p> 
      </div> 
      <div class="row ">
        <div class="center-block userUpdate-content">       		   
          	<div class="box userUpdate-box">
	            <p class="userUpdate-box-header">내 세부정보</p>
	            <form action="userUpdate" method="post">
					<div class="form-group has-success">	
						<div class="group_p">	
						  <p class="headName">이메일</p>         
						  <p style="font-size: 20px;">${email}</p>
						</div>
						<div class="group_p"> 
						  <p class="headName">이름</p>
						  <input type="text" class="form-control rounded-0" id="inputSuccess1" name="user_name" value="${u.user_name}" onfocus="this.value='${u.user_name}';"/>
						</div>
						<div class="group_p">
						  <p class="headName">생년월일</p>
						  <input type="date" class="form-control rounded-0" id="inputSuccess1" name="user_birth" value="${u.user_birth}" onfocus="this.value='${u.user_birth}';"/>
						</div>
						<div class="group_p">
						  <p class="headName">전화번호</p>
						  <input type="text" class="form-control rounded-0" id="inputSuccess1" name="user_phone" value="${u.user_phone}" ; onfocus="this.value='${u.user_phone}';this.style.color='red';"/>
						</div>
	  				</div>
	       			<p class="head">성별</p> 
	      			<select class="form-control" name="user_gender" >
				         <c:choose>
				          <c:when test="${ u.user_gender eq'여성'}">
				            <option value="여성" selected>여성</option>
				            <option value="남성">남성</option>
				          </c:when>
				          <c:when test="${ u.user_gender eq '남성' }">
				            <option value="여성">여성</option>
				            <option value="남성" selected>남성</option>
				          </c:when>
				         <c:otherwise>
				           <option value="남성">남성</option>
				           <option value="여성">여성</option>
				         </c:otherwise>
				         </c:choose>
			       	</select>
	       			<br/>
	        		<p><button type="submit" class="btn btn-lg btn-block rounded-0 mypage-btn text-white">저장</button></p>
	    			<a href="MyPageSet"><button type="button" class="btn btn-lg btn-block rounded-0 mypage-btn mypage-btn-w">취소</button></a>
				</form>
      		</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>




















