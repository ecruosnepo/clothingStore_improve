<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">   
   
   <!-- slick -->
    <title>메인</title>

    <style>
    	.btn:focus{
    		box-shadow:none;    		
    	}
    	.dropdown-item:active{
    		background-color:unset;
    		color:#222;
    	}
        .header-wrap{
          max-width: 100%;
          background-color: #FAF9F8;
          padding: 0;          
        }
        .header_global{
          padding-top: 34px;
          position: relative;
          left: 0;
          top: 0;
        }
        .menu{
          position: relative;
          min-height: 151px;
        }
        .header_logo{
          display: block;
          width: 68px;
          height: 44px;
          margin: 20px auto 0;
          overflow: hidden;
        }
        .header_logo:before{
            width: 68px;
            height: 44px;
            display: block;
            background-image: url("/icons/headerlogo.png");
            content: '';
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            background-color: unset;
        }
        .header-wrap .dropdown:hover > .dropdown-menu {
            display: block;
        }
        .header-wrap .dropdown > .dropdown-toggle:active {            
            pointer-events: none;
        }
        .navbar{
          background-color: #FAF9F8;
          padding: 25px 0 0 0;          
        }
        .header-wrap .nav-link:hover{
          text-decoration: underline;
        }
        .navbar-light .navbar-nav .nav-link {
            color: rgb(0, 0, 0);
        }
        .header-wrap .header-nav-item > .dropdown-menu{
          width: 100%;
          text-align: center;
          padding-top:38px;
          padding-bottom:20px;
          border: 0;
          background-color: #FAF9F8;
          z-index: 1200;
        }
        .header-dropdown-title{
        	padding-bottom:0;
        }
        .dropdown-menu-box{
        	font-size:14px;
        }
        .header-wrap .dropdown-item,.nav-link{
          font-weight: bold;
        }
        .header-wrap .dropdown-toggle::after {
            display:none;
        }
        .searchbox{
          position: absolute;
          right: 45px;
          bottom: 0px;
        }
        .searchbar{
          padding: 10px 20px 8px 30px;
          border-top: 0;
          border-left: 0;
          border-right: 0;
          border-bottom: 1px solid black;
          border-radius: 0;
          background-color: #FAF9F8;
          font-size: small;
          font-weight: bold;          
        }
        .searchbar:focus{
          box-shadow: none;
          background-color: unset;
          border: none;
          border-bottom: 1px solid black;
        }
        .searchbtn{
          display: block;
          left: -3px;
          padding: 0;
          position: absolute;
          top: 3px;
          border: 0;
          background-color: unset;
        }
        .searchbtn:before{          
          background-image: url("/icons/icon_search.png");
          background-position: center center;
          background-repeat: no-repeat;
          background-size: 24px;
          content: '';
          display: block;
          height: 30px;
          width: 30px;
        }
        .menu_service{
          display: inline-block;
          letter-spacing: -4px;
          position: absolute;
          text-align: left;
          top: -20px;
          left: 28px;
          visibility: visible;          
        }
        .menu_service > a{
          color: black;
          text-decoration: none;
          letter-spacing:normal;
          font-weight: bold;
          font-size: small;
        }
        .menu_login_cart{
          position: absolute;
          right: 30px;
          top: -20px;
        }
        .btn-group > button{
          width: auto;
          font-size: small;
          font-weight: bold;
        }
        .btn-group > button:focus{
          box-shadow: none;
        }
        .btn-group > .cart:before{
          width: 20px;
          height: 20px;
          background-image: url("/icons/icon_bag.png");
          background-size: 24px;
          content: '';
          display: block;
          float: left;
          background-size: contain;
          background-position: center center;
          background-repeat: no-repeat;
          margin: 0 5px;
        }
        .btn-group > .login:before{
          width: 20px;
          height: 20px;
          background-image: url("/icons/icon_user.png");
          background-size: 24px;
          content: '';
          display: block;
          float: left;
          background-size: contain;
          background-position: center center;
          background-repeat: no-repeat;
          margin: 0 5px;
        }
        .dropdown-menu{
        	z-index:1300 !important;
        }
        .header-wrap .header-nav-item:hover > .dropdown-menu{
          display:block;
        }
        .header-wrap .btn-group:hover > .dropdown-menu{
          display: block;
        }
        .header-login-btn{
        	background-color:#222;
        	font-weight:600;
        	font-size:13px;
        }
        .dropdown-forgot{
        	font-size:13px !important;
        }
        .dropdown-signup{
        	font-size:11px !important;
        }
        .required-field{
        	font-size:13px;
        }
        .required-field:after {
		    content: "*";
		    color: #d6001c;
		    font-size:13px;
		    margin-left:2px
		}
		.dropdown-menu-login{
			font-weight: 600;
		}
    </style>
  </head>
  <body>
    <div class="container header-wrap">
      <header class="header_global">
          <div class="menu">
              <!-- 로고 -->
              <a class="header_logo" href="/"></a>
              <!-- 로그인 / 장바구니 -->
              <div class="menu_login_cart">
               <div class="btn-group">
               	<%
					if ( session.getAttribute("email") != null ){	
				%>

				<button class="btn dropdown-toggle login" onclick="location.href='/myPage';" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dropdown-account">
                   내 계정
                </button>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-account">             
                    <a class="dropdown-item" href="/myPage">내 계정</a>
                    <a class="dropdown-item" href="/customer">도움이 필요하세요?</a>
                    <a class="dropdown-item" href="/logout">로그아웃</a>
                  </div>  
                  </div>  
                <%
				 }  else if ( session.getAttribute("manager") != null ){
                %>
                  <button class="btn dropdown-toggle login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   관리자 계정
                  </button>
					<div class="dropdown-menu dropdown-menu-right">            
					  <a class="dropdown-item" href="/admin/adminQna">관리자 페이지</a>
					  <a class="dropdown-item" href="/logout">로그아웃</a>
					</div> 
                </div>
				<%
					}else{
				%>    
                  <div class="btn-group">
					<button class="btn dropdown-toggle login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="location.href='/login';" id="dropdown-account">
                    	로그인
                  	</button>
                  	
                  	<div class="dropdown-menu dropdown-menu-right rounded-0 border-0 shadow-sm dropdown-menu-login" aria-labelledby="dropdown-account">
                    <form class="px-4 py-3" action="/loginForm" method="post">
                      <div class="form-group">
                        <label for="exampleDropdownFormEmail1" class="required-field">이메일</label>
                        <input type="email" name="user_email" class="form-control rounded-0" id="exampleDropdownFormEmail1" placeholder="이메일">
                      </div>
                      <div class="form-group">
                        <label for="exampleDropdownFormPassword1" class="required-field">비밀번호</label>
                        <input type="password" name="user_password" class="form-control rounded-0" id="exampleDropdownFormPassword1" placeholder="비밀번호">
                      </div>
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" class="form-check-input" id="dropdownCheck">
                          <label class="form-check-label" for="dropdownCheck" style="font-size:11px;">
                            비밀번호 기억하기
                          </label>
                        </div>
                      </div>
                      <button type="submit" class="btn text-white header-login-btn rounded-0 btn-block">로그인</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item dropdown-forgot" href="/sendEmail">비밀번호를 잊어버리셨나요?</a>
                    <a class="dropdown-item dropdown-signup" href="/userSignUp">아직 계정이 없으세요? 여기서 가입하세요!</a>
                  	</div>  
                 </div>
                </div>
				<%
					} 
				%> 
                <div class="btn-group">
	                <button class="btn dropdown-toggle cart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick = "location.href = '/cart'" id="dropdown-cart">
                   		장바구니
                  	</button>
                  	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-cart">            
	                    <a class="dropdown-item" href="/admin/adminQna">관리자 페이지</a>
	                    <a class="dropdown-item" href="/logout">로그아웃</a>
                  	</div>
                </div>                
              </div>
              <!-- 고객센터 -->
              <div class="menu_service">
                <a href="/customer">고객 서비스</a>
              </div>
              <!-- 네비게이션 바 -->
              <nav class="navbar navbar-expand-lg navbar-light bg-light">                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto mr-auto">                    
                    <li class="header-nav-item">
                      <a class="nav-link dropdown-toggle header-dropdown-title" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        여성
                      </a>
                      <div class="dropdown-menu dropdown-menu-box" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">셔츠&블라우스</a>
                        <a class="dropdown-item" href="#">드레스</a>                        
                        <a class="dropdown-item" href="#">탑&티셔츠</a>
                      </div>
                    </li>
                    <li class="header-nav-item">
                      <a class="nav-link dropdown-toggle header-dropdown-title" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        남성
                      </a>
                      <div class="dropdown-menu dropdown-menu-box" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/productList/200">티셔츠&탱크탑</a>
                        <a class="dropdown-item" href="#">후디&스웨트셔츠</a>
                        <a class="dropdown-item" href="#">셔츠</a>
                      </div>
                    </li>
                    <li class="header-nav-item">
                      <a class="nav-link dropdown-toggle header-dropdown-title" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        유아동
                      </a>
                      <div class="dropdown-menu dropdown-menu-box" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">신생아</a>
                        <a class="dropdown-item" href="#">여아</a>
                        <a class="dropdown-item" href="#">남아</a>
                      </div>
                    </li>
                    <li class="header-nav-item">
                      <a class="nav-link header-dropdown-title" href="#">지속가능성</a>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0 searchbox" action="/searchProduct" method="get">
                    <input class="form-control searchbar" name="keyword" type="search" placeholder="제품 검색" aria-label="Search">
                    <button class="searchbtn" type="submit"></button>
                  </form>
                </div>
              </nav>
		</header>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->    
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!-- 카트 버튼 -->
  </body>
</html>