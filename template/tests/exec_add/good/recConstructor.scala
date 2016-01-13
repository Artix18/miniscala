class A(y1 : Int, y2 : Int, y3 : Int) {
	def prt() : Unit = {
		print(y1) ; print (" ") ;
		print(y2) ; print (" ") ;
		print(y3) ; print("\n")
	}
}

class B(x1 : Int, x2 : Int, x3 : Int)
	extends A(x1+x2, x2+x3, x3+x1) {
	def prtB() : Unit = {
		print(x1) ; print (" ") ;
		print(x2) ; print (" ") ;
		print(x3) ; print ("\n") ;
		prt()
	}
}

object Main {
	def main(args: Array[String]) {
		val b = new B(1,2,3);
		b.prtB()
	}
}
