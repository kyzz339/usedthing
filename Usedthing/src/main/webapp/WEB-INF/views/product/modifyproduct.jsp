<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="../includes/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          	상품등록
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="/product/modify" method="post" enctype="multipart/form-data" >
                                        <div class="form-group">
                                        <input class="form-control" type="hidden" name="p_Idx" value="<c:out value='${detail.p_Idx }'/>">
                                            <label>게시물 제목</label>
                                            <input class="form-control" type="text" name="p_Title" value="<c:out value='${detail.p_Title }'/>">                                            
                                        </div>
                                        <div class="form-group">
                                            <label>게시물 내용</label>
                                            <input type="textarea" class="form-control" name="p_Contents" value="<c:out value='${detail.p_Contents }'/>">                                          
                                        </div>                                        
                                            
                                                                                                                                
                                        
                                        <div class="form-group">
                                            <label>제품코드</label>
                                            <input class="form-control" type="text" name="p_Code" value="<c:out value='${detail.p_Code }'/>">                                            
                                        </div>
                                        
                                        
                                            <label>썸네일 이미지</label>
                                            <input type='file' name='file1' value="<c:out value='${detail.p_Thumnail }'/>">                                            
                                        
                                        
                                        
                                            <label>상세 이미지</label>
                                            <input type='file' name='file2' value="<c:out value='${detail.p_Img }'/>">                                            
                                        
                                        
                                        
                                        <div class="form-group">
                                            <label>판매방식</label>
                                            <select name="p_Sellingway" value="<c:out value='${detail.p_Sellingway }'/>">
                                            	<option value="1">직거래</option>
                                            	<option value="2">택배거래</option>
                                            	<option value="3">상관없음</option>
                                            </select>                                                                                 
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>가격</label>
                                            <input class="form-control" type="text" name="p_Price" value="<c:out value='${detail.p_Price }'/>">                                            
                                        </div>
                                        <input type='hidden' name='pageNum' value="<c:out value='${cri.pageNum }'/>">
                                        <input type='hidden' name='amount' value="<c:out value='${cri.amount}'/>">
                                        <input type='hidden' name='type' value="<c:out value='${cri.type}'/>">
                                        <input type='hidden' name='keyword' value="<c:out value='${cri.keyword}'/>">
                                        
                                        <button type="submit" class="btn btn-default">등록</button>
                                        <button type="reset" class="btn btn-default" onclick="location.href='/product/product'">이전으로</button>
                                    </form>
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