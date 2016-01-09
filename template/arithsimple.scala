class Lol {
    def bidule()
    {
    }
}

class Mdr extends Lol
{
    def truc():Lol=
    {
        new Lol()
    }
}

object Main {
  def main(args: Array[String]) {
    while(false) print(42);
    new Mdr();
    print(1)
  }
}
