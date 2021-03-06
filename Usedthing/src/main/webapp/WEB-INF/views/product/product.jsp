<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
                <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">상품</h1>
                    <button id='regBtn' type="button" class="btn btn-primary pull-right">RegisterNew Board</button>
                </div>       
                <!-- /.col-lg-12 -->
            </div>
           <div class="row" style="width:1500px;">
           <!--상품 div  -->
          
 <c:forEach items="${product}" var="product">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      
	      <a class='move' href="<c:out value='${product.p_Idx}'/>"><img style='width:500px; height:200px; ' src="<spring:url value='/resources/images/${product.p_Thumnail}'/>"></a> <!--https://k-develpoper.tistory.com/8 참고  -->
	      <div class="caption">	      
	        <h3><strong>${product.p_Title} </strong></h3>
	   
	        <c:if test="${product.p_Onsale eq 'soldout' }">
	        <p>판매완료</p>
	        </c:if>
	        <c:if test="${product.p_Onsale eq 'onsale' }"> 
	        <p>${product.p_Price} 원</p>
	        </c:if>
	        <p>${product.p_Writer }</p>     
	      </div>
	    </div>
	  </div>
	  
  </c:forEach>
  </div>
  <div class="row">
	  <div class='pull-left'>
		  	<ul class="pagination">
			  <!--좀 어려움 다시한번 보기  -->
			  <c:if test="${pageMaker.prev }">
			  	<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
			  </c:if>
			  
			  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.realEnd }">
			  	<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":""} '><a href="${num}">${num }</a></li>
			  </c:forEach>
			  
			  <c:if test="${pageMaker.next }">
			  	<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
			  </c:if>
		  </ul>
	  </div>
  </div>

<form id="actionForm" action="/product/product" method='get'>
  	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
  	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
  	<input type='hidden' name='type' value='${pageMaker.cri.type}'>
  	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
</form>
</div>


</body>
    <script type="text/javascript">
    $(document).ready(function() {

        $("#regBtn").click(function(){        
		if("${sessionScope.member}" != null && "${sessionScope.member}" != ""){
			/*로그인 햇을때  */
        self.location ="/product/createproduct";
		} else{
			/*로그인  안 했을때  */
			alert("로그인 해주세요");
			self.location ="/member/login";			
		}
        	
        
    });
        
        var actionForm =$("#actionForm");
       
       $('.paginate_button a').on("click",function(e){
    	   
    	   e.preventDefault();
    	   
    	   console.log('click');
    	   
    	   actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	   actionForm.submit();
       }); 
        
      $(".move").on("click",function(e){
    	  
    	  e.preventDefault();
    	  actionForm.append("<input type='hidden' name='p_Idx' value='"+$(this).attr("href")+"'>");
    	  actionForm.attr("action","/product/productdetail");
    	  actionForm.submit();
    	  
      }); 
      


    });
    </script>
<%@include file="../includes/footer.jsp" %>
