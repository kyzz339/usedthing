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
                                        
                                        
                                            <label>썸네일 이미지</label><br>
                                            <div class="form-group" id="thumnailupload">
                                                                                        
                                        	
                                        	</div>
                                            <label>상세 이미지</label>
                                             <div class="form-group" id="photoupload">
	                                                                                        	                                            	                                          													                                        		                                        	
                                        	</div>
                                        	<input type='button' id='addImg' value='사진추가'>
                                        
                                        <div>
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
                                        <input type='hidden' name='p_Onsale' value="<c:out value='${detail.p_Onsale }'/>">
                                        <input type='hidden' name='pageNum' value="<c:out value='${cri.pageNum }'/>">
                                        <input type='hidden' name='amount' value="<c:out value='${cri.amount}'/>">
                                        <input type='hidden' name='type' value="<c:out value='${cri.type}'/>">
                                        <input type='hidden' name='keyword' value="<c:out value='${cri.keyword}'/>">
                                        
                                        <button type="submit" class="btn btn-default">수정</button>
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
var photoupload = $("#photoupload");
var thumnailupload = $("#thumnailupload")
$(document).ready(function(){
	
	var str = "<c:forEach items='${imglist}' var='I_list'>";
		str += "<input readonly='readonly' class='form-group' type='text' name='originfiles' id=\"<c:out value='${I_list}'/>\" value=\"<c:out value='${I_list}'/>\">";
		str += "<input type='button' id='${I_list}' class='deleteImg' value='삭제'></c:forEach><br>";
	console.log("str : "+str);
	photoupload.html(str);
	
	var thumnailstr = "<input class='form-group' type='text' name='p_Thumnail' value=\"<c:out value='${detail.p_Thumnail}'/>\"><input type='button' id='${detail.p_Thumnail}' class='addthumnail' value='썸네일수정'><br>"
		thumnailupload.html(thumnailstr);
	$("#addImg").on("click",function(){
		str += "<label>상세 이미지</label><input type='file' name='files'>";	
		
		photoupload.html(str);
	})
	
	
	$('#photoupload').on("click",'.deleteImg',function(){
		var id = $(this).attr('id');
		$("input[id='"+id+"']").remove();
})
	$("#thumnailupload").on("click",".addthumnail",function(){
		thumnailstr = "<input type='file' name='file1'>";
		thumnailupload.html(thumnailstr);
	})
	
})


</script>
<%@include file="../includes/footer.jsp" %>