<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d"%>
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
                                    <form role="form" action="/product/createproduct" method="post" enctype="multipart/form-data" >
                                        <div class="form-group">
                                            <label>게시물 제목</label>
                                            <input class="form-control" type="text" name="p_Title">                                            
                                        </div>
                                        <div class="form-group">
                                            <label>게시물 내용</label>
                                            <textarea class="form-control" name="p_Contents"></textarea>                                          
                                        </div>                                        
                                            
                                            <input class="form-control" type="hidden" name="p_Writer" value="${sessionScope.member.nickname}">                                                                                    
                                        
                                        <div class="form-group">
                                            <label>제품코드</label>
                                            <input class="form-control" type="text" name="p_Code">                                            
                                        </div>
                                        <!--파일 업로드  -->
                                        <div class="form-group" id="photoupload">                                                                                        
                                                                
                                        </div>
                                        <input type="button" class="btn btn-default" id="addfile" value="사진추가" >
                                        
                                        <div class="form-group">
                                            <label>판매방식</label>
                                            <select name="p_Sellingway">
                                            	<option value="1">직거래</option>
                                            	<option value="2">택배거래</option>
                                            	<option value="3">상관없음</option>
                                            </select>                                                                                 
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>가격</label>
                                            <input class="form-control" type="text" name="p_Price">                                            
                                        </div>
                                        
                                        
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
<script>
$(document).ready(function(){
	var str = "<label>썸네일 이미지</label><input  type='file' name='file1'>";
	var photoupload = $("#photoupload");
	photoupload.html(str);
	$("#addfile").on("click",function(){
		str += "<label>상세 이미지</label><input type='file' name='files'>";
		console.log(str);
		photoupload.html(str);
		
	})
	
})

</script>
<%@include file="../includes/footer.jsp" %>