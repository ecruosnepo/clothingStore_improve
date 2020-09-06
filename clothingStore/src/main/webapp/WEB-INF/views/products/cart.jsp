<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% session.setAttribute("code", 3000); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body{
			background-color:#FAF9F8;
			font-weight:600;
			line-height:1;
		}
		.cart-wrap{
			margin-bottom:50px;
		}
	 	button{
		 	border:none;
		 	background:none;
		 	font-size:20px;
		}
		.hi{
		    text-align: center;
		    margin-bottom:24px;
		    font-size:11px;
		    font-weight:600;
		    line-height:20px;
		}
		.hi a{			
			text-decoration:none;
			color:black;
		}
		.hi a:hover{			
			color:#d6001c;
		}
		.cart-ad{
			width:1140px;
			text-align:center;
			margin:0 auto;
			padding:10px 0;	
		}
		.cart-ad > span{
			font-weight:600;
			font-size:13px;
		}
		.cart-container{
			max-width:1140px;
		}
		.row{
		   text-align: left;
		}
		.cart-item{
			position:relative;
			padding-bottom: 35px;
			margin-top:35px;
			border-bottom:1px solid #d0d0d0;
		}
		.cart-list-box > div:first-child {
			margin-top:0px;
		}
		
		.cart-list-box > div:last-child {
			border-bottom:none;
		}
		
		.cart-img-box, .cart-desc{
			display:inline-block;
			height: 174px;
		}
		.cart-desc{
			vertical-align:top;
			margin-top:14px;
			width:80%;
			padding:0 25px;
		}
		.cart-desc *{
			font-weight:600;
			font-size:13px;			
		}
		.cart-desc .pd_price{
			line-height:1.5;
		}
		.cart-desc span{
			font-size:12px;
			display:inline-block;
			width:23%;
		}		
		.pd_name{
			margin-bottom:0px;
			font-size: 14px;
		}
		.cart-img{
			height:100%;
		}
		.cart-img-box{
			float:left;
			overflow:hidden;
			display:inline-block;
		}
		#quantity{
			width:80px;
			height:48px;	
			text-align:center;
			margin-top:24px;							
		}
		.delete-btn{
			display:inline-block;
			position:absolute;
			right:0;
			outline:0;
		}
		.checkout-info{
			flex: 0 0 425px;
			height:100%;
			padding:0;
			margin-left:15px;
			font-size:13px;
			line-height:1.5;
		}
		.checkout-info-inner{
			background-color:#FFFFFF;
			padding:40px;			
		}
		.total-table th{
			text-align:left;
		}
		.total-table td{
			text-align:right;
		}
		.checkout-btn{
			align-items: center;
			font-size:13px;
			background-color:#222;
			font-weight:600;
			padding:12px;
			margin-top:24px;
		}
		.checkout-notice{
			margin-top:30px;
		}
		.delivery-notice{
			background-color:#FFFFFF;
			margin-top:20px;
			padding:40px;
		}
		
		.logout-cart, .empty-cart{
			background-color:white;
			items-align:center;
			padding:30px;			
		}
		.logout-cart h3, .empty-cart h3{
			font-weight:600 !important;
		}
		.logout-cart p, .empty-cart p{
			font-weight:600 !important;
			font-size:13px;
		}
		.logout-cart a{
			color:#222;					
		}
		.logout-cart a:hover{
			color:#222;			
		}
		
	</style>    
