<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<title>Insert title here</title>
<style>
	.center-container {
		min-height:600px;
	}
	section{
		 min-height:400px;
	     margin-left: 100px;
	    }
	
	.customer-nav-btn .btn{
	    background-color: #FAF9F8; 
	    border:1px solid #222;
	    margin-bottom:10px;
	    padding:16px !important;
	    font-size:13px;
	    width:250px;
	}
	.customer-nav-btn i{
		font-size:2rem;
		font-weight:600;
	}
	.center-side{
		padding:0 !important;
	}
	.btn-icon{
		color:white;
		background-color:#222;
		padding:10px;
		line-height:1em;
	}
</style>
</head>
<body>
<div class="container-fluid center-container px-0">
	<div class="row center-row mx-0">
		<div class="col-md-2 center-side">
			<jsp:include page="sideNav.jsp" flush="false" />
		</div>
		<div class="col-md-10 center-content">
	    	<div id="sectDiv">
		        <h1 style="margin-bottom:50px;">무엇을 도와 드릴까요?</h1>
		        <p>인기 항목</p>
		        <div class="customer-nav-btn">	
		        	<div>
			        	<i class="fas fa-lg fa-box btn-icon"></i>
				        <button type="button" onclick="location.href='/customerContact' " class="btn rounded-0" >회사정보</button>
		        	</div>
		        	<div>
		        		<i class="fas fa-lg fa-sync-alt btn-icon"></i>
				        <button type="button" onclick="location.href='/customerInfo' " class="btn rounded-0" >반품 및 환불</button>
		        	</div>
		        	<div>
		        		<i class="fas fa-lg fa-phone-alt btn-icon"></i>
				        <button type="button" onclick="location.href='/customerQna' " class="btn rounded-0" >문의</button>
		        	</div>
		        </div>
	        </div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>