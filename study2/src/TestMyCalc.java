
public class TestMyCalc {
	
	// 숫자 2개 사이의 합을 구해서 결과를 리턴하는 메서드를 만들어라
	public int mySum(int a, int b) {
		int sum = 0;
		for(int i=a; i<=b; i++) {
			sum += i;
		}
		return sum ;
	}
	
	public static void main(String[] args) {	// 메인은 TestMyCalc 클래스랑 상관 없는 메서드
		TestMyCalc calc = new TestMyCalc();
		int r = calc.mySum(3,20);
		System.out.println("결과: "+r);
	}
}
