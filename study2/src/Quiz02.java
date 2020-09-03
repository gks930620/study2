import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Properties;

public class Quiz02 {
	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		//# /WEB-INF/classes/config/test.properties
		
		Properties properties = new Properties();
		String path = Quiz02.class.getResource("config/test.properties").getPath();
		path = URLDecoder.decode(path, "utf-8");
		properties.load(new FileReader(path));
		
		String love = properties.getProperty("love");
		String hate = properties.getProperty("hate");
		
		System.out.println("love : " + love);
		System.out.println("hate : " + hate);
	}
}
