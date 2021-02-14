<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>
	<div class="row">
                <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">쪽지함</h1>                    
                </div>
                <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>from</th>
                                        <th>상품</th>
                                        <th>제목</th>
                                        <th>날짜</th>                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${message}" var="message">                                	
                                    <tr class="odd">                                
                                        <td>
                                        <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">${message.m_Sender}
			                                   <span class="caret"></span>
			                                </button>
			                                <ul class="dropdown-menu pull-right" role="menu">
			                                   <li><a href="/message/createmessage?p_Idx=<c:out value='${message.p_Idx}'/>&m_Deceiver=<c:out value='${message.m_Sender}'/>&m_Sender=<c:out value='${message.m_Deceiver}'/>">메세지 보내기</a></li>
			                                </ul>
			                            </div>
                                        </td>                                        
                                        <td><button class="btn btn-default" onclick="location.href='/product/productdetail?p_Idx=${message.p_Idx}'">상품으로</button></td>
                                        <td class="center"><a href="/message/messageread?m_Idx=<c:out value='${message.m_Idx}'/>">${message.m_Title}</a></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${message.m_Date}"/></td>                                                                           
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>                            
                        </div>               
            </div>       
</div>
</body>
<%@include file="../includes/footer.jsp" %>