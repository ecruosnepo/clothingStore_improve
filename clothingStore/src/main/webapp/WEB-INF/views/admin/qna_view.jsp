<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a{
    color: black;
    }
    section{
		 min-height:400px;
	 }
    section h1{
        text-align: center;
    }
    .btn{
        float: right;
        margin: 10px;
    }
    
    #title{
         overflow: hidden;
          text-overflow: ellipsis;
    }
    #fat{
    	margin: 10px;
    }
    #sectionDiv{
    	border: 1px solid gray;
    }
    #write{
    	height: 150px;
    }
    #sectDiv{
		max-width:60%;
		margin:0 auto;
		margin-bottom:50px;
	}
	#disabledSelect{
		margin: 10px;
		width: 200px;
		float: right;
	}
</style>
</head>
<body>
	<section>
		<div id="sectDiv">
		   <h1>문의 내용</h1>
		   <nav id="navbar-example2" class="navbar navbar-light bg-light">
		     <h2 style="max-height:100px">제목 : <c:out value="${dto.title}" /></h2>
		     <p><a href="/admin/adminMemSearch?search=${ dto.user_email }">${ dto.user_email }님</a>&nbsp; 문의</p>
		   </nav>
		   <div id="sectionDiv" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
		     <select id="disabledSelect" class="form-control" disabled>
		         <option>${ dto.boardCat }</option>
		     </select>
		     <h4 id="fat">문의내용</h4>
		     <c:if test="${ dto.file!='' || dto.file==null }">
		     	<h6 style="float: right;" >
		     		첨부파일 :
		     		<a type="button" id="file" data-toggle="modal" data-target="#exampleModal" >${dto.file}</a>
		     	</h6><br>
		     </c:if>
		     <c:if test="${ dto.orderId != '' || dto.orderId == null }">
		     	<h6 style="float: right;"><a href="/admin/adOrderView?order_id=${dto.orderId}">주문번호 : ${dto.orderId}</a></h6>
		     </c:if>
		     <p id="write"><c:out value="${dto.question}" /></p>
		     <h4 id="fat">답변내용</h4>
		     <form action="/admin/adminQnaUpdate?id=${dto.id}" method="post" >
			     <div class="form-group">
	                  <textarea class="form-control" name="answer" id="exampleFormControlTextarea1" rows="10" placeholder="답변 작성"><c:out value="${dto.answer}" /></textarea>
	             </div>
		         <button type="button" class="btn btn-danger" onclick="deleteClick();">삭제</button>
		         <input type="submit" class="btn btn-info">
		   		</form>
		   </div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="modal-body">
		        <img src="/questionFile/${dto.file}" style="max-width: 100%;">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</section>
	<jsp:include page="../footer.jsp" flush="false" />
	
<c:if test="${result==1 }">
	<script>alert('내용을 입력해주세요.'); history.back(); </script>
</c:if>
<c:if test="${result==10 }">
	<script>
	alert('답변이 등록 되었습니다.'); 
	location.href='/admin/adminQna';
	</script>
</c:if>
<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}	
	
	var boardId=getParameterByName('id');
	console.log(boardId);
	/* 삭제버튼 클릭시 */
	function deleteClick(){
		var del=confirm('해당 게시물을 삭제하시겠습니까?');
		if(del){
			location.href="/admin/adminQnaDelete?id="+boardId;
		}
	}
	
	var imgSrc= $("#file").text();
	/* 이미지파일이 아닐 경우 이미지 표시 안 함.  */
	if(imgSrc.match(".jpg")==null && imgSrc.match(".png")==null ){
		document.getElementById('modal-body').innerHTML="<a href=''>${dto.file}</a>";
	}
</script>

</body>
</html>