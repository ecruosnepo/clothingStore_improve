<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if(session.getAttribute("email") == null){
		response.sendRedirect("/login");
	}
%>
<%-- <% session.setAttribute("email", "123@123"); %> --%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<title>Hello, world!</title>
<style>
	body{
  		background-color:#FAF9F8;
  		font-weight:600;
  	}
  	header{
  		margin-bottom:50px;
  	}
  	.form-control{
  		padding:14px 25px 14px 10px;
  		height:auto !important;
  		font-weight:600;
  	}
  	label{
  		font-size:13px;
  	}
  	.sidebar{
		overflow:hidden;
		height:auto;	
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
	.info-group{
		padding-right:20px !important;
	}
  	.inputContents{
  		background-color:white;
  		margin-bottom:20px;
  	}
	.container{
		height: 100vh;
	}
	p{
	  	margin:0;
	}
	.user-info, .address-info, .payment-info{
		margin-bottom:30px;
	}
	.info, .sidebar{         
		width: 100%;
		padding: 40px;
		padding-bottom:0px;
		background-color:white;
	}
	h5{
		font-weight:600;
	}
	form h5{
		padding-bottom:20px;
	}
	.container > .row {
		height: 100%;
		border: none;
	}
	.btn:hover{
		text-decoration: underline;
	}
	.btn:focus{
		box-shadow: none;
	}
	.btn{
		padding: 20px 0;
	}
	.user-order-form, .address-order-form, .payment-order-form{
		display:none;
		width:100%;
	}	
	.result{
		margin-bottom: 30px;
		padding-bottom: 10px;
	}

	.info *{
		width: 100%;
	}	
	.readonly-content{
		font-size:13px;
		font-weight:600;
		line-height: 1.5;
		margin-bottom:4px;
	}
	.selectedAddress{
		text-align:left;
		padding: 0px 25px;
	}
	.radioBox {
		position:relative;
		display:flex;
		align-items: center;
		padding: 0 24px;
		width:100%;
	}
	.radioBox:hover{
		background-color:#F4EDDD;
	}
	.radioBox label{
		margin-bottom:0px;
		padding: 21px 0;
	}
	.radioBox input[type='radio']{
		box-sizing: border-box;
		margin: 0 10px 0 0;
	}
	.dv-method{
		display:block;
		font-size:13px;
	}
	.dv-period{
		display:block;
		font-size:11px;
	}
	.dv-select-price {
		text-align:right;
		position:absolute;
		right:30px;
		top:28px;
	}
	input[type='radio']:checked {
		background-color:#F4EDDD;
	}
	.selectedAddress{
		height:60px;
	}
	.addressList:hover{
		background-color:#F4EDDD;
	}
	button{
		border:none;
		background:none;
	}
    button:focus { 
		outline: none; 
	}
	.address-innerBox{
		margin-bottom:20px;
	}
	.submitBtn{
		background-color:black;
		color:white;
		height:50px;
		padding:7px 20px;
		margin:10px 0 20px;
		font-size:13px;
		font-weight:600;
	}
	.payment-list{
		text-align: center;
	}
	.card-body{
		border:none;
	}
	.orderTotal{
		margin: 30px 0;
		width:100%;
	}
	.orderTotal th, .orderTotal td{
		font-size:13px;
	}
	.orderTotal td{
		text-align:right;
	}
	.orderDetail{
		font-size:13px;
		font-weight:600;
		text-align:left;
		padding:20px 0;
	}
	.orderDetail:hover{
		color:#D6001C;
	}
	.card{
		padding:0;
	}
	.cart-item{        	
		height: auto;
		padding: 10px 0;
		border-bottom: 1px solid lightGray;
	}
	.cart-img-box {
		float:left;
		overflow:hidden;
		width:25.333%;
		display:inline-block;
		height:100%;					
	}
	.cart-img{
		height:auto;
		width:100%;
	}
	.orderProduct{
		display:inline-block;
		width:calc(100%-26%) !important;
		padding:0 20px;
	}
	.submit-btn{
		width: 100%;
		margin: 30px 0;
		margin-right:-15px;
		margin-left:-15px;
		padding: 0 0px 50px;
	}
	.submit-btn button{
		background-color:#222;
		color:white;
		font-size:13px;
		font-weight:600;			
		padding: 12px 21px 11px;
		line-height:1;
	}
	.submit-btn button:hover{			
		text-decoration:none;
		color:white;
	}
	.col-side{
		padding-left:20px;
	}
	.required-field:after{
		content: "*";
		color: #d6001c;
		font-size:15px;
		margin-left:2px
	}
</style>
</head>
<body>
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <div class="container">
    <header>
    	<a class="header_logo" href="/"></a>
    </header>
      <div class="row">
        <div class="col-md-7 info-group">
          <div class="row user-info">
            <div class="user-readonly readonly info">
              <h5>내 정보</h5>
              <p class="readonly-content">이메일</p>
              <p class="readonly-content">${user.user_email }</p>
              <button class="user-info-btn btn" onclick="editUserInfo(this)">수정</button>
            </div>
            <form class="user-order-form" method="post">
              <h5>내 정보</h5>
              <input name="user_email" type="hidden" value="${user.user_email }"/>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault01" class="required-field">이름</label>
                  <input name="user_name" type="text" class="form-control rounded-0" id="validationDefault01" value="${user.user_name }" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-3 mb-3">
                  <label for="validationDefault03" class="required-field">우편번호</label>
                  <input name="main_address1" type="text" class="form-control rounded-0" id="postcode" value="${user.main_address1 }" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03" class="required-field">주소</label>
                  <input name="main_address2" type="text" class="form-control rounded-0" id="address" value="${user.main_address2 }" required>
                </div>                
              </div>
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">아파트 명/건물 명</label>
                  <input name="main_address3" type="text" class="form-control rounded-0" id="address-name" value="${user.main_address3 }">
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">동 호수/층수</label>
                  <input name="main_address4"  type="text" class="form-control rounded-0" id="address-dong" value="${user.main_address4 }">
                </div>                
              </div>
              <button class="submitBtn" onclick="DaumPostcode()">주소 검색</button>
              <div class="form-row">                
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03" class="required-field">전화번호</label>
                  <input name="user_phone"  type="text" class="form-control rounded-0" id="address-dong" value="${user.user_phone }" required>
                </div>                
              </div>              
              <button class="submitBtn" onclick="editUserInfoBtn(this)">배송 단계로 넘어가기</button>
            </form>            
          </div>
          
          <div class="row address-info">
            <div class="address-readonly info readonly">
            	<h2 style="font-size:20px; padding-bottom:20px; margin:0; font-weight:600;">배송</h2>
				<p class="readonly-content">배송 종류</p>
				<p class="readonly-content readonly-option">일반 배송</p>
				<br>
				<p class="readonly-content">배송 주소</p>
				<p class="readonly-content readonly-address">${aDto.r_name} ${aDto.address1 } ${aDto.address2 } ${aDto.address3 } ${aDto.address4 }</p>
				<br>
				<p class="readonly-content">배송 업데이트를 위한 전화번호</p>
				<p class="readonly-content readonly-phone">${user.user_phone }</p>
				<button class="address-info-btn btn" value="수정" onclick="editAddressInfo(this)">
	              수정
	            </button>
            </div>            
            <form class="address-order-form">
            	<h2 style="font-size:20px; padding-bottom:20px; margin:0; font-weight:600;">배송</h2>
            	<p style="font-size:16px; padding-bottom:24px;">배송 방법 선택</p>
				<div class="deliveryMethodSelect inputContents">
					<div class="radioBox">
						<input type="radio" id="basicMethod" name="dv_option" checked="checked" value="2500"/>
						<label for="basicMethod">
							<span>
								<span class="dv-method">일반 배송</span>
								<span class="dv-period">1-2 일</span>
							</span>
							<span class="dv-select-price">&#8361;2500</span>
						</label>
					</div>
					<div class="radioBox">
						<input type="radio" id="fastMethod" name="dv_option" value="3000"/>
						<label for="fastMethod">
							<span>
								<span class="dv-method">익일 특급 배송</span>
								<span class="dv-period">1 일</span>
							</span>
							<span class="dv-select-price">&#8361;3000</span>
						</label>
					</div>
				</div>
				<p style="font-size:16px; padding-bottom:24px;">배송 주소</p>
				<div class="addressSelectBox">					
					<!-- Button trigger modal -->
					<button type="button" data-toggle="modal" data-target="#exampleModal" class="selectedAddress inputContents">
					  	<span class="dv_name">${aDto.r_name }</span>,
	        			<span class="dv_address1">${aDto.address1 }</span>,
	        			<span class="dv_address2">${aDto.address2 }</span>,
	        			<span class="dv_address3">${aDto.address3 }</span>,
	        			<span class="dv_address4">${aDto.address4 }</span>
					</button>
					
					<!-- Modal -->
					<div class="modal fade modal-address" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content">					      
					      <div class="modal-body">
					        <c:forEach items="${address_list }" var="aList">
       						 	<div class="addressList">
					        		<button type="button" class="addressBtn" onclick="selectAddress(this)" data-addrid="${aList.address_index }">
					        			<span class="selected_name">${aList.r_name }</span>,
					        			<span class="selected_address1">${aList.address1 }</span>,
					        			<span class="selected_address2">${aList.address2 }</span>,
					        			<span class="selected_address3">${aList.address3 }</span>,
					        			<span class="selected_address4">${aList.address4 }</span>
					        		</button>
					        	</div>   
						    </c:forEach>
					      </div>					      
					    </div>
					  </div>
					</div>
				</div>
				<div class="phoneBox address-innerBox">
					<label for="dv_phone" class="required-field">필수 전화번호</label>
					<input type="text" class="dv_phone form-control" id="dv_phone" name="dv_phone" value="${user.user_phone }" style="height:50px;">
				</div>
				<div class="message address-innerBox">
					<label for="dv_message" class="required-filed">배송업체에 전하는 메세지</label>
					<input type="text" class="dv_message form-control" name="dv_message" style="height:50px;">
				</div>
				<button class="submitBtn" type="button" onclick="editAddressInfoBtn()">결제 단계로 넘어가기</button>
            </form>            
          </div>
          
          <div class="row payment-info">
            <div class="payment-readonly info readonly">
            	<h5>결제 및 할인</h5>
            	<p class="readonly-content">결제 방법</p>
            	<p class="payment-checked readonly-content"></p>
				<button class="payment-info-btn btn" value="수정" onclick="editPaymentInfo(this)">
	              수정
	            </button>
            </div>
            <form class="payment-order-form">
            	<h5>결제 및 할인</h5>
            	<p style="font-size:16px; padding-bottom:24px;">결제 방법</p>
            	<div class="paymentMethodSelect inputContents">
					<div class="radioBox form-check">
						<input class="payment-radio" type="radio" id="card" name="payment_method" value="html5_inicis"/>
						<label class="form-check-label" for="card">카드 결제</label>
					</div>
					<div class="radioBox form-check">
						<input class="payment-radio" type="radio" id="kakao" name="payment_method" value="kakaopay" checked/>
						<label class="form-check-label" for="kakao">카카오 페이</label>
					</div>
				</div>
            </form>            
          </div>
          <div class="row submit-btn">
          	<button class="btn rounded-0" onclick="checkout()">결제 단계로 넘어가기</button>
          </div>
          
        </div>
        <div class="col-md-5 col-side">
        <div class="sidebar result">
        	<div class="">
	         	<h5>고객님의 주문</h5>         	
	         	<div>
	         		<table class="orderTotal">
	         			<tr>
	         				<th>주문 가격</th>
	         				<td><span class="pd_sum_price">${sum }</span></td>
	         			</tr>
	         			<tr>
	         				<th>배송</th>
	         				<td><span class="dv_price"></span></td>
	         			</tr>
	         			<tr>
	         				<th style="font-size:16px;">합계</th>
	         				<td><span class="total_price"></span></td>
	         			</tr>
	         		</table>
	         	</div>
        	</div>
	       	<p>
			  <button class="orderDetail" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			    주문 세부 정보 보기
			  </button>
			</p>
			<div class="collapse" id="collapseExample">
			  <div class="card card-body">
		    	<!-- <div class="orderProductList"> -->
		    	<c:forEach items="${cart_list }" var="cList">
			    	<div class="cart-item ${cList.cart_id}">
	          			<c:forTokens items="${cList.pd_img }" var="img" delims="," varStatus="status">
	          				<c:if test="${status.last == true }">
		          				<div class="cart-img-box">
		          					<a class="cart-img-link" href="/productpage/${cList.pd_id }"><img class="cart-img" alt="" src="/images/${img}"></a>          				
		          				</div>
	          				</c:if>
	          			</c:forTokens>
				 		<div class="orderProduct">
		          			<span class="pd_id">상품명: ${cList.pd_name }</span><br/>
		          			<span class="pd_price">가격: ${cList.pd_price }</span><br/>
		       			    <span class="pd_id">상품 번호: ${cList.pd_id }</span>
						    <span class="pd_size">사이즈: ${cList.pd_size }</span><br/>
						    <span class="pd_color">컬러: ${cList.pd_color }</span>
						    <span class="price_sum">합계:${cList.pd_price*cList.pd_quantity }</span><br/>						    
	          			</div>
			    	</div>
			    	<c:set var="sum" value="${sum + cList.pd_price * cList.pd_quantity }"/>
          		</c:forEach>
			  </div>
			</div>        
          </div>
        </div>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script>
    	var total_price;
    
    	$(function(){
    		var input_pg = $('input:radio[name="payment_method"]:checked').val();
    		var dv_price = parseInt($("input:radio[name='dv_option']:checked").val());    		
    		var pd_sum = ${sum};
    		total_price = ${sum} + dv_price;
    		$(".total_price").text(total_price);
    		$(".dv_price").text(dv_price);
    		$(".pd_sum_price").text(pd_sum);
    		
    		$("input:radio[name='dv_option']").change(function(){
    			$.ajax({
                    url: "/updatePrice",
                    type: 'POST',
                    data: {
                    	dv_price : parseInt($("input:radio[name='dv_option']:checked").val())
                    },
                    success:function(data){
                    	console.log("성공");
                    	console.log(data);
                    	total_price = data;
                    	$('.total_price').text(total_price);
        			}
                });
    		});

    		$(".orderDetail").click(function() {
    			if($(".orderDetail").attr('aria-expanded')=='false'){
    			  $(".orderDetail").text("주문 세부 정보 숨기기");    				
    			}else{
				  $(".orderDetail").text("주문 세부 정보 보기");
    			}
   			});

			if(input_pg == "html5_inicis"){
	   			$(".payment-checked").text("카드 결제");
			}else if(input_pg == "kakaopay"){
				$(".payment-checked").text("카카오 페이");
			}
    	});
    </script>
    
    <script>
        function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("address-name").value = extraAddr;
                    
                    } else {
                        document.getElementById("address-name").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address-dong").focus();
                }
            }).open();
        }
    </script>
    
    <script>
	    function checkout(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp64616262'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;	        
	
	        IMP.request_pay({
	            pg : 'input_pg', // version 1.1.0부터 지원.
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '주문명:결제테스트',
	            amount : total_price,
	            buyer_email : '${user.user_email}',
	            buyer_name : '${user.user_name}',
	            buyer_tel : '${user.user_phone}',
	            buyer_addr : '${user.main_address2}${user.main_address3}${user.main_address4}',
	            buyer_postcode : '${user.main_address1}'
	        },function(rsp) {
	            if ( rsp.success ) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
	
	                $.ajax({
	                    url: "/checkout", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid,
	                        user_email : '${user.user_email}',
	                        dv_name : $('.dv_name').text(),
	                        dv_address1 : $('.dv_address1').text(),
	                        dv_address2 : $('.dv_address2').text(),
	                        dv_address3 : $('.dv_address3').text(),
	                        dv_address4 : $('.dv_address4').text(),
	                        dv_phone : $('.dv_phone').val(),
	                        dv_option : $('input:radio[name="dv_option"]:checked').val(),
	                        payment_method : $('input:radio[name="payment_method"]:checked').val(),
	                        dv_message : $('.dv_message').val(),
	                        total_price : $('.total_price').text(),
	                        order_state : '결제완료'
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    },
	                    success:function(result){
	    					if(result==1){
	        					console.log("성공");
	        					alert(msg);
	        					window.location = "/compliteCheckout";
	    					}else if(result == 0){
		    					console.log("재고 없음");
		    					var msg = '재고가 부족하여 결제에 실패했습니다.';
		    					alert(msg);
		    					window.location = "/cart";
	    					}
	        			}
	                });
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
		            alert(msg);
	            }
	        });
	    };
    </script>
    
    <!-- <script type="text/javascript">
		function test(){
			$.ajax({
                url: "/checkout", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : 214124214,
                    user_email : '${user.user_email}',
                    dv_name : $('.dv_name').text(),
                    dv_address1 : $('.dv_address1').text(),
                    dv_address2 : $('.dv_address2').text(),
                    dv_address3 : $('.dv_address3').text(),
                    dv_address4 : $('.dv_address4').text(),
                    dv_phone : $('.dv_phone').val(),
                    dv_option : $('input:radio[name="dv_option"]:checked').val(),
                    payment_method : $('input:radio[name="payment_method"]:checked').val(),
                    dv_message : $('.dv_message').val(),
                    total_price : $('.total_price').text()                
                    //기타 필요한 데이터가 있으면 추가 전달
                },
                success:function(result){
					if(result==1){
    					console.log("성공");
					}
    			}
            });
		};
    </script> -->
    
    <script>
      function editUserInfo(obj){
    	  $(obj).hide();
          $('.user-readonly').hide();
          $('.user-info').css("backgroundColor","#FAF9F8");
          $('.user-order-form').show();
      };

      function editAddressInfo(obj){
    	  $(obj).hide();
          $('.address-readonly').hide();
          $('.address-info').css("backgroundColor","#FAF9F8");
          $('.address-info').css("padding","0px");
          $('.address-order-form').show();
      };

      function editPaymentInfo(obj){
    	  $(obj).hide();
          $('.payment-readonly').hide();
          $('.payment-info').css("backgroundColor","#FAF9F8");
          $('.payment-order-form').show();
      };
      
      function editUserInfoBtn(){
		var userForm = $(".user-order-form").serialize();
   	  
   		$.ajax({
			url:"updateOrderUserInfo",
			type:"POST",
			data: userForm,
			success:function(data){
				console.log("성공");
			}
		});
	  };
	  
	  function editAddressInfoBtn(obj){
		var addreeFormArray = $(".address-order-form").serializeArray(),
	    	addressFormdataObj = {};
		
		for (i=0; i<addreeFormArray.length; i++) {
			$("#"+addreeFormArray[i].name).val(addreeFormArray[i].value);
		}
		
  	    $(obj).hide();
  	    if($('input[name="dv_option"]:checked').val() == "2500"){
  	    	$('.readonly-option').text('일반 배송');
  	  	}else{
  	  		$('.readonly-option').text('익일 특급 배송');
  	  	}
  	  	$('.readonly-address').text($('.dv_address1').text() + " " + $('.dv_address2').text() + " " +$('.dv_address3').text() + " " +$('.dv_address4').text());
  	  	$('.readonly-phone').text($('.dv_phone').val());
        $('.address-readonly').show();
        $('.address-info-btn').show();        
        $('.address-info').css("backgroundColor","white");
        $('.address-order-form').hide();
	  };

	  function selectAddress(obj){
		var addrid = $(obj).data("addrid");
		console.log(addrid);
		
		$.ajax({
            url: "/getDeliveryAddress", //cross-domain error가 발생하지 않도록 주의해주세요
            type: 'POST',
            data: {
                address_index : addrid                
            },
            success:function(result){
            	/* var addrInfo = $(result).find('.addressSelectBox');
            	$('.addressSelectBox').html(addrInfo); */
            	$('.r_name').text(result.r_name);
        		$('.dv_address1').text(result.address1);
        		$('.dv_address2').text(result.address2);
        		$('.dv_address3').text(result.address3);
        		$('.dv_address4').text(result.address4);
            	$('#exampleModal').modal('hide');
			}
        });
      };
    </script>
</body>
</html>