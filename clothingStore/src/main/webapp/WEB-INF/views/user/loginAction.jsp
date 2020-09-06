<%@ page language="java"
 contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:if test="${result == '1'}">
  <script>
    alert('로그인 되었습니다');
    location.href = 'index';    
  </script>
</c:if>
<c:if test="${result == '2'}">
  <script>
    alert('이메일을 다시 입력 해주세요');
    history.go(-1);   
  </script>
</c:if>
<c:if test="${result == '3'}">
  <script>
    alert('비밀번호를 다시 입력 해주세요');
    history.go(-1);   
  </script>
</c:if>
<c:if test="${result == '4'}">
  <script>
    alert('관리자님 환영 합니다.');
    location.href = 'index';
  </script>
</c:if>
<c:if test="${result == '5'}">
  <script>
    alert('이메일과 비밀번호가 일치하지 않습니다.');
    history.go(-1);
  </script>
<<<<<<< HEAD
=======
</c:if>
<c:if test="${result == '6'}">
  <script>
    alert('현재 비밀번호가 일치하지 않습니다.');
    history.go(-1);
  </script>
>>>>>>> e0fb47ee444096edc320c060aa7993662822d748
</c:if>