<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d"%>
    <%@page import="com.usedthing.DTO.ProductDTO" %>
    <%@page import="com.usedthing.DTO.MemberDTO" %>
    <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
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
	
	  <div class="panel-heading">
	    
	      <h3>제목 :<c:out value="${product.p_Title}"/></h3>
	   </div>
	   <div class="thumbnail">
	      <img width="500px" height="500px" src="<spring:url value='/resources/images/${product.p_Thumnail}'/>"> <!--https://k-develpoper.tistory.com/8 참고  -->
	      <c:forEach items="${imglist}" var="I_list">
				    
				      <img width="500px" height="500px" src="<spring:url value='/resources/images/${I_list}'/>" alt="Second slide">
				    
				    </c:forEach>
	      <h3>내용 : <c:out value="${product.p_Contents}"/></h3>
	      <div class="caption">
	        
	        <c:if test="${product.p_Onsale eq 'soldout' }">
	        <p>판매완료</p>
	        </c:if>
	        <c:if test="${product.p_Onsale eq 'onsale' }">  
	        <p>가격 :<c:out value="${product.p_Price}"/></p>
	        </c:if>
	        <p>작성자 : <c:out value="${product.p_Writer}"/></p>   	             
	      </div>
	      <c:if test="${member ne null }">
	      <c:if test="${product.p_Writer eq member.nickname }">
	      <button class="btn btn-default"><a href='/product/modify?p_Idx=<c:out value="${product.p_Idx }"/>&pageNum=<c:out value="${cri.pageNum }"/>&amount=<c:out value="${cri.amount }"/>&type=<c:out value="${cri.type}"/>&keyword=<c:out value="${cri.keyword}"/>'>수정</a></button>
		  <button class="btn btn-danger"><a href='/product/delete?p_Idx=<c:out value="${product.p_Idx}"/>'>삭제</a></button>
		  <c:if test="${product.p_Onsale eq 'onsale'}">
		  <button class="btn btn-default"><a href='/product/changeonsale?p_Idx=<c:out value="${product.p_Idx }"/>&pageNum=<c:out value="${cri.pageNum }"/>&amount=<c:out value="${cri.amount }"/>&type=<c:out value="${cri.type}"/>&keyword=<c:out value="${cri.keyword}"/>'>판매완료</a></button>
		  </c:if>
		  <c:if test="${product.p_Onsale ne 'onsale'}">
		  <button class="btn btn-default"><a href='/product/changeosoldout?p_Idx=<c:out value="${product.p_Idx }"/>&pageNum=<c:out value="${cri.pageNum }"/>&amount=<c:out value="${cri.amount }"/>&type=<c:out value="${cri.type}"/>&keyword=<c:out value="${cri.keyword}"/>'>판매재개</a></button>

		  </c:if>
		  </c:if>
		  </c:if>
		  <button class="btn btn-info"><a href='/product/product?pageNum=<c:out value="${cri.pageNum }"/>&amount=<c:out value="${cri.amount }"/>&type=<c:out value="${cri.type}"/>&keyword=<c:out value="${cri.keyword}"/>'>이전</a></button>
		   
		
		       <!--댓글  -->
		  <div class='row'>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i>Reply
						</div>			
						<div class="panel-body">
							<ul class="chat">
								
							</ul>
							<div>													
							<input type="text" id="replyContents">
							<button id="replybutton">등록</button>
							</div>
							<ul class="pagination">
							
							</ul>								
						</div>
					</div>
				</div>
			</div>
	    </div>
	  <!-- </div> -->
	</div>
</div>

