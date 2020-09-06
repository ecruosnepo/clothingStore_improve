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
	  	.adrress-header {
	  		font-weight:600;
	  		text-align:center;
	  		margin-bottom:40px;
	  	}
	  	.adrress-header h1 {
	  		font-size:27px;
	  		font-weight:700;
	  		line-height: 1.142857143;  		
	  	}
	 	.adrress-header p {
	 		font-size:13px;
	 	}
	  	.address-wrap{
	  		max-width: 684px !important;
	  		padding: 0 24px 24px !important;
	  	}
	  	.address-wrap a {
	    	color:#222;
	    	text-decoration:underline;
	  	}
	  	.address-wrap a:hover {
	    	color:#222;    	
	  	}
	  	.center-block{
	  		width:100%;
	  	}
	    .first{
	       text-align: center;
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
	   	 	padding:18px 24px;
	    }
	    .box-title a{
	    	float:right;
	    	font-size:13px;
	    }
	    .box *{
			font-weight:600;
		}
	    .box-content{
	     	padding:24px;
	    }
	    .group_p{
	    	margin:5px 0 10px;
	    }
	    .group_p *{
	    	margin:6px 0 7px;
	    }
	    .headName{
	    	color:#707070;
	       font-size: 12px;
	    }
	    .subName{
	       font-size: 14px;
	    }
	    .address-btn {
	    	background-color:#222 !important;
	    	font-size:13px !important;
	    	margin-right:40px;
	    	padding:13px 16px !important;
	    	font-weight:600 !important;
	    }
	    .address-btn-w {
	    	background-color:white !important;
	    	border:1px solid #222 !important;
	    }
	</style>
</head>
<body>
  <jsp:include page="../header.jsp" flush="false" />
    <div class="container address-wrap px-0"> 
      <div class="row mx-0">
        <div class="center-block">
		   <div class="adrress-header">
		       <p class="sitemap"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="address"  style="color: black; ">주소록</a></p>
		       <p style="font-size: 28px;">주소록</p>
		   </div>
		   <div class="box" >
		    	<div class="box-title">
		    		<p>청구지 주소</p>    		
		    	</div>
		    	<div class="box-content">
				    <div class="group_p">
					   <p class="headName">우편번호</p>
					   <p class="subName">${user.main_address1}</p>
				  	</div>
				  	<div class="group_p">
					   <p class="headName">주소</p>
					   <p class="subName">${user.main_address2}</p>
				  	</div>
				  	<div class="group_p">
					   <p class="headName">아파트 명/건물 명</p>
					   <p class="subName">${user.main_address3}</p>
				  	</div>
				  	<div class="group_p">
					   <p class="headName">동 호수/층 수</p>
					   <p class="subName">${user.main_address4}</p>
				  	</div>
				   	<a href="/myPage/setMainAddress"><button type="button" class="btn btn-lg address-btn text-white rounded-0" >주소 편집</button></a>      
		    	</div>
		 	</div>
		 	<h5><span style="font-weight:600;">배송 주소</span></h5>
		 	<br>		 
			<c:forEach var="add" items="${ address }"  begin="0" end="2" varStatus="status">
			<div class="box" >
		     	<div class="box-title">
		    		<p>배송 주소 ${status.index+1 }</p>    		
		    	</div>
		    	<div class="box-content address-content">
				   <div class="group_p">
				     <p class="headName">이름</p>
				     <p class="subName">${add.r_name}</p>
				   </div>
				   <div class="group_p">
				     <p class="headName">우편번호</p>
				     <p class="subName">${add.address1}</p>
				   </div>
				   <div class="group_p">
				     <p class="headName">주소</p>
				     <p class="subName">${add.address2}</p>
				   </div>
				   <div class="group_p">
				     <p class="headName">아파트 명/건물 명</p>
				     <p class="subName">${add.address3}</p>
				  </div> 
				   <div class="group_p">
				     <p class="headName">동 호수/층 수</p>
				     <p class="subName">${add.address4}</p>
				   </div>
				   <a href="/myPage/updateSubAddress?address_index=${add.address_index }"><button type="button" class="btn btn-lg text-white address-btn rounded-0" >주소 편집</button></a>
	               <a href="/myPage/deleteSubAddress?address_index=${add.address_index }"><button type="button" class="btn btn-lg address-btn address-btn-w rounded-0">주소 삭제</button></a>
		    	</div>
		 	</div>
			</c:forEach>
			<a href="/myPage/insertSubAddress"><button type="button" class="btn btn-lg text-white address-btn rounded-0">새 주소 추가</button></a>
   		</div>             
      </div>
     </div>
   <jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>