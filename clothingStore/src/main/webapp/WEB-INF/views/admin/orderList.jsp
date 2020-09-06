<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  .customerManage{
		min-height:500px;
	}
     a{
     color: black;
     }
	section{
		 min-height:400px;
	     margin-left: 200px;
	 }
     section h1{
         text-align: center;
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
     #sectDiv{
		margin: 50px;
		margin-left: 10%;
		max-width:70%;
	}
	#boardCat{
		margin: 5px;
	}
	#titleHd{
	width: 40%;
	}
</style>
</head>
<body>
<jsp:include page="sideNav.jsp" flush="false" />
      <section>
      	<div id="sectDiv">
          <h1>주문 관리</h1><br><br>


            <table class="table table-hover" >
                <thead>
                <tr>
                    <th scope="col" >주문번호</th>
                    <th scope="col">이메일</th>
                    <th scope="col" >금액</th>
                    <th scope="col" >상태</th>
                    <th scope="col">주문날짜</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ page.startIdx }" end="${ page.endIdx }" >
                    <tr>
                        <td scope="row"><a href="adOrderView?order_id=${ dto.order_id }">${ dto.order_id }</a></td>
                        <td>${ dto.user_email }</td>
                        <td>${dto.total_price}</td>
                        <td>${dto.order_state}</td>
                        <td>${dto.payDate}</td>
                    </tr>
               </c:forEach>
            </table>
            <div> <p>${ page.thisPage }/${ page.totalPage } pages</p> </div><br>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                		<c:if test="${page.startPageIdx > 1}">
                   			<button type="button" class="btn btn-secondary" onclick="location.href='/adminOrderList?page=${page.thisPage-1}' ">prev</button>
                   		</c:if>
                 <c:forEach varStatus="num" begin="${page.startPageIdx}" end="${ page.endPageIdx }" >
		         	<button type="button" class="btn btn-secondary" onclick="location.href='/adminOrderList?page=${num.index}' ">${num.index}</button>
		         </c:forEach>
                   <c:if test="${page.totalPage > page.endPageIdx}">
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/adminOrderList?page=${page.thisPage+1}' ">next</button>
                   </c:if>
                </div>
            </div>
        </div>
     </section>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>