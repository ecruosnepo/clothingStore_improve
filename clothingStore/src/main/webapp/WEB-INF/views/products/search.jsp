<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="keyword" value='<%=request.getParameter("keyword") %>' />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Slick Slide CSS -->
	<link rel="stylesheet" type="text/css" href="/css/slick.css">
  	<link rel="stylesheet" type="text/css" href="/css/slick-theme.css">
    <title>Document</title>    
    <style>
        .list-wrap {
            display : grid;
            grid-template-areas: 
            "description description"
            "aside article"
            "aside article";
            grid-template-rows: 10% 70% 20%;
            grid-template-columns: 200px 1fr;
            grid-gap: 10px;            
            margin: 0;
            margin-bottom:100px !important;
            background-color: #FAF9F8;
        }
        a{            
            text-decoration: none;
            color: black;
        }
        a:hover{ 
            color: #d6001c;             
        }
        .row-cols-4>*{
        	flex:0 0 calc(25% - 4px);
        }
        .row-cols-3>*{
        	flex:0 0 calc(33.333333% - 4px);
        }       
        #catDesc{
            grid-area: description;
            width:100%;            
            padding: 0;
            overflow: hidden;
            text-align:center;
        }
        #catDesc h5{
        	margin-bottom:10px;
        	font-weight:600;
        }
        .dropdown-title{
        	font-size:14px;
        }
        li{
            list-style: none;
        }
        #filter{
        	padding-bottom:18px;
        }
        #filterList > li{
            display: inline;
        }
        .sticky-top{
            background-color: #FAF9F8;
        }
        #productsList{
            grid-area: article;
            padding: 0;           
            padding-right: 32px;
        }
        #products{
        	grid-column-gap: 4px;
        }
        #products > *{
            padding: 0;
        }
        .container{
            margin:0;
            max-width: 100%;
        }
        .productInfo{
        	height:auto;
        	margin-bottom:20px;
        }
        .productImg > img{
            width: 100%;
        }
        .pd_info{        	
        	magin-top:10px !important;
        }
        .pd_name, .pd_price{
        	margin-bottom:0;
        	font-weight:bold;
        	font-size:13px;
        }        
        #sideNav{
            grid-area: aside;
            padding: 10px;
        }
        .cat-list-box, .cat-list-box > *{
        	background-color: #FAF9F8;
        }
        .card-header{
            padding: 0;
            background-color: unset;
            border:unset;
        }
        .card-body{
            padding: 0 20px;
        }
        .main-cat, .sub-cat{
        	font-weight:bold;        	
            color: black;
            padding: 0;
        }
        .sub-cat-box{
        	padding-top:10px;
        }
        .sub-cat{
        	font-size:13px;
        	font-weight:600;
        }
        .main-cat:hover, .sub-cat:hover{
            color:#d6001c;
        }
        .cat-box{
            border: unset;
        }
        .plist-dropdown-menu{
        	padding:0;
        	border:0;
        }
        .plist-dropdown-item:hover {
        	background-color:#f4eddd;
        }
        .dropdown-menu > .form-check{
            padding: 10px 40px;
        }
        .nav-pills .show > .nav-link {
            color: #d6001c;
            background-color: unset;
        }
        .main-cat{
            padding:12px 6px;
            border: unset;
        }
        .main-cat:focus{
            box-shadow: unset;
            color: #d6001c;
        }
        .main-cat{
            padding-bottom: 0;
        }
        
        .no-result p{
        	line-height: 20px;
        	font-size: 13px;
        	font-weight:600;
        	margin-bottom:0;
        }
        .favorite-row{
        	margin:50px 0;
        }
        .favorite-row h3{
        	margin:0 auto;
        	width:70%;
        	margin-bottom:20px;
        }
        .recommand-box{
        	width:100%;
        }
        .recommand-slide{
        	width:70%;
        	margin:0 auto;
        }
        .slick-prev:before,
	    .slick-next:before {
	      color: black;
	    }

    </style>
