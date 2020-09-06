<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == '1'}">
	<script>
      alert('귀하의 계정을 삭제 완료 하였습니다');
      location.href = 'index';
	</script>
</c:if>
<c:if test="${result == '0'}">
	<script>
      alert('잠시후에 다시 시도 해주세요');
      history.back();
	</script>
</c:if>
