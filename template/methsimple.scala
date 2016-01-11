class Mdr(z : Int)
{
	var x = 5;
	
	def m() : Int = {
	    return x+z
	}
}

object Main {
  def main(args: Array[String]) {
    var y = new Mdr(4);
    print(y.m())
  }
}

