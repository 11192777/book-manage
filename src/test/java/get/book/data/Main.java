package get.book.data;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {
	
	

	public static void main(String[] args) {
		
		
		
		String bookName = "C:/Users/IsQing/Desktop/books.txt";
		String names = readFile(bookName);
		
		String bookCate = "C:/Users/IsQing/Desktop/cate.txt";
		String cates = readFile(bookCate);
	}
	
	
	public static String readFile (String path) {
		StringBuffer sb = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new FileReader(path));
			String line = null;
			while ((line = br.readLine()) != null) {
				line = br.readLine();
				sb.append(line.replaceAll("\"", "") + "\n");
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}
}
