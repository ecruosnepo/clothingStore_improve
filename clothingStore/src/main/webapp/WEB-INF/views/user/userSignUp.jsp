<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옷가게</title>
<style>
    a{text-decoration: none; color: black; margin: 5px;}
    input[type=checkbox]{
        float: left;
    }
    h5{
        display: inline;
    }
    input[type=submit]{
        background-color: black;
        color: white;
        width: 350px;
        height: 40px;
    }
    input[type=email], input[type=password]{
        height: 45px;
        width: 350px;
    }
    .input{
        margin-left: 40%;
    }
    textarea{
        height: 100px;
        width: 350px;
    }
    section label, textarea{
        font-size: small;
    }
    .ctext{text-align: center;}
    </style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
    <section>
    <p class="ctext" style="font-size: small;"><a href="index">Home</a>/<a href="">로그인/등록</a></p>
    <br>
    <h3 class="ctext"><p>계정만들기</p></h3>
    <br>
    <div class="input">
        <form action="signUpForm"  method="post" >
            <div class="form-group">
            	<h5>이메일</h5><h5 style="color: red;">*</h5><br>
				<input type="email" id="user_email" name="user_email" class="form-control" placeholder="중복체크 후 로그인이 가능합니다.">
				<input  type="button" id="check" onclick="dcheck()" value= "중복체크"/> 
				<label id="idCheck"></label>
            </div>
             <div class="form-group">
                <h5>비밀번호</h5><h5 style="color: red;">*</h5><br>
                <input type="password" class="form-control" onkeyup="pwCheckFunction();" id="password" name="user_password" >
            </div>
            <div class="form-group">
                <h5>비밀번호 확인</h5><h5 style="color: red;">*</h5><br>
                <input type="password" class="form-control"  onkeyup="pwCheckFunction();" id="password2"  name="user_password2">
                <p id="pwCheckMessage"></p>
            </div>
            <div>
                <label for="check1"></label>
                <input type="checkbox" class="form-check-input" name="check1" id="check1" >
                    저는 현재 나이 14세 이상이며 제 이메일로의 특별할<br> 혜택과  뉴스 발송을 위한 제 개인 정보의 수집, 사용, 저장<br> 및 해외 전송에 동의합니다.
                </label><br>
    <textarea readonly="readonly">  특별한 행사와 소식을 이메일로 보내기 위해 개인정보 수집, 이용 및 보관개인정보에 관해서는 스웨덴 H&M Hennes & Mauritz GBC AB와 한국 H&M Hennes & Mauritz Ltd가 공동으로 책임을 집니다.
    수집하는 개인정보 항목
    • 필수항목: 이메일 주소
    • 선택항목: 이름, 성, 성별, 우편번호, 생년월일, 국가 
    
    수집, 이용 및 보관 목적
    • 당사의 의류, 원단, 인테리어 소품, 신발, 가방, 액세서리, 장난감 및 화장품 관련 제품과 서비스에 관한 맞춤형 정보와 다양한 혜택을 제공합니다.
    
    보유 및 이용 기간 
    • 개인정보는 24개월 동안 보관 및 이용됩니다. 24개월 이후에 새로 동의서를 작성하지 않는 한, 기록을 재생할 수 없는 기술적 방법을 이용해 개인정보를 폐기합니다. 관련법 및 규제에 의거하여 필요한 경우 개인정보가 별도의 데이터베이스로 이동되며, 관련법 및 규제에 따라 필요한 경우가 아니면, 유지 이외의 다른 목적으로 사용되지 않습니다.
    귀하는 상기와 같은 개인정보의 수집 및 이용 등에 대해 동의를 거부할 권리가 있으며, 동의하지 않는 경우 이메일로 보내드린 혜택 및 안내를 받지 못하실 수 있습니다
                </textarea>
                <br><br>
                <label for="check2"></label>
                <input type="checkbox" class="form-check-input" name="check2" id="check2">
                    개인정보 수집, 이용 및 보관에 동의합니다.<h5 style="color: red; ">*</h5>
                </label><br>
                <textarea readonly="readonly" >"개인정보 수집, 이용 및 보관에 동의 수집하는 개인정보 항목     
						    • 성명(국문 및 영문), 이메일 주소, 휴대전화번호, 우편번호(청구서/배송), 사용자 이름과 비밀번호, 생년월일
						    • 신용/직불카드 등의 결제 정보와 및/또는 기타 구매 지불 방법
						    
						    수집, 이용 및 보관 목적
						    • 개인 계정 생성 및 관리 
						    • 구매 상품에 대한 계약 이행 및 시행
						    • 요구 사항 처리
						    
						    보유 및 이용 기간
						    H&M은 귀하가 회원으로 가입되어 있는 동안, 또는 아래 법령들을 포함한 관계 법령에 의해 요구되는 경우 귀하의 개인정보를 보유 및 이용합니다.
						    전자상거래 등에서 소비자 보호에 관한 법률
						    • 계약 또는 청약철회 등에 관한 기록: 5년
						    • 대금결제 및 재화 등의 공급에 관한 기록: 5년
						    • 소비자의 불만 또는 분쟁처리에 관한 기록: 3년
						    
						    통신비밀보호법
						    • 로그인 기록: 3개월
						    관련법 및 규제에 의거하여 필요한 경우 개인정보가 별도의 데이터베이스로 이동되며, 관련법 및 규제에 따라 필요한 경우가 아니면, 유지 이외의 다른 목적으로 사용되지 않습니다.
						    귀하는 상기와 같은 개인정보의 수집 및 이용 등에 대해 동의를 거부할 권리가 있으며, 동의하지 않는 경우 회원가입이 제한될 수 있습니다. "
              </textarea>
                <br><br>
                <p style="font-size: small;">개인정보 처리방법에 대해 자세히 알아보려면 당사의 <br><a href="">개인정보 고지사항</a>을 읽어보시기 바랍니다.</p>
            </div>
            <br> 
          	<p class="w3-center">
				<button type="submit" id="signUp" class="btn btn-primary btn-lg">Join</button>
				<button type="button" onclick="history.go(-1);" class="btn btn-danger btn-lg">Cancel</button>
			</p>
        </form>
    </div>
    <p style="text-align: center;"><a href=""><u>로그인으로 돌아가기</u></a></p>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  </body>
