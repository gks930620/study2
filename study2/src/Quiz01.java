import com.study.member.vo.MemberVO;

public class Quiz01 {
	
	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		String str = "com.study.member.vo.MemberVO";
		// 위 str 변수에 있는 문자열을 사용해서 인스턴스를 생성
		
//		Class vo1 = Class.forName(str);
//		MemberVO vo;
//		try {
//			vo = (MemberVO)vo1.newInstance();
//			vo.setMemName("말자");
//			vo.setMemMail("malja1004@gmail.com");
//			System.out.printf("객체 정보 : %s %s\n", vo.getMemName(), vo.getMemMail());
//		} catch (InstantiationException | IllegalAccessException e) {
//			System.out.println("클래스가 존재하지 않습니다.");
//		}
		Class<?> testClass = Class.forName(str);
		MemberVO vo = (MemberVO)testClass.newInstance();
		
		vo.setMemName("말자");
		vo.setMemMail("malja1004@gmail.com");
		System.out.printf("객체 정보 : %s %s\n", vo.getMemName(), vo.getMemMail());
	}
}
