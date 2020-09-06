<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:choose>

  <c:when test="${result == '1' }">
	<script>
	   alert('비밀번호는 8자리 이상 입니다.');
	   history.back();
	</script>
  </c:when>
     
    <c:when test="${result == '2' }">
	  <script>
		 alert('새 비밀번호가 일치하지 않습니다.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '3' }">
	  <script>
		 alert('현재 비밀번호가 일치하지 않습니다.');
		 history.back();
	  </script>
    </c:when>
    
  <c:otherwise>
	 <script>
		alert('귀하의 비밀번호 변경이 완료 되었습니다.');
		location.href='/index';
	</script>
   </c:otherwise>

</c:choose>