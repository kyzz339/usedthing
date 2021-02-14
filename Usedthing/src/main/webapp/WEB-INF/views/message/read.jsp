<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          	<c:out value="${message.message.m_Title}"/>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                                                           보낸이 : <c:out value="${message.message.m_Sender}"/><br>
                                                                           상품 제목 : <a href="/product/productdetail?p_Idx=<c:out value='${message.product.p_Idx}'/>"><c:out value="${message.product.p_Title}"/></a><br>
								   발송 날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${message.message.m_Date}"/> 	                                                                            
                                 <hr>
                                 <div>
                                  <textarea class="form-control" rows="30" cols="90" readonly="readonly"><c:out value="${message.message.m_Contents}"/></textarea>
                                  </div>
                                  <hr>
                                  <button class="btn btn-default" onclick="location.href='/message/createmessage?p_Idx=<c:out value='${message.message.p_Idx}'/>&m_Deceiver=<c:out value='${message.message.m_Sender}'/>'">답장</button>
                                  <button class="btn btn-default" onclick="location.href='/message/deletemessage?m_Idx=${message.message.m_Idx}'">삭제</button>
                                  <button class="btn btn-default" type="button" id="back" onclick="history.back()">이전</button>
								  <c:if test="${sessionScope.member.nickname eq message.message.m_Deceiver }">																  									 
								  	<c:if test="${message.product.p_Onsale eq 'onsale' }">					
								  		<button class="btn btn-default" disabled>판매 중</button>
								  	</c:if>
								  	<c:if test="${message.product.p_Onsale ne 'onsale' }">					
								  		<button class="btn btn-default" disabled>판매 완료</button>
								  	</c:if>								  
								  </c:if>
								                                                                              
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
</body>

<%@include file="../includes/footer.jsp" %>