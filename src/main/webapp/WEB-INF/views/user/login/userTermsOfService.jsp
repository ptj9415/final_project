<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.test {
            display: flex;
            justify-content: center;
            animation: fadein 1s;
			-webkit-animation: fadein 1s; /* Safari and Chrome */
        }
            @-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

        .mainForm {
            width: 40%;
            margin-top: 50px;

        }

        .comment {
            padding-top: 15px;
            padding-bottom: 15px;
            justify-content: space-between;
            width: 100%;

        }

       

        input {
            float: left;
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

         button {
            background-color: #153e54;
            width: 100px;
            height: 50px;
            border: 1px solid #153e54;

        }

       button:hover {
            background-color: white;
            border: 1px solid #153e54;
            transition:200ms ease-in-out;
        }

        .subCheck {
            border: 1px solid #8dacbd42;
            margin-bottom:5px;
            border-radius: 10px;
    		padding: 10px

        }

        textarea {
            border-color: gray;
            resize: none;
            font-size:12px;
        }

        .info {
            width: 100%;
            height: 100%;
            border-radius: 10px;
    		padding: 10px;
    		border: 0;
        }

        .allCheck>input {
            margin-top: 15px;
        }
        .subInput {
        	margin-top: 7px;
        	margin-left: 5px;
        }
        .btn {
      	  border: 1px solid #153e54;
      	  background-color:#153e54;
      	  color:white;
        }
        .allCheck>input {
        	margin-left: 5px;
        }
         .next-btn{
        	
        	width: 25%;
    		margin-bottom: 50px;
    		margin-top: 30px;
    		margin-right: auto;
    		margin-left: auto;
        }
    </style>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
        	// checkbox ??????
            $("#agree_all").click(function () {
                $("input[name='agree']").prop("checked", this.checked);
            });
            $(".subInput").click(function () {
                if ($("input[name='agree']:checked").length == 4) {
                    $("#agree_all").prop("checked", true);
                } else {
                    $("#agree_all").prop("checked", false);
                };
            });
        });
    </script>
    <script>
    // ???????????? ????????????
    function formCheck(){
    	if($("#agree1").prop("checked") && $("#agree2").prop("checked")){
    		location.href='userEmailCheck.do';
    	} else {
    		alert("??????????????? ????????? ?????????????????? ??????~");
    		return false;
    	}
    	
    	
    }
    </script>
    
    
    
<body>
   <div class="test">
        <div class="mainForm">
            <div class="title" align="center">
                <h4>????????? ?????? ??????</h4>
                <hr>
            </div>
            <div class="comment">
                <div class="allCheck">
                    <input type="checkbox" name="agree_all" id="agree_all" class="checkbox">
                    <label for="agree_all">
                        <h6>Maeumi. ????????? ????????????, ???????????? ?????? ??? ??????,<br>
                            ???????????? 3???(??????), ???????????? ?????? ??????(??????)??? <span style="font-size: larger; color: red;">??????
                                ??????</span>?????????</h6>
                    </label>
                </div>

                <!-- -----------subCheck ??????--------------->
                <div class="subCheck">
                        <input type="checkbox" name="agree" value="1" id="agree1" class="subInput">
                    <label for="agree1"><span>(??????) Maeumi. ????????? ???????????? ??????</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">???1???(??????) ??? ????????? OO ??????(??????????????? ?????????)??? ???????????? OO ????????? ???(?????? ??????????????? ??????)?????? ???????????? ????????? ?????? ?????????(?????? ?????????????????? ??????)??? ???????????? ?????? ????????? ?????? ???????????? ??????????????? ??? ??????????????? ???????????? ???????????? ?????????.

  ??????PC??????, ?????? ?????? ???????????? ?????????????????? ???????????? ??? ????????? ????????? ?????? ??? ??? ????????? ???????????????.???