</head>
<body>
<div class="cart-wrap">
  	<div class="hi">
       <span><a href="like.html">HM.com</a> / <a href="bag.html">쇼핑백</a></span>
  	</div>
    <div class="cart-ad">
	    <span>KAKAO Pay Launch (더 빠르고, 간편하게 ! 카카오페이 런칭)</span>
    </div>
    <div class="container cart-container">
	<h1 style="font-size: 2.5em; padding:32px; text-align:center; font-weight:600;" >쇼핑백</h1>
	<div class="row">
         <div class="col-xs-5 col-sm-7 cart-list-box">
         <%         	
         	if(request.getAttribute("result")=="1"){         		
         %>
         		<div class="logout-cart">
         			<h3>로그인 후 이용하실 수 있습니다.</h3>
         			<p>장바구니를 이용하려면 로그인해야합니다.</p>
         			<p><a href="/login">로그인</a></p>
         		</div>
       		</div>
		<%
         	}else if(request.getAttribute("result")=="0"){
		%>
				<div class="empty-cart">
         			<h3>고객님의 쇼핑백이 비어있습니다.</h3>
         			<p>마음에 드는 상품을 담아보세요.</p>
         		</div>
       		</div>
		<%
         	}else{
		%>	
         	<c:forEach items="${cart_list }" var="cList">
         		<div class="cart-item ${cList.cart_id}">
         			<c:forTokens items="${cList.pd_img }" var="img" delims="," varStatus="status">
         				<c:if test="${status.last == true }">
         				<div class="cart-img-box">
         					<a class="cart-img-link" href="/productpage/${cList.pd_id }"><img class="cart-img" alt="" src="/images/${img}"></a>          				
         				</div>
         				</c:if>
         			</c:forTokens>
         			<div class="cart-desc">
         				<input type="hidden" value="${cList.cart_id }" name="cart_id" class="cart_id"/>
	          			<h3 class="pd_name">${cList.pd_name }</h3>
	          			<p class="pd_price">&#8361; <fmt:formatNumber value="${cList.pd_price }"/></p>
	       			    <span>상품 번호: </span><span class="pd_id">${cList.pd_id }</span>
					    <span>사이즈: </span><span class="pd_size">${cList.pd_size }</span>
					    <span>색상: </span><span class="pd_color">${cList.pd_color }</span>
					    <span>합계: </span><span class="price">&#8361;<span class="price_sum"><fmt:formatNumber value="${cList.pd_price * cList.pd_quantity }"/></span></span>
				    	<select name="pd_quantity" id="quantity" onchange="updateQuantity(this);">
					    <c:forEach var="x" begin="1" end="${cList.pd_stock }" step="1">
          					<c:choose>
          						<c:when test="${cList.pd_quantity eq x}">
          							<option value=${x } selected>${x }</option>
          						</c:when>
          						<c:otherwise>
	          						<option value=${x }>${x }</option>
          						</c:otherwise>
          					</c:choose>					    
					    </c:forEach>
         				</select>
      				</div>     			
         			<button class="delete-btn" onclick="deleteCart(this)">&#10005;</button>
         		</div>
         		<c:set var="sum" value="${sum + cList.pd_price*cList.pd_quantity }"/>
         	</c:forEach>           
         	</div>
   	   <%
       		}
       %>
         	<div class="col-xs-100 col-sm-5 checkout-info">
          	<div class="checkout-info-inner">
	            <p style="margin:0;">할인 코드 추가</p>
	          	<form action="/checkoutForm" method="post">
		            <div class="form-group" style="margin:8px 0">
		              <input type="text" class="form-control rounded-0" id="exampleInputcard" style="height:48px;">
		            </div>	          	
		          	<table class="total-table">
		          		<tr>
			          		<th>주문가격</th>
			          		<td>&#8361; <span class="pd_price_sum"><fmt:formatNumber value="${sum }"/></span></td>
		          		</tr>
		          		<tr class="dv_price_row">
			          		<th>배송</th>
			          		<td>&#8361; <span class="dv_price">2500</span></td>
		          		</tr>
		          		<tr>
			          		<th>합계</th>
			          		<td>&#8361; <span class="total_price"><fmt:formatNumber value="${sum }"/></span></td>
		          		</tr>
		          	</table>
	          		<button class="btn btn-dark btn-lg btn-block checkout-btn rounded-0" onclick="checkout()">결제 계속하기</button>
          		</form>
	          	<div class="checkout-notice">
		            <p>가능한 결제 수단</p>
		            <p>귀하가 결제 단계에 도달할 때까지 가격 및 배송료는 확인되지 않습니다.</p>
		            <p>30일의 반품 가능 기간, 반품 수수료 및 미수취시 발생하는 추가 배송 요금 읽어보기 반품 및 환불</p>			           	
	          	</div>
          	</div>
      		<div class="delivery-notice">
	            <p>5만원 이상 구매 시 무료배송!</p>
	            <p>8월 14일 택배인 리프레시데이를 맞아 8월 14일에서 16일까지 3일간 배송과 반품이 이루어지지 않습니다. 따라서 13일 23시 이전 주문건에 한해 17일부터 순차적으로 배송이 재개 됩니다. 8월 17일부터 정상 배송 및 반품 예정이오니 고객님들의 너른 이해 부탁드립니다. 감사합니다.</p>
          	</div>
     		</div>
       </div>
   </div>
</div>

    <script>
    	function updateQuantity(obj){
	    	var form = {
	                cart_id: $(obj).parent('.cart-desc').children('.cart_id').val(),
	                pd_quantity: $(obj,'option:selected').val()
	        };		
	        
	        $.ajax({
	            url: "updateCartQuantity",
	            type: "POST",
	            dataType: "json",
	            data: form,
	            success: function(result){
	            	console.log("성공");
	            	if(result['pd_sum'] >= 50000){
		            	console.log("배송비 무료");
		            	$('.dv_price_row').hide();
	            		$('.total_price').text(result['total']);
			        }else{
			        	console.log("배송비 추가");
			        	$('.dv_price_row').show();
	            		$('.total_price').text(result['total']+2500);
					}
					$('.pd_price_sum').text(result['total']);
	            	$(obj).parents('.cart-desc').children('.price').children('.price_sum').text(result['pd_sum']);
	            }
	        });
		};
	</script>
	<script type="text/javascript">
		function deleteCart(obj){
			$.ajax({
				url:"deleteCart",
				type:"POST",
				data: {
						cart_id: $(obj).siblings('.cart-desc').children('.cart_id').val()
				},				
				success:function(data){
					$(obj).parent().remove();
				}
			});
		};

		function checkout(){
			var discount_code = <%session.getAttribute("code");%>
			
			$.ajax({
				url:"checkoutForm",
				type:"GET",
				data: {
					code: discount_code
				},
				success:function(data){
					console.log("성공");
				}
			});
		}
		
		$(function(){
			var isEmpty = <%=request.getAttribute("result")%>;
			if(isEmpty == "0" || isEmpty == "1"){
				$('.checkout-btn').prop("disabled",true);
				$('.dv_price').text("");
			}
		});
	</script>
  </body>
  <jsp:include page="../footer.jsp" flush="false" />  
</html>