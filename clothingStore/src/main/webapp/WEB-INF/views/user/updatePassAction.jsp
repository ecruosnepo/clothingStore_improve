<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${result == '1'}">
  <script>
    alert('귀하의 이메일로 링크를 보냈습니다. 이메일을 확인 해주세요.');
    location.href = 'index';    
  </script>
</c:if>

<c:if test="${result == '2'}">
  <script>
    alert('이메일을 다시 입력 해주세요');
    history.back();   
  </script>
</c:if>

<c:if test="${result == '0'}">
  <script>
    alert('이메일을 다시 입력 해주세요');
    history.back();   
  </script>
</c:if> 
