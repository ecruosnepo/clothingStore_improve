<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
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
<script>
/* getParameter 받는 메소드 */
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var boardId=getParameterByName('id');
</script>

<c:if test="${result==1 }">
	<script>alert('제목을 입력해 주세요.'); history.back(); </script>
</c:if>
<c:if test="${result==10 }">
	<script>
		alert('해당 게시물이 수정되었습니다.'); 
		location.href='/boardListView?id='+boardId;
	</script>
</c:if>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
	<style>
      section{
		 min-height:400px;
	     margin-left: 100px;
	 }
      section h1{
          text-align: center;
      }
     .form-group{
          width: 100%;
      }
      
      section button, .btn-primary{
          width: 100px;
      }
      #order{
        width: 100%;
      }
      .form-row{
        width: 100%;
      }
      #sectDiv{
      	margin:0 auto;
		margin: 50px;
		margin-left: 20%;
		max-width:50%;
	}
	.img_wrap {
         width: 300px;
     }
     .img_wrap img {
         max-width: 100%;
         margin: 10px;
     }
     #inputFile{
     	margin-bottom: 10px;
     }
	</style>
</head>

<body>
    <section>
    	<div id="sectDiv">
	        <h1>문의 글 수정</h1><br><br>
	        <h3>1:1문의</h3>
	        <form action="/boardUpdate?id=${ dto.id }" method="post" enctype="multipart/form-data">
	            <div class="form-row">
	                <div class="col-md-8">
	                    <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="제목" value="${dto.title}">
	                </div>
	                <div class="form-group col-md-1">
	                  <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
	                  	<c:forEach var="cat" items="${ list }">
		                  	<c:choose> 
							    <c:when test="${ cat==dto.boardCat }">
	                        		<option value="${ dto.boardCat }" selected>${ dto.boardCat }</option>
							    </c:when> 
							    <c:otherwise> 
							    	<!-- 선택하지 않은 boardcat 리스트 -->
						    		<option value="${ cat }" >${ cat }</option>
							    </c:otherwise>
							</c:choose> 
	                    </c:forEach>
	                  </select>
	                </div>
                   <div class="form-group col-md-12">
                      <button type="button" class="btn btn-primary" id="order" data-toggle="modal" data-target="#exampleModal">
                        주문하신 상품을 선택 해주세요
                      </button>
                      <br>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">주문 내역</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          
                          <div class="modal-body">
	                        <c:forEach items="${ orderList }" var="ods" varStatus="n"> 
                          	  <c:choose> 
							    <c:when test="${ods.order_id == dto.orderId }"> 
	                         		<!-- 선택된 주문번호 -->
		                            <input type='checkbox' name='orderId' value='${ ods.order_id }' onclick="doOpenCheck(this)" checked/>
		                            <h5 style="display: inline;"><label for="order${n.index}" id="orderLabel"> 주문번호 : ${ ods.order_id }</label></h5><br>
							    </c:when> 
							    <c:when test="${ods.order_id != dto.orderId }"> 
							    	<!-- 선택안된 주문번호 출력 -->
		                            <input type='checkbox' name='orderId' value='${ ods.order_id }' onclick="doOpenCheck(this)"/>
		                            <h5 style="display: inline;"><label for="order${n.index}" id="orderLabel"> 주문번호 : ${ ods.order_id }</label></h5><br>
							    </c:when>
							    <c:when test="${ orderCount.get(n.index) > 1 }">
							    	<!-- 하나의 주문에 여러 상품을 구매했을 경우 -->
	                      			상품명 : ${ ods.pd_name } 외 ${ orderCount.get(n.index)-1 } <br>
	                      		</c:when>
	                      		<c:when test="${ orderCount.get(n.index) <= 1 }">
	                      			<!-- 하나의 주문에 한 상품만 구매했을 경우 -->
	                      			상품명 : ${ ods.pd_name } <br>
	                      		</c:when>
							</c:choose> 
							결제일 : ${ ods.payDate }
							<hr>
                          </c:forEach> 
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">선택</button>
                          </div>
                        </div>
                      </div>
                    </div>
	                <div class="form-group">
	                    <textarea class="form-control" name="question" id="exampleFormControlTextarea1" rows="20" placeholder="문의 내용">${dto.question}</textarea>
	                </div>
	            </div>
	            <div>
	                <input name="uploadFile" id="inputFile" type="file" >
	                <input type="hidden" name="oldFile" id="oldFile" value="questionFile/${ dto.file }">
	            </div>
				<div class="img_wrap">
					<p id="fileName" style="display: inline; ">${ dto.file }</p>&nbsp;<a href="javascript:void(0);" id="fileDelete" onclick="fileDelete()">삭제</a>
	            	<img id="img" />
	            </div>
	            <button id="boardUpdate" class="btn btn-primary btn-ms" style="margin-top: 10px;">수정</button>
	            <button type="button" onclick="location.href='/boardListView?id=${dto.id}' " style="margin-top: 10px;" class="btn btn-secondary btn-ms">취소</button>
	        </form>
	    </div>
    </section>
<jsp:include page="../footer.jsp" flush="false" />

<script>
	//selectbar 하나만 체크
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("orderId");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	var fileName=$('#fileName').text();
	var fileDel=false;
	
	function fileDelete(){
		fileDel=true;
		$("#img").hide();
		$("#fileName").hide();
		$("#fileDelete").hide();
	}
	
	/* 수정 버튼 누르면 저장된 파일 삭제하기 */
	$("#boardUpdate").click(function(){
		if(fileName.trim().length>0 && fileDel){
		 	$.ajax({
			    url : "/fileDelete",
			    type : "post",
			    data : { file : fileName },
			    dataType: "text",
			    async : false,
			    success : function(result){
				    console.log("complete");
				    console.log("result:"+result);
			    	if(result > 0) {
			    		document.getElementById("boardUpdate").submit();
			     	} else {
			    		console.log("파일 삭제 실패");
			    	}
			    },
	          error : function(request, status, error) {
	        	  alert("파일 삭제에 실패했습니다.");
	        	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
		   });
		}
	});

	/* 이미지 업로드시 미리보이기 */
	var sel_file;

	$(document).ready(function() {
		//첨부파일을 넣거나 바꿀 경우 미리보기 사진 바꾸기
	    $("#inputFile").on("change", imgFileSelect);

	    /* 이미지파일이 아닐 경우 이미지 표시 안 함.  */
	    console.log($('#img').attr('src')==null);
	    if(!$('#img').attr('src')==null){
	    	var imgSrc= $('#img').attr('src');
	    	if(!(imgSrc.match(".jpg")||imgSrc.match(".png"))){
				$("#img").hide();	
			}
		}
		
		/* 기존에 저장된 파일이 없는 경우 */
		/* 미리보기 사진 & 삭제 기능 없애기 */
		if(fileName.trim().length<1){
			$("#img").hide();
			$("#fileName").hide();
			$("#fileDelete").hide();
		}else{
			$("#img").attr("src", "/questionFile/${dto.file}");
		}
		
	}); 
	
	function imgFileSelect(e) {
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	        	$("#img").hide();
	            return;
	        }
	
	        sel_file = f;
	
	        var reader = new FileReader();
	        reader.onload = function(e) {
	        	$("#img").show();
	            $("#img").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(f);
	    });
	}
</script>

</body>
</html>

