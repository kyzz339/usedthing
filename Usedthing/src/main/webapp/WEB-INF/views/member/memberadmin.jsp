<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.usedthing.DTO.ProductDTO" %>
<div class="row">
                <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 관리</h1>                    
                </div>
                <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nickname</th>
                                        <th>regdate</th>
                                        <th>user info</th>
                                        <th>삭제/관리자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allmember}" var="allmember">                                	
                                    <tr class="odd">                                
                                        <td>${allmember.id}</td>
                                        <td>${allmember.nickname}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${allmember.regdate}"/></td>
                                        <td class="center">${allmember.report}</td>
                                        <td class="center"><button class="delete" id="${allmember.idx}">회원삭제</button>
                                        <c:if test="${sessionScope.member.report eq 'masteradmin'}">
                                        <c:if test="${allmember.report eq 'user'}">
                                        <button class="admin" id="${allmember.idx}">관리자 설정</button></td>
                                        </c:if> 
                                        <c:if test="${allmember.report eq 'admin'}">
                                        <button class="user" id="${allmember.idx}">관리자 해제</button></td>
                                        </c:if>
                                        
                                        </c:if>                                       
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>                            
                        </div>               
            </div>       
</div>
<form id="adminForm" action="/member/remove_admin" method='get'>
	
</form>
</body>
<script>
$(document).ready(function() {
	var adminForm = $("#adminForm");
	
	$(".delete").on("click",function(){
		alert("회원삭제");
		adminForm.append("<input type='hidden' name='idx' value='"+$(this).attr("id")+"'>");
		adminForm.submit();
	})
	
	$(".admin").on("click",function(){
		
		alert("관리자 선정");
		adminForm.append("<input type='hidden' name='idx' value='"+$(this).attr("id")+"'>");
		adminForm.attr("action","/member/update_admin");
		adminForm.submit();
		
	})
	
	$(".user").on("click",function(){
		alert("관리자 해제");
		adminForm.append("<input type='hidden' name='idx' value='"+$(this).attr("id")+"'>");
		adminForm.attr("action","/member/update_user");
		adminForm.submit();
	})
});
</script>
<%@include file="../includes/footer.jsp" %>
