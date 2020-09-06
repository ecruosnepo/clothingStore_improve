<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Slick Slide CSS -->
<link rel="stylesheet" type="text/css" href="/css/slick.css">
<link rel="stylesheet" type="text/css" href="/css/slick-theme.css">

<title>Hello, world!</title>
<style>
	.pd-page-wrap{
	    margin: 0;            
	    height: auto;
	    padding: 32px;
	    max-width: none;
	    width: 100%;
	    background-color: #FAF9F8;
	}
	.row{
	    margin: 0;
	    width: 100%;
	}
	/* 상품 이미지 */
	.img-group{
	    padding: 0px;
	    height: 100%;
	}
	.pd-top{
	    height: 74%;            
	}
	.img1, .img2{
	    margin: 0;
	    height: 40%;
	    justify-content: center;       
	}
	.pd-img{
	    width: calc(50% - 2px);
	}
	
	/* 옵션 선택 */
	.pd-option{
	    padding: 0 28px 60px 70px;
	    position: relative;
	}
	.pd-option *{
		font-weight:600;
		z-index:1;
	}
	.color-label{
		font-size:13px;
	}
	.option-box{
		top:40px;
	}
	.color-select{
	    margin: 30px 0;
	}
	input[type="radio"] {            
	    display:none;
	}
	.form-check-label{
	    cursor: pointer;    
	}
	.form-check input:checked +.form-check-label{
	    border: 1px solid red;
	}
	.color-list-box{
		margin: 40px 0;
	}
	.color-list{
		list-style-type:none;
	}
	.color-carousel-item{
	    text-align: center;
	}
	.color-img{
	    width: 60px;
	}
	.size-list{
	    margin-bottom: 30px;
	    font-size:13px;
	    border:1px solid #d0d0d0;
	    height:46px;
	}
	.size-list:focus{
		border:unset;
	}
	.size-list option{
		padding: 10px 15px;
	}
	.add-cart{
	    width: 100%;
	    height: 45px;
	    background-color:#222;
	    color:white;
	}
	.add-cart > span:before{
		width: 15px;
	  	height: 15px;
	  	background-image: url("/icons/icon_bag.png");
		filter: invert(100%);
	  	background-size: 24px;
	  	content: '';
	  	display: inline-block;          	
	  	background-size: contain;
	  	background-position: center center;
	  	background-repeat: no-repeat;
	  	margin: auto 5px;
	  	position: relative;
	  	top:3px;
	}
	.add-cart > span{
		font-size:13px;        	
	}
	.add-cart:hover {
		color:white;
	}
	.pd-desc{
	    margin: 0;
	    height:20%;
	}

	/* 상품 정보 푸터 */
	.pd-footer{
	    height: 60px;            
	    position: sticky;
	    bottom: 0;
	    background-color: #FAF9F8;
	}
	.footer1-box{
	    max-width: calc(100vw - 505px);
	    width: calc(66vw - 2 * 40px);
	    padding: 0 40px;
	    margin: auto 0;
	}
	.footer1-nav a{            
	    color: black;            
	}
	.footer1-nav a:hover{
	    text-decoration: none;                  
	}
	.footer1-nav{            
	    justify-content: center;
	    align-items: center;            
	}
	.pd-recommand{
	    height: 20% ;
	}

	/* 사이드 푸터 내용 */        
	.sidepanel  {
		width: 0;
		position: fixed;
		z-index: 1100;
		height: 100%;
		top: 0;
		right: 0;
		background-color: #111;
		overflow-x: hidden;
		transition: 0.5s;
		padding-top: 60px;
	}
	
	.sidepanel span {
		padding: 8px 32px 8px 32px;
		text-decoration: none;
		font-size: 17px;
		color: #818181;
		display: block;
		transition: 0.3s;
	}
	
	.sidepanel a, .sidepanel a:hover {
		text-decoration: none;
		color: #f1f1f1;
	}
	
	.sidepanel .closebtn {
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 36px;
	}

	/* 추천 */
	.recommand-box{
		width:100%;
	}
	.recommand-slide{
		width:70%;
		margin:0 auto;
	}
	
	.toast-cart{
		width:375px;
		z-index:1300;
		font-weight:600;
		display:none;
	}
	.toast-body{		
		height:auto;
		overflow:hidden;
	}
	.toast-body img{
		float:left;
		display:inline-block;
	}
	.toast-product-info{
		display:inline-block;		
	}
	.toast-product-info p{
		margin-bottom:0;
	}
	.toast-product-info span{
		display:inline-block;
		font-size:11px;
		width:50%;
	}