???2???(??????)

  ??? ??????????????? OO ????????? ?????? ?????? ??????(?????? ????????? ???????????? ???)??? ??????????????? ???????????? ????????? ????????? ??? ????????????????????? ???????????? ?????? ?????? ????????? ??? ????????? ????????? ????????? ???????????? ?????????, ????????? ??????????????? ???????????? ???????????? ???????????? ???????????????.

  ??? ?????????????????? ???????????? ???????????? ??? ????????? ?????? ???????????? ???????????? ???????????? ?????? ?????? ??? ???????????? ????????????.

  ??? ?????????????????? ?????? ???????????? ??????????????? ??? ?????????, ??????????????? ???????????? ???????????? ???????????? ????????? ??? ?????? ?????? ????????????.

  ??? ????????????????????? ?????? ????????? ???????????? ?????? ???????????? ???????????? ???????????? ???????????? ?????? ????????????.

???3??? (?????? ?????? ????????? ?????? ??? ??????) 

  ??? ???????????? ??? ????????? ????????? ?????? ??? ????????? ??????, ????????? ????????? ??????(???????????? ????????? ????????? ??? ?????? ?????? ????????? ??????), ??????????????????????????????????????????????????????, ?????????????????????, ??????????????? ????????????, ????????????????????????????????? ???????????? ?????? ??? ??? ????????? 00 ??????????????? ?????? ???????????????(??????)??? ???????????????. ??????, ????????? ????????? ???????????? ??????????????? ????????? ??? ??? ????????? ??? ??? ????????????.

  ??? ????????? ???????????? ????????? ??????????????? ?????? ????????? ???????????? ?????? ?????? ??? ?????????????????????????????????????????? ?????? ?????? ????????? ????????? ???????????? ????????? ??? ????????? ????????? ???????????? ?????? ???????????? ?????? ???????????? ???????????? ????????? ???????????? ?????????.

  ??? ???????????? ?????????????????? ???????????? ?????????????????? ?????? ?????????, ???????????? ????????? ?????? ?????????, ??????????????? ??? ????????????????????????, ???????????????????????????, ?????????????????????, ?????????????????? ???????????? ??? ???????????? ?????? ?????? ?????????, ??????????????? ?????? ?????? ?????????, ???????????????????????? ??? ?????? ?????? ???????????? ?????? ???????????? ??? ????????? ????????? ??? ????????????.

  ??? ???????????? ????????? ????????? ???????????? ???????????? ??? ??????????????? ???????????? ??????????????? ?????? ?????? ??????????????? ??? ???????????? 7??? ???????????? ???????????? ???????????? ???????????????. ??????, ??????????????? ???????????? ??????????????? ???????????? ???????????? ????????? 30??? ????????? ?????? ??????????????? ?????? ???????????????.  ??? ?????? "????????? ?????? ??? ????????? ?????? ??? ????????? ???????????? ???????????? ???????????? ?????? ????????? ???????????????. 

  ??? ???????????? ????????? ????????? ???????????? ??? ??????????????? ??? ???????????? ????????? ???????????? ???????????? ???????????? ??? ????????? ?????? ????????? ????????? ???????????? ?????? ?????? ??????????????? ????????? ???????????????. ?????? ?????? ????????? ????????? ???????????? ???????????? ????????? ????????? ????????? ????????? ?????? ???3?????? ?????? ??????????????? ???????????? ?????? ???????????? ???????????? ???????????? ????????? ?????? ???????????? ???????????? ????????? ???????????????.

  ??? ??? ???????????? ????????? ????????? ????????? ??? ????????? ????????? ???????????? ??????????????? ???????????? ?????????????????? ?????? ??????, ????????? ?????? ?????? ?????? ??????, ???????????????????????? ????????? ??????????????? ???????????? ????????? ???????????? ??? ???????????? ?????? ???????????? ????????????.</textarea>
                </div>

                <div class="subCheck">
                    <input type="checkbox" name="agree" value="2" id="agree2" class="subInput">
                    <label for="agree2" ><span>(??????) ???????????? ?????? ??? ?????? ??????</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">??????????????? ????????????
