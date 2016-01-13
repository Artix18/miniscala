class C(a : Int) {
	var v = a;
	var z = 42;
	
	def print_v() {
		print(v);
		print("\n")
	}
}

class D(x : Int, y : Int) extends C(x+y) {
	var vx = x;
	var vy = y;
	
	def print_vx() {
		print(vx);
		print("\n")
	};
	
	def print_vy() {
		print(vy);
		print("\n")
	}
}

object Main {
	def main (args: Array[String]) {
		var t = new D(2, 40);
		t.print_v();
		t.print_vx();
		t.print_vy()
	}
}
