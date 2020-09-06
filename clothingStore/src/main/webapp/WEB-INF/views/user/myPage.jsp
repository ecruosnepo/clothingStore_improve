<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html> 
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>옷가게</title>
<style>
	.myPage-container{
		font-weight:600;
	}
	.myPage-container p{
		margin-bottom: 0;
	}
	.orderinfo-box{
		background-color:white;
		padding:32px 48px;		
		margin-bottom:30px;
		font-size:13px;	
	}
	.myPage-sidenav{
		max-width:28% !important;
	}
	.myPage-content{
		flex:0 0 72% !important;
		max-width:72% !important;
	}
	.sidenav-content{    
		background-color:#FAF9F8;
		height: auto;
	}
	.sidenav-content *{
		font-weight:600;
	}
	.sidenav-userinfo{
		font-size:13px;
	}
	.sidenav-title{
		font-size:16px;
	}
	.sidenav-sub a{
		font-size:13px;
		color:#222;
	}
	.sidenav-cate{
		margin-top:32px;
	}
	.content-title{
		font-size:16px;
		text-align:left;
	}
	.panel-heading {		
	}
	.orderinfo-table td{
		text-align:left !important;
	}
	.panel-body{
		height:auto;
		display:flex;
		margin-bottom:10px;
	}
	.panel-body p{
		margin-bottom:0;
	}
	.panel-body img{		
		width:131px;
		float:left;	 
	}
	.pd-info{
		display:inline-block;
		font-weight:600;
		margin-left: 10px;
	}
	.pd-info table{
		width:auto;
	}
	.pd-info th,.pd-info td{
		width:auto !important;
		height:auto !important;
		text-align:left !important;	
		font-size:11px;	
	}
	.pd-title{
		font-size:13px;
	}
	.pd-sub{
		font-size:11px;
	}
	.wrapper{
		width:100%;
	}
	@media(max-width:992px){
		.wrapper{
			width:100%;
		} 
	}
	.panel-heading {
		position:relative;
		padding:0;
		border:0;
	}
	.extend-arrow a{
		position:absolute;
		right:0px;		
		top:0px;
	}
	.panel-title a, .panel-title a:active{
		display:block;
		padding:15px;
		color:#222;
		font-size:16px;
		font-weight:bold;
		text-transform:uppercase;
		letter-spacing:1px;
		word-spacing:3px;
		text-decoration:none;
	}
	.panel-heading a::after {
		font-family: 'FontAwesome';
		content: "\f107";
		font-size:20px;
		float: right;
		transition: all 0.5s;
	}
	.panel-heading.active a::after {
		-webkit-transform: rotate(180deg);
		-moz-transform: rotate(180deg);
		transform: rotate(180deg);
	} 
	.deliveryinfo{		
		height:auto;
		margin-bottom:10px;
	}
	.order-summary{
		border-top:1px solid #e4e4e4;
		padding:16px 0;
		text-align:right;
	}
	.order-summary table{
		margin-left:auto;
	}
	.order-summary th, .order-summary td{				
		height:auto !important;
		font-size:13px;	
	}
	.order-summary td{
		width:30% !important;
		text-align:right !important;
	}
	.order-summary th{
		width:70% !important;
		text-align:left !important;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" flush="false" />
	<div class="container myPage-container"> 
    	<div class="row">
     		<div class="col-md-4 myPage-sidenav px-0">
      			<div class="sidenav-content">
			       <p class="sidenav-userinfo">${user_name }</p>
			       <p class="sidenav-userinfo">${email}</p>
			       <div class="sidenav-cate">
				       <p class="sidenav-title">내 계정</p>
				       <P class="sidenav-sub"><a href="/myPage/setting" class="button">내 설정</a></P> 
			       </div>
			       <div class="sidenav-cate">
				       <P class="sidenav-title"><label>도움이 필요하세요?</label></P>
				       <P class="sidenav-sub"><a href="/customerQna" class="button">문의하기</a></P> 
				       <P class="sidenav-sub"><a href="/logout" class="button">로그아웃</a></P>  
			       </div>
      			</div> 
      		</div>
			<%int i=0; %>
			<div class="col-md-8 myPage-content px-0">
				<p class="content-title">모든 구매 내역</p>
				<c:forEach items="${oDto}" var="oDto">
					<% i++; %>
					<div class="wrapper orderinfo-box">
						<div class="panel-group" id="accordion<%=i%>" role="tablist" aria-multiselectable="true" >
   							<div class="panel panel-default">
    							<div class="panel-heading" role="tab" id="headingOne<%=i%>">
      								<div class="panel-title">       									
       									<table class="orderinfo-table">
								            <tr>
									      	   <td class="left">거래 완료</td>
									           <td class="right">${oDto.payDate}</td>
									        </tr>	
									        <tr>
									           <td class="left">#${oDto.order_id}</td>
									           <td class="right">&#8361;${oDto.total_price}</td>	
									        </tr>  
 	  	 								</table>
 	  	 								<div class="extend-arrow">
       										<a role="button" data-toggle="collapse" data-parent="#accordion<%=i%>" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne"></a>
										</div>
      								</div>
    							</div>
    							<div id="collapseOne<%=i%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	        						<c:forEach items="${mDto }" var="mDto">
		        						<c:if test="${mDto.order_id == oDto.order_id }">
			        						<div class="panel-body">
				          						<c:forTokens items="${mDto.pd_img}" var="img" delims="," varStatus="status">
								                  	<c:if test="${status.last}">
								                      	<img src="resources/pdImages/${img}" />
								                   	</c:if>
							  					</c:forTokens>
							  					<div class="pd-info">
								  					<p class="pd-title">${mDto.pd_name}</p>
											        <p class="pd-title">&#8361;${mDto.pd_price}</p>
								  					<table>
								  						<tr>
								  							<th>상품번호:</th>
								  							<td>${mDto.pd_id}</td>
								  						</tr>
								  						<tr>
								  							<th>수량:</th>
								  							<td>${mDto.pd_quantity}</td>
								  						</tr>
								  						<tr>
								  							<th>컬러:</th>
								  							<td>${mDto.pd_color}</td>
								  						</tr>
								  						<tr>
								  							<th>사이즈:</th>
								  							<td>${mDto.pd_size }</td>
								  						</tr>
								  						<tr>
								  							<th style="font-size:16px !important;">합계:</th>
								  							<td style="font-size:16px !important;">&#8361;${mDto.price_sum}</td>
								  						</tr>
								  					</table>
							  					</div>
										        <c:set var="sum" value="${sum + mDto.price_sum}"/>
	        	 							</div>	 
		     							</c:if> 
		     						</c:forEach>
		     						<div class="deliveryinfo">
										<p style="margin-bottom:10px;">배송주소</p>
										<p>${oDto.dv_name}</p>
										<p>${oDto.dv_address1}</p>
										<p>${oDto.dv_address2}</p>
										<p>${oDto.dv_address3} ${oDto.dv_address4}</p>
		     						</div>
				 					<div class="order-summary">
				 						<table>
				 							<tr>
				 								<th>합계:</th>
				 								<td>&#8361;${sum}</td>
				 							</tr>
				 							<tr>
				 								<th>배송:</th>
				 								<td>&#8361;${oDto.dv_option}</td>
				 							</tr>
				 							<tr>
				 								<th>총합:</th>
				 								<td>&#8361;${oDto.dv_option + sum}</td>
				 							</tr>
				 						</table>
										<c:set var="sum" value="0"/>
									</div>
		     					</div>
		   					</div>
	    				</div>
	   				</div>
	   			</c:forEach>	
   			</div>
	  	</div>	
	</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
 <script type="text/javascript">
 $('.panel-collapse').on('show.bs.collapse', function () {
	    $(this).siblings('.panel-heading').addClass('active');
	  });

	  $('.panel-collapse').on('hide.bs.collapse', function () {
	    $(this).siblings('.panel-heading').removeClass('active');
	  });
 </script>
</html>