<script type="text/javascript">     
	function pwCheckFunction(){ 
		// 비밀번호 확인
	    var userPW1 = $('#password').val();
	    var userPW2 = $('#password2').val();
	    // 비밀번호 문자 숫자 특수문자 체크
	    var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
	    if(userPW1.length < 8 || !pattern1.test(userPW1) || !pattern2.test(userPW1) ||
	    !pattern3.test(userPW1)) $('#pwCheckMessage').html('비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.')
	    .css('color', 'red').css('font-size', '16px');
	    else if(userPW1 == "" || userPW2 == "") $('#pwCheckMessage').html('');
	    else if(userPW1 != userPW2) $('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다').css('color', 'red').css('font-size', '16px');
	    else $('#pwCheckMessage').html('비밀번호가 서로 일치합니다').css('color','blue');
	 	};
		
	    // 중복체크
		function dcheck(){
			$.ajax({
				url: "/checkEmail",
				type: "POST",
				data:{
					"user_email":$('#user_email').val()
				},
				success: function(result){
			        // 아이디 특수문자 확인
			        var user_email = $('#user_email').val();
					var pattern = /[~!#$%^&*()_+|<>?:{}]/;
					if(result == 0 && $.trim($('#user_email').val()) != ''){
						var html="<label  style='color: blue; font-size: 16px;'>사용가능</label>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}/* if( pattern.test(user_email) ){
						var html="<label  style='color: red; font-size: 16px;'>특수문자 포함은 불가 합니다.</label>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					} */ else{
						var html="<label  style='color: red; font-size: 16px;'>사용불가한 아이디 입니다</label>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				}
				
			});
		};
</script>
</html>