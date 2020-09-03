import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.study.free.vo.FreeBoardVO;

public class Quiz03 {
	public static Object convertMapToObject(Map map, Object objClass) {
		String keyAttribute = null;
		String setMethodString = "set";
		String methodString = null;
		Iterator itr = map.keySet().iterator();
		while (itr.hasNext()) {
			keyAttribute = (String) itr.next();
			methodString = setMethodString + keyAttribute.substring(0, 1).toUpperCase() + keyAttribute.substring(1);
			try {
				Method[] methods = objClass.getClass().getDeclaredMethods();
				for (int i = 0; i <= methods.length - 1; i++) {
					if (methodString.equals(methods[i].getName())) {
//						System.out.println("invoke : " + methodString);
						methods[i].invoke(objClass, map.get(keyAttribute));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		return objClass;

	}

	public static void main(String[] args) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boNo", 21);
		paramMap.put("boTitle", "사랑해요 밀키스");
		paramMap.put("boWriter", "말자");
		FreeBoardVO vo = new FreeBoardVO();
		Quiz03.convertMapToObject(paramMap, vo);
		// paramMap에 저장된 정보를 vo 에 담는 처리 또는 함수 생성 후 호출
		System.out.printf("Info : %d %s %s\n", vo.getBoNo(), vo.getBoWriter(), vo.getBoTitle());
	}
}