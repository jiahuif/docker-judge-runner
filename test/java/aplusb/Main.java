import java.io.*;

public class Main {
    public static void main(String args[]) throws Exception {
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(System.in, "utf-8"))) {
            int sum = 0;
            String line = reader.readLine();
            String[] parts = line.split("\\s+");
            for (String part : parts) {
                sum += Integer.parseInt(part);
            }
            System.out.println(sum);
        }           
    }
}
