
$(document).ready(function(){
    //login_process의 id를 가지는것을 클릭하게 된다면 함수 실행
    $("#login_process").click(function(){
    
        var json = {
            //m_id의 이름을 가지고 m_id의 id를 가지는 태그의 벨류값을 가져옴 아래도 동일
           id : $("#id").val(),
           pass : $("#pass").val()
        };
    
        //json을 포이치문 돌림
        for(var str in json){
            //json[m_id or m_pw]를 돌릴때 길이가 0이면 아래 출력
            if(json[str].length == 0){
                //str은 json에 변수명을 가지고 #은 아이디 찾는것 attr은 에트류뷰트의 
                //placeholder를 찾는것
                alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
                 //포커스를 올려줌
                $("#" + str).focus(); 
                return;
            } 
        }   
        //비동기 통신 선언 (아작스)
         $.ajax({
            type : "POST", //post로 요청
            url : "login.do", //login url로 요청
            data :json,
				dataType:'json',
            success : function(data) { //성공 하면
                switch (Number(data)) { //위치문
                case 0: // 0 일때
                    alert("아이디 또는 비밀번호가 일치하지 않습니다."); //경고 출력

                    return;

                case 1: // 1 일떄
                	alert("로그인이 완료되었습니다.");
                    window.location.href = "index.do"; //로그인 성공시 index페이지 이동

                default:
                    break;
                }
            },
            error : function(error) { //404 500등 오류 발생시 
                alert("오류 발생"+ error);
            }
        });
    });
});