</body>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
	console.log("=========");
	console.log("JS TEST reply");
	<% if(session.getAttribute("member")!=null){ %>
	<%MemberDTO dto2 = (MemberDTO)session.getAttribute("member");%>
	var writer= '<%=dto2.getNickname() %>';
	<% }%>
	var p_IdxValue = '<c:out value="${product.p_Idx}"/>';
	var replyUL =$(".chat");
	var replybutton = $("#replybutton");
	var modifyNo="";
	var pageNum=1;
	var P_button=$(".pagination");
	/* var replyremove = $(".replyremovebutton"); */
	showList(1);
	/*댓글 리스트   */
	function showList(page){
		replyService.getList({p_Idx : p_IdxValue, page : page||1},
	function(replyCount,list){
		
		if(page==-1){
			pageNum = Math.ceil(replyCount/10.0);
			showList(pageNum);
			return;
		}
			
		var str="";
		if(list == null || list.length==0){
			replyUL.html("");
			 
			return;
		}
		for(var i=0,len = list.length || 0; i<len;i++){
			str +="<li class='left clearfix' data_p_Idx='"+list[i].p_Idx+"'>"
			str +="<div><div class='header'><strong class='primary-font'>"+list[i].r_Contents+"</strong>";
			str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].r_Regdate)+"</small></div>";
			str +="<p>"+list[i].r_Writer+"</p>";
			
			str += "<c:if test='${member ne null}'>";
			if(list[i].r_Writer == writer){
			str +="<button class='replyremovebutton' id='"+list[i].r_Idx+"'>삭제</button>";
			str +="<button class='replymodifybutton' id='"+list[i].r_Idx+"'>수정</button></div></li>";
			}
			
			str += "</c:if>";
		}
		console.log(str);
		replyUL.html(str);
		
		showReplyPage(replyCount)
		});
	}
	
	 function modifyList(page,modifyNo){
		replyService.getList({p_Idx : p_IdxValue, page : page||1},
		function(replyCount,list){
		
		if(page==-1){
			pageNum = Math.ceil(replyCount/10.0);
			showList(pageNum);
			return;
		}
			
		var str="";
		if(list == null || list.length==0){
			replyUL.html("");
			
			return;
		}
		for(var i=0,len = list.length || 0; i<len;i++){
			str +="<li class='left clearfix' data_p_Idx='"+list[i].p_Idx+"'>"
			if(list[i].r_Idx == modifyNo){
			str +="<div><div class='header'><input type='text' id='replymodifyContents' value='"+list[i].r_Contents+"'></input><button class='modifybutton2'>수정</button>";
			}
			else
			{
			str +="<div><div class='header'><strong class='primary-font'>"+list[i].r_Contents+"</strong>";
			}
			str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].r_Regdate)+"</small></div>";
			str +="<p>"+list[i].r_Writer+"</p></div></li>";				
		}
		console.log(str);
		replyUL.html(str);
		
		showReplyPage(replyCount)
		});
	} 
	/* 댓글등록 */
	replybutton.click(function(){
	var replyinput = $("#replyContents").val();
	replyService.add(
	{"r_Contents" : replyinput ,"r_Writer":writer,"p_Idx":p_IdxValue}
	,
	function(result){
		alert("RESULT :" +result);
		showList(pageNum);
	});
	/*전체 댓글 List  */
	replyService.getList({p_Idx:p_IdxValue,page:1},function(list){
		for(var i=0, len =list.length||0; i<len; i++){
			console.log(list[i]);
		}
	});
	})
	
	 /*댓글 제거  */
	 $(".chat").on("click",".replyremovebutton",function(e){
	var removeNo = $(this).attr('id');
	replyService.remove(removeNo,function(count){
		console.log(count);
		showList(pageNum);
		if(count ==="success"){
			alert("REMOVE");
		}
	},function(err){
		alert('ERROR...');
	});
	
	 })
	/*수정 버튼 클릭  */
	$(".chat").on("click",".replymodifybutton",function(e){
		alert("modifybutton click");
		modifyNo = $(this).attr('id');
		modifyList(pageNum,modifyNo);
	});
	$(".chat").on("click",".modifybutton2",function(e){
		var replymodifyContents=$('#replymodifyContents').val();
		
	/*댓글 수정  */
	replyService.update({
		p_Idx : modifyNo,
		r_Contents : replymodifyContents
	},function(result){
		alert("수정완료.");
		showList(pageNum);
	}); 
	})
	
	/* 댓글 페이징 표시 */
	function showReplyPage(replyCount){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9 ;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCount){
			endNum = Math.ceil(replyCount/10.0);
		}
		
		if(endNum * 10 < replyCount){
			next = true;
		}
		var str="";
		if(prev){
			str = "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>previous</a></li>"	
		}
		
		for(var i = startNum; i<=endNum; i++){
			var active = pageNum == i? "active":"";
			
			str += "<li class='paginate-button "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>"
		}
		
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
		}
		console.log(str);
		P_button.html(str);
	}
	/*현재 페이지 리스트  */
	$(".pagination").on("click","li a",function(e){
		e.preventDefault();
		var targetnum = $(this).attr("href");
		console.log("reply_page click"+"No :"+targetnum);
		
		pageNum = targetnum;
		
		showList(pageNum);	
	});
	})
</script>

<%@include file="../includes/footer.jsp" %>