</style>
<style>
	/* slick  */
	.slick-prev:before,
	.slick-next:before {
	  color: black;
	}
	   
	.slick-list > .slick-track {    
	    margin-left:0;
	}
</style>
</head>
<body>
    <div class="container pd-page-wrap">
        <!-- 상품 설명 -->
        <div class="row pd-top">
            <div class="col-md-8 img-group">
                <!-- 상품 설명 사진1 -->
                <div class="row img1">
                	<c:forTokens items="${pd_dto.pd_img }" var="img" delims="," varStatus="status">
                        <img class="pd-img main-img" src="/images/${img}" alt="">
                        <c:if test="${status.last}">
                        	<c:set var="cart_img" value="${img }"></c:set>                        	                      	
                        </c:if>
                    </c:forTokens>
                </div>
                <!-- 상품 설명 글 -->
                <div class="row pd-desc">

                </div>
                <!-- 상품 설명 사진1 -->
                <div class="row img2">

                </div>
            </div>
            <!-- 상품 옵션 -->
            <div class="col-md-4 pd-option">
                <div class="option-box sticky-top">                    
           			<input type="hidden" name="pd_id" class="pd_id" value="${pd_dto.pd_id }" />
                    <h1 style="font-size:20px; font-weight:bold;">${pd_dto.pd_name }</h1>
                    <h1 style="font-size:20px; font-weight:bold;">&#8361; <fmt:formatNumber value="${pd_dto.pd_price }"/></h1>
                    <div class="color-list-box">
                    	<p class="color-label">${pd_dto.pd_color }</p>
						<ul class="regular" style="padding-left:0px;">
						<c:forEach items="${colorList }" var="colors">
                   		<li class="color-list">
                       		<a href="/productpage/${colors.pd_id }">	                                 	
                   			<c:forTokens items="${colors.pd_img }" var="img" delims="," varStatus="status">
		                    	<c:if test="${status.last == true}">
		                        	<img class="color-img" src="/images/${img}" alt="">
		                    	</c:if>
	                    	</c:forTokens>  
	                		</a>                                 	
                       	</li>
                      </c:forEach>
					  </ul>
					</div>
                    <div class="pd-select-buttons">
                        <select name="pd_size" class="form-control form-control-lg size-list rounded-0 shadow-none">                        	
                        	<c:choose>
								<c:when test="${fn:length(stock_list) == 0}">
									<option selected disabled>재고 없음</option>
								</c:when>
								<c:otherwise>
									<option selected disabled>사이즈 선택</option>
									<c:forEach var="stock" items="${stock_list}" varStatus="status">
										<option value="${stock.pd_size }">${stock.pd_size }</option>
									</c:forEach>
								</c:otherwise> 
							</c:choose>                        	
                        </select>
                        <c:choose>
							<c:when test="${fn:length(stock_list) == 0}">
								<button class="btn add-cart rounded-0" onclick="addCart()" disabled>
		                            <span>담기</span>
		                        </button>
							</c:when>
							<c:otherwise>
								<button class="btn add-cart rounded-0" onclick="addCart()">
		                            <span>담기</span>
		                        </button>
							</c:otherwise> 
						</c:choose>                        
                    </div>
                </div>
            </div>
        </div>
        <!-- 상품 설명 footer -->
        <div class="row pd-footer">
            <div class="col-xs-6 footer1-box">
                <ul class="nav footer1-nav">
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">세부 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">배송 및 결제</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">제품 배경</a>
                    </li>                    
                </ul>                
            </div>
            <div class="col-xs-6 footer2-box"></div>
        </div>
        <!-- 상품 추천 -->
        <div class="row">
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

        <div id="mySidepanel" class="sidepanel">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
            <span>
                H&M의 모든 제품은 독립된 공급업체에서 제작되며, 경우에 따라 우리의 존재가 진정한 차이를 만들 수 있는 개발 도상국에서 만들어지기도 합니다. H&M의 사업은 특히 여성들을 위한 일자리 창출과 독립을 지원하며, 결과적으로 그들이 경제적 어려움을 이겨내도록 돕고 경제 성장에 이바지합니다. 또한 H&M은 사람과 환경을 중시하는 우리의 이념을 공유하고 관행 개선을 위해 노력할 의사가 있는 업체와만 협력합니다. 모든 공급업체와 공장은 모든 근로자를 위한 공정한 임금과 좋은 노동 환경에 대한 요구 사항이 포함된 엄격한 지속가능성 약속에 서명해야 합니다. 우리는 전세계 생산 사무실에 헌신적이고 지속가능한 인력을 고용하도록 최선의 노력을 기울이고 있습니다.
