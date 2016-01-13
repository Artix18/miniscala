class A
{
    def B_test1()
    {
        print("Mince !\n")
    }
}

class A_B
{
    def test1() {
        print("Bravo !\n")
    }
}

object Main {
	def main(args: Array[String]) {
		var x = new A_B();
		x.test1()
	}
}
