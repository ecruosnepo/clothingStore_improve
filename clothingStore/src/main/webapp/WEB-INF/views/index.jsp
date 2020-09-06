<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>옷가게</title>
<style>
	  body{
	  	background-color:#FAF9F8;
	  }
	  p{
	  	margin-bottom:0 !important;
	  }
      section a{
      	text-decoration: none; color: black; margin: 5px;
      }
      .index-promotion{
      	text-align:center;
      	background-color:#FBEE6E;
      	font-weight:600 !important;
      	margin:0 auto;
      	padding: 20px 0;
      	margin-bottom: 30px;
      }
      .index-promotion p{
      	font-weight:900 !important;
      	font-size:30px;
      }
      #adv h4{
      	text-align: center;
      	margin-bottom: 30px;      	
      }
      #goods{
          width: 980px;
          margin: 0 auto;
          font-family: sans-serif;
      }
      #goods div{
          width: 100%;
      }
      .text-center{
          height: 700px;
          position: relative;
          margin:0 auto;
          margin-bottom:30px;
      }
      .card-body{
          position: absolute;
		  bottom: 5%;
      }
      #main3 p, #main1 p{
      	color:black;
      }
      #main2 p, #main4 p{
      	color:white;
      }
      .card-title{
      	font-weight:700;
      	font-size:42px;
      }
      .banner-btn{
      	background-color:white;
      	font-size:13px !important;
      	padding:10px 20px !important;
      }
      .cs2{
          background-color: bisque;
      }
      .item{
          background-color: aquamarine;
          height: 400px;
          width: 300px;
          margin: 10px;
          border: 1px solid black;
      }
      #adv{ 
          width:100%;
          background-color: #F4EDDD;
      }
      
      .bottom-con{
      	width: 60%;
      	margin:0 auto;
      	text-align:center;
      }
      
      .bottom-img-group{
          width: 980px;
          margin: 0 auto;          
      }
      
      .bottom-img-group .image{
          margin:0 auto;          
      }
      
      .image{
          margin: 10px;
          width: 90%;
      }
      #main1{
         background-image: url('/mainImages/main_women.jpg');
         background-size : cover;
      }
      #main2{
         background-image: url('/mainImages/main_man.jpg');
         background-size : cover;
      }
      #main3{
         background-image: url('/mainImages/main_kids.jpg');
         background-size : cover;
      }
      #main4{
         background-image: url('/mainImages/main_story.jpg');
         background-size : cover;
      }
    
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
	<div class="container index-wrap">
		<section id="goods">
			 <div class="index-promotion">
			 	<p>H&M 카카오 채널 친구 추가시<br/>10% OFF 쿠폰 지급</p>
			 	<span>2020-08-05부터 ~ 2020-08-19까지 지급 | 온라인 단독!</span>			 	
			 </div>
		     <div id="main1" class="card text-center rounded-0 border-0">
		         <div class="card-body">
		             <p class="card-title">여성 의류</p>
		             <p class="card-text">올 여름에 유행하는 필수 아이템</p>
		             <a href="#" class="btn banner-btn bg-white rounded-0">지금 쇼핑하기</a>
		         </div>
		     </div>
	         <div id="main2" class="card text-center rounded-0 border-0">
	             <div class="card-body">
	                 <p class="card-title">남성 의류</p>
	                 <p class="card-text">올 여름에 유행하는 필수 아이템</p>
	                 <a href="#" class="btn banner-btn bg-white rounded-0">지금 쇼핑하기</a>
	             </div>
	         </div>
		     <div id="main3" class="card text-center rounded-0 border-0">
		         <div class="card-body">
		             <p class="card-title">아동복</p>
		             <p class="card-text">올 여름에 유행하는 필수 아이템</p>
		             <a href="#" class="btn banner-btn bg-white rounded-0">지금 쇼핑하기</a>
		         </div>
		     </div>
		     <div id="main4" class="card text-center rounded-0 border-0">
		         <div class="card-body">
		             <p class="card-title">친환경 제품</p>
		             <p class="card-text">환경을 생각하는 친환경 의류복</p>
		             <a href="#" class="btn banner-btn bg-white rounded-0">지금 쇼핑하기</a>
		         </div>
		     </div>
		</section>
	</div>
	<section id="adv">
		<div class="bottom-con">
	        <br><br><br>
	        <h4><a href=#>지속가능성</a></h4>
	        <div class="row mx-auto bottom-img-group">
	            <div class="col-xs-4 col-md-4 img-box">
	              <a href="#" class="thumbnail">
	                <img class="image" src="/mainImages/story(1).jpg" >
	                <br>
	                <p style="margin: 10px"></p>
	                <b>제목</b><br>
	                Read The Story</p>
	              </a>
	            </div>
	            <div class="col-xs-4 col-md-4 img-box">
	               <a href="#" class="thumbnail">
	                 <img class="image" src="/mainImages/story(2).jpg">
	                 <br>
	                 <p style="margin: 10px">
	                 <b>제목</b><br>
	                 Read The Story</p>
	               </a>
              	</div>
              	<div class="col-xs-4 col-md-4 img-box">
	                <a href="#" class="thumbnail">
	                  <img class="image" src="/mainImages/story(3).jpg">
	                  <br>
	                  <p style="margin: 10px">
	                  <b>제목</b><br>
	                  Read The Story</p>
	                </a>
              	</div>
	          </div>
	        <br><br>
		</div>
    </section>
	<jsp:include page="footer.jsp" flush="false" />   
</body>
</html>