패션 리사이클러가 되세요!
여러분도 환경 보호를 돕고 더욱 지속 가능한 패션을 만들 수 있습니다. 불필요한 옷이나 가정용 직물을 H&M 매장에 가지고 오면 다시 입을 수 있는 옷을 만드는 데 사용되거나 재사용 또는 재활용됩니다.
            </span>
        </div>
        
		<div class="overlay"></div>
    </div>
    <!-- 토스트 -->	
	<div class="toast toast-cart d-none" role="alert" aria-live="assertive" aria-atomic="true" style="position: fixed; top: 0; right: 0;">
	  <div class="toast-header">
	    <strong class="mr-auto">장바구니</strong>
	  </div>
	  <div class="toast-body">
	    <img src="/images/${cart_img }" class="rounded-0 mr-2" alt="" style="width:85px;">
    	<div class="toast-product-info">
    		<p><b>${pd_dto.pd_name }</b></p>
    		<p><b>&#8361;</b><b>${pd_dto.pd_price }</b></p>
    		<p><span>수량: </span><span>1</span></p>		
    		<p><span>컬러: </span><span>${pd_dto.pd_color }</span></p>		
    		<p><span>사이즈: </span><span class="toast-product-size">1</span></p>		
    	</div>
	  </div>
	</div>
    
    <!-- Slick Slide JS -->
    <script src="/css/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	 $(function() {      
	   $(".regular").slick({
	     dots: false,
	     infinite: false,
	     slidesToShow: 7,
	     slidesToScroll: 7
	   });

	   $(".recommand-slide").slick({
	     dots: false,
	     infinite: true,
	     slidesToShow: 4,
	     slidesToScroll: 4
	   });	   
	 });
	 </script>

    <!-- Optional JavaScript -->
    <script>
        $('#exampleModal').appendTo("body") 
    </script>
    <script>
        // 사이드 푸터 내용
        function openNav() {
            document.getElementById("mySidepanel").style.width = "450px";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }        
    </script>
    <!-- 장바구니 추가 -->
    <script type="text/javascript">
		function addCart(){
			var pId = $('.pd_id').val();
			var pSize = $('.size-list option:selected').val();

			console.log(pId);
			console.log(pSize);
			if(pSize.length>1){
				alert("사이즈를 선택해주세요.");
			}else{
				$.ajax({
					url:"/addCart",
					type:"post",
					data: {
							pd_id: pId,
							pd_size: pSize,
							pd_price: ${pd_dto.pd_price}	
						},
					success:function(data){
						if(data == false){
							alert("재고 부족");
						}else{
							console.log("성공");			        
							$('.toast-product-size').text(pSize);
							$('.toast').toast({delay: 4000});
							$('.toast').toast('show');
						}
					},
					error:function(){
						alert("로그인 후 이용하실 수 있습니다.");
					}
				});
			}			
		};

		$(".toast").on("show.bs.toast", function() {
            $(this).removeClass("d-none");
        });
        $(".toast").on("hidden.bs.toast", function() {
            $(this).addClass("d-none");
        });
	</script>
	<jsp:include page="../footer.jsp" flush="false" /> 
</body>
</html>