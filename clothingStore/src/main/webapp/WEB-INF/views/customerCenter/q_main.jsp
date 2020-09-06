<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	if ( session.getAttribute("email") == null && session.getAttribute("manager") == null ){   
%>
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요.");
	    history.back();
	</script>
<%
	}
%>
<style>
	.customerManage{
		min-height:500px;
		max-width:900px;
	}
     a{
     color: black;
     }
     section p{
     	float: right;
     }
     #title{
          overflow: hidden;
          text-overflow: ellipsis;
     }
	.btn-secondary {
	    color: black;
	    border: none;
	    background: none;
	}
     .btn-toolbar{
     	justify-content: center;
     }
	#titleHd{
	width: 40%;
	}
	#titleN{
		width: 10%
	}
	.center-container {
		min-height:600px;
	}
	.center-content{
		margin:0 auto;
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
	.qna-btn{
		background-color:black;
		font-size:13px;
	}
</style>
</head>
<body>
<div class="container-fluid center-container px-0">
	<div class="row center-row mx-0 w-100">
		<div class="col-md-2 center-side">
			<jsp:include page="sideNav.jsp" flush="false" />
		</div>
		<div class="col-md-10 center-content">
	    	<section class="customerManage">
				<div id="sectDiv">
		    		<h1>문의하기</h1><br><br>
	    			<table class="table table-hover" id="qna">
	        			<thead>
	       				<tr>
				            <th scope="col" id="titleN">번호</th>
				            <th scope="col" >상태</th>
				            <th scope="col" >분류</th>
				            <th scope="col" id="titleHd">제목</th>
				            <th scope="col" >작성일</th>
				        </tr>
	        			</thead>
	        			<c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ page.startIdx }" end="${ page.endIdx }" >
	          			<tr>
			              	<td scope="row"><a href="boardListView?id=${ dto.id }">${idx.index+1}</a></td>
			              	<td>
			                  	<c:if test="${dto.b_check == '0'}">
			                      	미확인
			                  	</c:if>
			                  	<c:if test="${dto.b_check == '1'}">
			                      	완료
			                  	</c:if>
			              	</td>
	              			<td>${dto.boardCat}</td>
	             			<td style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
	              				<a href="boardListView?id=${ dto.id }" id="title"><c:out value="${dto.title}" /></a>
	              			</td>
	              			<td>${dto.regDate}</td>
          				</tr>
	         			</c:forEach>
	  				</table>
	  				<div> <p>${ page.thisPage }/${ page.totalPage } pages</p> </div><br>
	  				<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		      			<div class="btn-group mr-2" role="group" aria-label="First group">
				      		<c:if test="${page.startPageIdx > 1}">
				         		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.thisPage-1}' ">prev</button>
				         	</c:if>
					      	<c:forEach varStatus="num" begin="${page.startPageIdx}" end="${ page.endPageIdx }" >
					         	<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${num.index}' ">${num.index}</button>
					         </c:forEach>
					         <c:if test="${page.totalPage > page.endPageIdx}">
					         	<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.thisPage+1}' ">next</button>
					         </c:if>
					      </div>	
					</div>
	  				<button type="button" class="btn text-white btn-lg qna-btn" onclick="location.href='/customerQnaWriteForm' ">글쓰기</button>
				</div>
			</section>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>