<????????????????????????>???(???) ????????? ????????? ????????? ??????????????? ???????????????. ???????????? ?????? ???????????????
????????? ?????? ????????? ???????????? ???????????? ?????????, ?????? ????????? ???????????? ???????????? ??????????????? ????????????
???18?????? ?????? ????????? ????????? ?????? ??? ????????? ????????? ????????? ???????????????.
1. ?????? ?????? ??? ??????
?????? ???????????? ??????, ????????? ????????? ????????? ?????? ?????? ??????????????, ???????????? ??????????????, ????????? ????????????
??????, ??? 14??? ?????? ????????? ???????????? ?????? ??? ?????????????????? ???????????? ??????, ?????? ??????????????, ????????????
???????????? ??????????????? ???????????????. 
2. ?????? ?????? ????????? ??????
????????????, ????????? ??????, ???????????????????? ??????, ????????? ??????, ??????????????? ??????, ????????????, ????????????, ??????
??????????????, ??????????????? ???????????? ??????????????? ???????????????.
0. <?????? ???????????????????????? ???????????? ????????????>
 <???????????? ??????????????? ?????? ????????????>?????? ??????????????? ???????????????. 
 ??????????????? ?????? ??? ????????????
??? <????????????????????????>???(???) ????????? ?????? ???????????? ???????????????????? ?????? ????????????????????? ???????????????
?????? ?????? ?????? ?????? ???????????? ???????????????????? ????????? ??????????????? ???????????????????????.
??? ????????? ???????????? ?????? ??? ?????? ????????? ????????? ????????????.
1. ???????????? ?????? ?????? ??? ?????? : ?????????/?????? ???????????? ?????? ?????????
??????, ????????? ????????? ???????????? ???????????? ?????? ?????? ?????? ?????????
1) ?????? ?????? ????????? ?????? ?????????????? ?????? ?????? ?????? ???????????? ?????? ?????????????? ?????? ?????????
2) ???????????? ????????? ?????? ???????????????????? ?????? ????????? ?????? ???????????????????? ?????? ?????????
3) <?????? ??????> ????????? <????????????> ??????
2. ?????? ?????? ????????? ?????? : ????????????????? ???????????? ??? ???????????????????? ???????????????
??????, ????????? ????????? ???????????? ???????????? ?????? ?????? ?????? ?????????
1) ?????????????????? ???????????? ????????? ????????? ?????? ???????????? ?????? ??????????????, ???????????? ??? ?????? ??? ?????????
?????? ??????
- ????????????????? ?????? ?????? : 6??????
- ?????? ?????? ????????????, ????????????, ?????? ?????? ???????????? : 5???
- ????????? ?????? ?????? ??????????????? ?????? ?????? : 3???
2) ?????????????????????????????? ?????? ???????????????????????? ??????
- ????????? ??????????????????, ????????????????????, ????????? ???????????????, ????????????, ??????????????? ?????????????????? : 1???
- ???????????????, ????????? ??????????????????, ????????? ???????????? : 3??????
3) <???????????? ???????????? ???????????? ??? ??????> : <????????????></textarea>
                </div>
                <div class="subCheck">
                    <input type="checkbox" name="agree" value="3" id="agree3" class="subInput">
                    <label for="agree3"><span> (??????) ???????????? ??????????????? 3????????? ???????????????</span><br>
                        <span style="font-size: small; color:darkgray;">???????????? ???????????? 1????????? ???????????????</span>
                    </label>
                </div>
                <div class="subCheck">
                    <input type="checkbox" name="agree" value="4" id="agree4" class="subInput">
                    <label for="agree4">
                        <span> (??????) ???????????? ?????? ?????? ??????</span><br>
                        <span style="font-size: small; color:darkgray;">???????????? ???????????? ?????? ?????????, ?????? ?????? ?????????
                            ???????????????</span>
                    </label>
                </div>
            </div>
            <div class="next-btn">
                        <button type="button" class="btn" onclick="formCheck()">?????? ??????</button>
			</div>
        </div>
    </div>
    <br><br><br><br><br><br>
</body>
</html>