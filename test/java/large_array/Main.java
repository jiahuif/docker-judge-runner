public class Main {
	private static class Item {
		public String a;
		public String b;
		public Integer c;
	}
	public static void main(String args[]) throws Exception {
		Item[] items = new Item[1024 * 1024 * 4];
		for (int i = 0 ; i < items.length ; ++i) {
			Item item = new Item();
			item.a = "a=" + Math.random();
			item.b = "b=" + Math.random();
			item.c = (int) Math.random() * 1024 * 1024 * 4;
			items[i] = item;
		}
	}
}