</head>
<body>
	<div id="catDesc">
    	<%
	    	if(request.getAttribute("result")=="0") {
    	%>
	    	<div class="no-result">
	    		<h5>일치하는 아이템 없음</h5>
	    		<p>검색 "<%=request.getParameter("keyword") %>"과(와) 일치하는 결과가 없습니다.</p>
	    		<p>맞춤법을 확인하거나 넓은 의미의 검색어로 다시 시도하십시오.</p>    	
	    	</div>
   		</div>
   		 <!-- 상품 추천 -->	     
   		 <div class="row favorite-row">   	
   		 	<h3>SELECTED FAVORITES</h3>	 	
	        <div class="recommand-box">
	        	<div class="recommand-slide">
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>
		            <div><img alt="" src="http://placehold.it/296x506"></div>        	
	        	</div>        
	        </div>
   		 </div>
    	<%		
    		}else{
    	%>

       	<h5><%=request.getParameter("keyword") %>에 대한 결과 표시</h5>        

    </div> 
	<div class="container list-wrap">
	    <!-- 사이드 네비게이션 바 -->
	    <aside id="sideNav">
	      
	    </aside>
	
	    <!-- 상품 목록 -->
	       
	    <article id="productsList">
	        <div id="filter" class="sticky-top">
	            <ul class="nav nav-pills">
	                <li class="nav-item dropdown dropdown-title">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="padding-left:0;">정렬 기준</a>
	                    <div class="dropdown-menu plist-dropdown-menu">
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="new" checked>
	                            <label class="form-check-label" for="sortbyprice">
	                                최신
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="low_price">
	                            <label class="form-check-label" for="sortbyprice">
	                                최저가
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="high_price">
	                            <label class="form-check-label" for="sortbyprice">
	                                최고가
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item dropdown dropdown-title">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사이즈</a>
	                    <div class="dropdown-menu plist-dropdown-menu">
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="checkbox" name="sizeview" id="sizeview" value="S">
	                            <label class="form-check-label" for="sizeview">
	                                S
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="checkbox" name="sizeview" id="sizeview" value="M">
	                            <label class="form-check-label" for="sizeview">
	                                M
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item plist-dropdown-item">
	                            <input class="form-check-input" type="checkbox" name="sizeview" id="sizeview" value="L">
	                            <label class="form-check-label" for="sizeview">
	                                L
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item ml-auto">
	                    <button class="btn bigbtn">크게</button> 
	                    <button class="btn smallbtn">작게</button>
	                </li>
	            </ul>
	        </div>
	        <div class="product-container">
	            <div id="products" class="row row-cols-4 mx-0">            
	        	<c:forEach items="${pd_list }" var="pd_dto">
	                <div class="productInfo col">
	                    <a class="productImg" href="/productpage/${pd_dto.pd_id }">
	                    <c:forTokens items="${pd_dto.pd_img }" var="img" delims="," varStatus="status">
		                    <c:if test="${status.first == true }">
	                    		<c:set var="firstimg" value="${img }"/>
	                    	</c:if>
		                    <c:if test="${status.last == true}">
		                        <img src="/images/${img}" onmouseover="this.src='/images/${firstimg}'" onmouseout="this.src='/images/${img}'" alt="">
		                    </c:if>
	                    </c:forTokens>              
	                    </a>
	                    <div class="pd_info" style="margin-top:20px;">
	                        <p class="pd_name"><a href="/productpage/${pd_dto.pd_id }">${pd_dto.pd_name }</a></p>
	                        <p class="pd_price">&#8361; <fmt:formatNumber value="${pd_dto.pd_price }"/></p>
	                    </div>
	                </div>        		
	        	</c:forEach>      
	            </div>
	        </div>
	    </article>
	</div>
	<%
    		}
    %>
	<script src="/css/slick.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(".bigbtn").click(function(){
            $('#products').removeClass('row-cols-4').addClass('row-cols-3');
        });
        $(".smallbtn").click(function(){
            $('#products').removeClass('row-cols-3').addClass('row-cols-4');
        });
        $(".main-cat").collapse({
            hide:true
        });        
    </script>
    <script>
    	$(function(){
    		$("input:checkbox").change(function(){
    			var sortby = $("input:radio[name='sortbyprice']:checked").val();
    			var size = [];    			
    			$("input:checkbox[name='sizeview']:checked").each(function(i){
					size.push($(this).val());
            	});
    			
    			$.ajax({
                    url: "/searchProduct?keyword="+"${keyword}",
                    type: 'GET',
                    data: {
                    	size : size,
                    	sortby : sortby
                    },
                    success:function(pd_list){
                    	var result = $(pd_list).find('.product-container');
                    	$('.product-container').html(result);
        			}
                });
    		});
    		$("input:radio").change(function(){
    			var sortby = $("input:radio[name='sortbyprice']:checked").val();
    			var size = [];    			
    			$("input:checkbox[name='sizeview']:checked").each(function(i){
					size.push($(this).val());
            	});
    			
    			$.ajax({
                    url: "/searchProduct?keyword="+"${keyword}",
                    type: 'GET',
                    data: {
                    	size : size,
                    	sortby : sortby
                    },
                    success:function(pd_list){
                    	var result = $(pd_list).find('.product-container');
                    	$('.product-container').html(result);
        			}
                });
    		});
    		
    		$(".recommand-slide").slick({
	   		     dots: false,
	   		     infinite: true,
	   		     slidesToShow: 4,
	   		     slidesToScroll: 4
   	   		});
    	});
    </script>  
</body>
<jsp:include page="../footer.jsp" flush="false" /> 
</html>