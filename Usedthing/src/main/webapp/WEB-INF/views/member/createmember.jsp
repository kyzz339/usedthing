<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          	회원 가입
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form action="/member/createmember" method="post" id="memberform">
                                        <div class="form-group">
                                            <label>이메일 주소</label>                                            
                                            <input class="form-control" placeholder="E-mail" type="email" id="id" name="id" class="mail">
                                            <input type="button" id="idCheck" class="btn btn-outline btn-primary" value="중복확인">
                                            <input type="button" id="emailCheck" class="btn btn-outline btn-primary" value="이메일인증">
                                            <div class="E-mailchk">
                                            <label>이메일 인증</label> 
											<input class="form-control" type="text" id="E-mailconfirm" name="E-mailconfirm" class="E-mailchk">											
											</div>
											<div class="alert alert-success" id="mailchk-success">인증번호가 일치합니다</div>
                                        	<div class="alert alert-danger" id="mailchk-danger">인증번호가 일치하지않니다</div>                                                                                                                  
                                        </div>
                                        <div class="form-group">
                                            <label>비밀번호</label>
                                            <input class="form-control" placeholder="Password" type="password" id="password1" name="password">                                            
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>비밀번호 확인</label>
                                            <input class="form-control" placeholder="Password" type="password" id="password2" name="password2">                                            
                                        </div>
                                        <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
                                        <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지않니다</div>
                                        <div class="form-group">
                                            <label>닉네임</label>
                                            <input class="form-control" type="text" id="nickname" name="nickname">
                                            <input type="button" class="btn btn-outline btn-primary" id="nicknameCheck" value="중복확인">                                         
                                        </div>
                                        <div class="form-group">
                                            <label>주소</label><br>
                                            <input type="text" id="postcode" name="postcode" placeholder="우편번호">
											<input type="button" class="btn btn-outline btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="address1" name="address1" placeholder="도로명주소">
											<br>
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="address2" name="address2" placeholder="참고항목">
											<input type="text" id="address3" name="address3" placeholder="상세주소">
											
                                        </div>
                                        <button type="submit" class="btn btn-outline btn-primary" id="submitbutton">회원가입</button>
                                        <button type="reset" class="btn btn-outline btn-default" onclick="location.href='/member/login'">이전으로</button>
                                        
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
</script>
<script>
$(document).ready(function(){
	var code="";
	var idCheck="";
	var nicknameCheck="";
	var email = "";
	var pwd1="";
	var pwd2="";
	var mailconfirm = ""
	var	memberform = $("form");
	$(".E-mailchk").hide(); 
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#mailchk-success").hide();
	$("#mailchk-danger").hide();
    $("#idCheck").click(function(){
		$.ajax({
			url : "/member/Idchk",
			type : "post",
			dataType : "json",
			data : {"id" : $("#id").val()},
			success : function(data){
				idCheck = data;
				
				if(data > 0){
					alert("중복된 아이디입니다. ");
				}
				else if(data == 0){
					alert("사용가능한 아이디입니다.");
				}
			}	
		}) 
 	})
    
    $("#nicknameCheck").click(function(){
		$.ajax({
			url : "/member/Nicknamechk",
			type : "post",
			dataType : "json",
			data : {"nickname" : $("#nickname").val()},
			success : function(data){
				nicknameCheck = data;
				if(data > 0){
					alert("중복된 닉네임입니다. ");
				}
				else if(data == 0){
					alert("사용가능한 닉네임입니다.");
				}
			}	
		}) 
	})
    $("#emailCheck").click(function(){
    	 email = $("#id").val();
    	$(".E-mailchk").show();
    	$.ajax({
    		url : "/member/Emailcheck",
    		type : "get",
    		data : {"email" : email},
    		success:function(data){
    			console.log("data : "+data);
    			code = data;
    		}
    		
    	})
    })	
		
		$("input[type=password]").keyup(function(){
			pwd1=$("#password1").val();
			pwd2=$("#password2").val();
			if(pwd1 !="" ||pwd2 !=""){
				if(pwd1==pwd2){
					$("#alert-success").show();
					$("#alert-danger").hide();
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
				}
			}
			
		});
		$("#E-mailconfirm").keyup(function(){
			mailconfirm=$("#E-mailconfirm").val();
			if(code == mailconfirm){
				$("#mailchk-success").show();
				$("#mailchk-danger").hide();
			}
			else{
				console.log("입력 값"+mailconfirm);
				console.log("번호"+code);
				$("#mailchk-danger").show();
				$("#mailchk-success").hide();
			}
			
		})
		
		$("#submitbutton").on("click",function(e){
			e.preventDefault();
			if(pwd1 != pwd2 || pwd1 =="" || pwd2 == ""){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			if(code != mailconfirm || mailconfirm==""){
				alert("인증번호가 일치하지 않습니다.");
				return;
			}
			alert("맨밑"+idCheck );
			if(idCheck >= 1 && idCheck===""){
				alert("아이디 중복을 확인해 주세요");
				return;
			}
			
			if(nicknameCheck > 0 || nicknameCheck===""){
				alert("닉네임 중복을 확인해 주세요");
				return;
			}
			memberform.attr("action","/member/createmember").attr("method","post");
			memberform.submit();
		})
	})
</script>
<%@include file="../includes/footer.jsp" %>