<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    a{
    	color: black;
    }
	.row{
		width: 980px;
		margin: 0 auto;
	}
	.sidenav_wrqp{
		position: relative;
		height:100%;
		display:inline-block;
		font-weight:600 !important;
	}
	.sidenav {
		width: 300px;
		position: absolute;
		left: 0;
		overflow-x: hidden;
		padding-top: 20px;
	}
	.sidenav p {
		padding-left: 50px;
		text-decoration: none;
		font-size: 14px;
		color: #222;
	}
    .sidenav a:hover {
    	color: #d6001c;
    }
</style>
<% 
	if ( session.getAttribute("manager") == null ){
%>
	<script type="text/javascript">
		alert("관리자만 이용 가능한 페이지 입니다.");
	    history.back();
	</script>
<%
	}
%>
<div class="container sidenav_wrap">           
    <div class="center-block" style="width: 100%;">
		<div class="row">
			<aside class="sidenav">
				<p>관리자 페이지</p>
				<p><a href="/admin/adminMember">고객관리</a></p>
				<p><a href="/admin/adminQna">고객 문의 관리</a></p>
				<p><a href="/admin/adminPdList">상품 관리</a></p>
				<p><a href="/admin/adminProduct">상품 등록</a></p>
			 	<p><a href="/admin/adminOrderList">주문현황</a></p>
		 	</aside>
 		</div>
 	</div>
 </div>