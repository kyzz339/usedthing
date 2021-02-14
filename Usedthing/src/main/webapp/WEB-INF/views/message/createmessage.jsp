<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">쪽지 보내기</h1>                    
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-6">
			<form action="/message/createmessage" method="post">
				<input type="hidden" name="p_Idx" value="<c:out value='${message.p_Idx}'/>">
				<input type="hidden" name="m_Sender" value="${sessionScope.member.nickname}">
			<div class="form-group">
				<label>수신인</label>
				<input class="form-control" type="text" name="m_Deceiver" readonly="readonly" value="<c:out value='${message.m_Deceiver}'/>">
			</div>
			<div class="form-group">
				<label>제목</label>
				<input class="form-control" type="text" name="m_Title">
			</div>
			<div class="form-group">
				<label>내용</label><br>
				<textarea class="form-control" rows="30" cols="90" name="m_Contents"></textarea>
			</div>			
			<input type="submit" class="btn btn-default" value="전송">
			<input type="button" class="btn btn-default" value="이전" onclick="location.href='/message/messagelist'">
			</form>
			</div>
				</div>
		</div>               
	</div>       
</div>
</body>
<script>
	
</script>
<%@include file="../includes/footer.jsp" %>