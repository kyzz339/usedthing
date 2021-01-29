<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">     
                             	<form>
		     						<div class="form-group">		                                    
		                                    <input class="form-control" type="hidden" name="idx" value= '<c:out value="${member.idx}"/>'>
		                            </div>
		     						<div class="form-group">
		                                    <label>id</label>
		                                    <input class="form-control" name="id" readonly="readonly" value= '<c:out value="${member.id}"/>'>
		                            </div>
		                            <div class="form-group">
		                                	<label>password</label>
		                                	<input class="form-control" name="password" value= '<c:out value="${member.password}"/>'>
		                            </div>
		                            <div class="form-group">
		                                <label>nickname</label>
		                                <input class="form-control" name="nickname" readonly="readonly" value= '<c:out value="${member.nickname}"/>'>
		                            </div>
		                            <div class="form-group">
		                                <label>postcode</label>
		                                <input class="form-control" id="postcode" name="postcode" value= '<c:out value="${member.postcode}"/>'>                                
		                            </div>
		                            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		                            <div class="form-group">
		                                <label>address1</label>
		                                <input class="form-control" id="address1" name="address1" value= '<c:out value="${member.address1}"/>'>                              
		                            </div>
		                            <div class="form-group">
		                            <span id="guide" style="color:#999;display:none"></span>
		                                <label>address2</label>
		                                <input class="form-control" id="address2" name="address2" value= '<c:out value="${member.address2}"/>'>
		                            </div>
		                            <div class="form-group">
		                                <label>address3</label>
		                                <input class="form-control" id="address3" name="address3" value= '<c:out value="${member.address3}"/>'>
		                            </div>
		                            <div class="form-group">
		                                <label>regdate</label><br>
		                                <fmt:formatDate pattern="yyyy-MM-dd"  value="${member.regdate}"/>
		                            </div>
		                            <div class="form-group">		                               
		                                <input class="form-control" id="report"  name="report" type="hidden"  value= '<c:out value="${member.report}"/>'>
		                            </div>
								    <button class="btn btn-default" data-oper='modify'>회원 정보 수정</button>
		                            <button class="btn btn-danger" data-oper='remove'>탈퇴</button>
		                            <button class="btn btn-info" data-oper='list'>홈</button>
                        		</form> 
                            </div>
                        </div>

</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address2").value = extraRoadAddr;
                } else {
                    document.getElementById("address2").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

$(document).ready(function(){
	var formObj=$("form");
	
	$('.btn').click(function(e){
		
		e.preventDefault(); /*Ex. submit을 눌러도 동작 중지  */
		
		var operation = $(this).data("oper");
	
		if(operation ==='list'){
			self.location="/product/product";
		}else if(operation ==='remove'){
			formObj.attr("action","/member/remove").attr("method","post");
			formObj.submit();
			
		}else if(operation ==="modify"){
			formObj.attr("action","/member/modify").attr("method","post");
			formObj.submit();
		}
		
	})
	
})

</script>




<%@include file="../includes/footer.jsp" %>