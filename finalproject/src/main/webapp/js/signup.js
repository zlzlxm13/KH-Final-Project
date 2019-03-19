$(document)
		.ready(
				function() {
					var code = null;
					var idck = 0;
					var duchk = 0;
					var formValidation = false;
					var nullchk = true;
					var passchkValidation = false;
					var emailcodechk = false;
					var hp1 = document.getElementById('hp1');

					var hp2 = document.getElementById('hp2');

					var hp3 = document.getElementById('hp3');

					var phonenum = hp1.value + hp2.value + hp3.value;

					$('#sign')
							.click(
									function() {
										if (idck == 1 && formValidation == true
												&& phoneValidation == true
												&& passchkValidation == true
												&& passValidation == true
												&& emailcodechk == true) {
											alert("회원가입이 완료되었습니다.");
											$('#phonenum').val(phonenum);
											$('#joinform').submit();											
										} else if (idck == 1
												&& formValidation == false) {
											alert("입력값이 올바르지 않습니다. 입력값을 확인하세요");
											return false;
										} else if (idck != 1
												&& formValidation == true) {
											alert("아이디 중복검사를 실행해주세요.");
											return false;
										} else if (idck == 1
												&& passchkValidation == false) {
											alert("비밀번호가 일치하지 않습니다.");
											return false;
										} else if (nullchk) {
											alert("입력값을 모두 입력해주세요.");
											return false;
										} else if (idck == 1
												&& phoneValidation == false) {
											alert("올바른 번호를 입력해주세요.");
											return false;
										} else if (idck == 1
												&& emailcodechk == false) {
											alert("올바른 코드 6자리를 인증해주세요.");
											return false;
										}
									});// end btn ================

					$('#chkid').on('click', function() {

						if (duchk == 1) {

							// userid 를 param.
							$.ajax({
								url : "idChk.do",
								type : 'POST',
								data : 'id=' + $("#id").val(),
								dataType : "json",
								success : idChkMethod
							});// ajax

							function idChkMethod(chk) {

								if (chk > 0) {
									alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
									$("#id").focus();
								} else {
									alert("사용가능한 아이디입니다.");
									$("#pass").focus();
									idck = 1;
								}
							}
						} else {
							return false;
						}
					});// end chkid()============================
					// ///////////////////////////////mail

					$('#emailchk').on('click', function() {	
					
						$.ajax({							
							url : "sendMail.do",
							type : 'POST',
							data : 'email=' + $("#email").val(),
							dataType : "text",
							success : emailMethod,
							beforeSend:function(){
								$('#loading').show();
							},
							complete: function(){
								$('#loading').hide();
							}
							
						});// ajax

						function emailMethod(res) {
							code = res;
							alert("인증코드가 발송되었습니다.");							
							$('#codechkdiv').css("display", "inherit");
						}
					});
					
					// 코드 확인

					$('#codebtn').on('click', function() {
					
						alert($('#codeinsert').val());
						if ($('#codeinsert').val() == code) {
							alert("이메일인증이 완료되었습니다.");
							emailcodechk = true;
						} else {
							alert("올바른 코드를 입력해주세요.");
							return false;
						}
					});

					// //////////////
					function nullChk() {
						var namechk = (document.getElementById("name").val());
						var passchk = (document.getElementById("pass").val());
						var idchk = (document.getElementById("id").val());
						var phonechk = (document.getElementById("phonenum")
								.val());
						var emailchk = (document.getElementById("email").val());
						if (namechk == null || idchk == null || passchk == null
								|| phonechk == null || emailchk == null) {
							nullchk = true;
						}
					}// end nullChk()

					$('#name')
							.keyup(
									function() {
										var name = $(this).val();
										var re3 = new RegExp(/^[가-힣a-zA-Z]+$/); // 이름
										// 정규식
										// 한글,영문만
										var result = re3.test(name);
										if (result) {
											$(this).css("color", "green");
											formValidation = true;
											document.getElementById("namep").innerHTML = "";
										} else {
											$(this).css("color", "red");
											document.getElementById("namep").innerHTML = "한글과 영문만 입력 가능합니다.";
											formValidation = false;
										}
									});// end nameKeyUp()

					$('#id')
							.keyup(
									function() {
										var fid = $(this).val();
										var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디가
										// 적합한지
										// 검사할
										// 정규식
										var result = re.test(fid);
										var result2 = fid.search(/[0-9]/ig);
										var result3 = fid.search(/[a-z]/ig);
										if (result == true && result2 >= 0
												&& result3 >= 0) {
											document.getElementById("idp").innerHTML = "";
											$(this).css("color", "green");
											formValidation = true;
											duchk = 1;
										} else {
											$(this).css("color", "red");
											document.getElementById("idp").innerHTML = "영문, 숫자포함 4-12자리로 입력해주세요.";
											formValidation = false;
											duchk = -1;
										}
									});

					$('#pass')
							.keyup(
									function() {
										var pass = $(this).val();
										var re1 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 패스워드
										// 정규식
										var result = re1.test(fpass);
										if (result) {
											document.getElementById("passp").innerHTML = "";
											$(this).css("color", "green");
											passValidation = true;

										} else {
											$(this).css("color", "red");
											document.getElementById("passp").innerHTML = "영문, 숫자, 특수문자 포함 8-15자리로 입력해주세요.";
											passValidation = false;
										}
									});// end fpassKeyUp()

					$('#passchk')
							.keyup(
									function() {
										var ffpass = $('#passchk').val();
										var fpass = $('#pass').val();
										if (ffpass == fpass) {
											document.getElementById("ffpassp").innerHTML = "";
											$(this).css("color", "green");
											passchkValidation = true;

										} else {
											$(this).css("color", "red");
											document.getElementById("ffpassp").innerHTML = "비밀번호가 일치하지 않습니다.";
											passchkValidation = false;

										}
									});// end ffpassKeyUp()

					$('#phone')
							.keyup(
									function() {
										phonenum = $("#hp1").val()
												+ $("#hp2").val()
												+ $("#hp3").val();

										var re4 = /^[0-9]+$/; // 번호만
										var result = re4.test(phonenum);
										if (result == true
												&& phonenum.length == 11) {
											document.getElementById("phonep").innerHTML = "";
											$(this).css("color", "green");
											phoneValidation = true;
										} else {
											$(this).css("color", "red");
											document.getElementById("phonep").innerHTML = "번호를 올바르게 입력해주세요.";
											phoneValidation = false;
										}
									});// end phoneKeyUp()

				});