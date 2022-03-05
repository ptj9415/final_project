package co.maeumi.prj.service;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CoolsmsService {
	
	public static void sendPhoneChk(String userPhoneNumber, int randomNumber) {  //왜 static이 추가됐을까... 
		
		String api_key = "NCSANTLMVVHH9QPC";
		String api_secret = "KYCUMKUJOHURYMSCNQD3NHWQKRGVUOGF";
		Message coolsms = new Message(api_key, api_secret);
		
		// to, from, type, text 부분 입력. 반드시 4개 모두 입력.
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);	// 회원이 입력한 번호. 수신대상. 
		params.put("from", "01084480980");  // 내 연락처. 
		params.put("type", "SMS");
		params.put("text", "[Maeumi] 인증번호는" + "[" + randomNumber + "]" +" 입니다.");  // 문자내용
		
		// 밑이 실제 보내는 부분. 실제 테스트를 할 때는 주석을 지운다. 
		try {
			JSONObject obj = (JSONObject) coolsms.send(params); //자바에서 제공하는 유틸. JSONObeject
			System.out.println(obj.toString());  // 확인
		} catch (CoolsmsException e ) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}
}
