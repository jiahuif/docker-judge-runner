public class Main {
	private static class IHateJavaException extends RuntimeException {
		public IHateJavaException() {
			super("I hate Java!");
		}
	}
	public static void main(String args[]) {
		throw new IHateJavaException();
	}
}
