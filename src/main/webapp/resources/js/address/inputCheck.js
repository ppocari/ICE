/**
 * 
 */
 $(function(){

	$('#email2').change(function(){
		if($(this).val()=='직접 입력') {
			$('#email3').val("");
			$('#email3').css('visibility','visible');
			$('#email3').focus();
		}else{
			$('#email3').css('visibility','hidden');
		}
	});
	
	$('input[type=submit]').click(function(){
		
		var name=$('input[name=name]').val();
		var hp2=$('input[name=hp2]').val();
		var hp3=$('input[name=hp3]').val();
		var em=$('#email3').val();
		
		var check_num = /[0-9]/; // 숫자 
		var check_eng = /[a-zA-Z]/; // 문자 
		var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글
		
		if(name.length==0) {
			alert('이름은 필수입니다!');
			$('input[name=name]').focus();
			return false;
		}
		
		if(hp2.length!=0) {
			if(hp3.length==0) {
				hp_empty();
				$('input[name=hp3]').focus();
				return false;
			}else if(!validate_phone(hp2)) {
				hp_error();
				$('input[name=hp2]').focus();
				return false;
			}
		}
		if(hp3.length!=0) {
			if(hp2.length==0) {
				hp_empty();
				$('input[name=hp2]').focus();
				return false;
			}else if(!validate_phone(hp3)) {
				hp_error();
				$('input[name=hp3]').focus();
				return false;
			}
		}
		
		if(em.length>0) {
			if(em.length==0 || !email_check(em)) {
				email_alert();
				return false;
			}
		}
	});

	function hp_error(){
		alert('전화번호는 숫자만 입력할 수 있습니다.');
	}
	
	function hp_empty(){
		alert('전화번호 양식에 맞지 않습니다.');
	}
	
	function validate_phone(hp) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp); 
	}
	
	function email_alert(){
		alert('이메일 형식이 올바르지 않습니다.');
	}
	
	function email_check(em) {
		var isPoint=em.indexOf(".");
		var isLen=em.length;
		if(isPoint==-1 || isPoint==0){
			return false;
		}else if(isPoint>=1 && isPoint+1!=isLen){
			return true;
		}else{
			return false;
		}
	}
});