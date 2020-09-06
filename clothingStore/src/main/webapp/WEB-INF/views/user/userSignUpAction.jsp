<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>

  <c:when test="${result == '0' }">
	<script>
	   alert('사용하실 이메일과 비밀번호를 입력 해주세요.');
	   history.back();
	</script>
  </c:when>
     
    <c:when test="${result == '2' }">
	  <script>
		 alert('사용하실 이메일을 입력 해주세요.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '3' }">
	  <script>
		 alert('사용하실 비밀번호를 입력 해주세요.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '4' }">
	  <script>
		 alert('개인정보 동의 체크를 해주세요.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '5' }">
	  <script>
		 alert('중복체크를 해주세요.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '6' }">
	  <script>
		 alert('비밀번호가 일치하지 않습니다.');
		 history.back();
	  </script>
    </c:when>
    
    <c:when test="${result == '7' }">
	  <script>
		 alert('비밀번호는 8자리 이상으로 설정 해주세요.');
		 history.back();
	  </script>
    </c:when>
    
  <c:otherwise>
	 <script>
		alert('회원가입이 완료 되었습니다.');
		location.href='login';
	</script>
   </c:otherwise>

</c:choose>