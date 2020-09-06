<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.titleN{
		width: 5%;
	}
</style>
</head>

<body>
   <section class="customerManage">
   		<div id="sectDiv">
          <h1>상품 관리</h1><br><br>
			
          <form action="/admin/adminPdSearch" method="get" class="form-inline">
              <div class="input-group mb-2 mr-sm-2">
                <input type="text" name="search" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Product or Category ">
              </div>
              <input type="submit" class="btn btn-primary mb-2" value="검색">
            </form>

            <table class="table table-hover" id="qna">
                <thead>
                <tr>
                    <th scope="col" class="titleN"></th>
                    <th scope="col" class="titleN">상품번호</th>
                    <th scope="col" style="width: 40%">상품명</th>
                    <th scope="col">색상</th>
                    <th scope="col">사이즈</th>
                    <th scope="col">재고</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ page.startIdx }" end="${ page.endIdx }" >
                    <tr>
                    	<td><input type="checkbox" class="chBox" name="chBox" value="${ dto.pd_id }" data-cartNum="${ dto.pd_size }"></td>
                        <td scope="row"><a href='/admin/updateProductForm?pd_id=${ dto.pd_id }&pd_size=${ dto.pd_size }' id="id">${ dto.pd_id }</a></td>
                        <td scope="row"><a href='/admin/updateProductForm?pd_id=${ dto.pd_id }&pd_size=${ dto.pd_size }'>${ dto.pd_name }</a></td>
                        <td>${ dto.pd_color }</td>
                        <td id="size">${ dto.pd_size }</td>
                        <td>${ dto.pd_stock }</td>
                    </tr>
                </c:forEach>
            </table>
            <button type="button" class="btn btn-danger selectDelete_btn" >삭제</button>
            <div> <p>${ page.thisPage }/${ page.totalPage } pages</p> </div><br>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                		<c:if test="${page.startPageIdx > 1}">
                   			<button type="button" class="btn btn-secondary" onclick="location.href='/admin/adminPdList?page=${page.thisPage-1}' ">prev</button>
                   		</c:if>
                 <c:forEach varStatus="num" begin="${page.startPageIdx}" end="${ page.endPageIdx }" >
		         	<button type="button" class="btn btn-secondary" onclick="location.href='/admin/adminPdList?page=${num.index}' ">${num.index}</button>
		         </c:forEach>
                   <c:if test="${page.totalPage > page.endPageIdx}">
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/admin/adminPdList?page=${page.thisPage+1}' ">next</button>
                   </c:if>
                </div>
            </div>
        </div>
    </section>
    
<script>
 $(".selectDelete_btn").click(function(){
	  var idArray = new Array();
	  var sizeArray = new Array();
	  $("input[class='chBox']:checked").each(function(){
			idArray.push($(this).val())
			sizeArray.push($(this).attr("data-cartNum"));
		});
		console.log(idArray);
		console.log(sizeArray);
		
	  if(idArray.length == 0){
		  alert("삭제할 상품을 선택하세요.")
		}else{
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			if(confirm_val) {
			   $.ajax({
				    url : "/admin/adminPdDelete",
				    type : "post",
				    data : { pd_id : idArray, pd_size : sizeArray },
				    dataType: "text",
				    async : false,
				    success : function(result){
					    console.log("complete");
					    console.log("result:"+result);
				    	if(result > 0) {          
				    	   alert(result+"개의 상품을 삭제했습니다.");
				    	   document.location.href="/admin/adminPdList" ; 
				    	} else {
				    	   alert("삭제 실패했습니다.");
				    	} 
				    },
			        error : function(request, status, error) {
			          alert("삭제 실패했습니다.");
			          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
				});
			}
		 }
	 });
</script>

</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />