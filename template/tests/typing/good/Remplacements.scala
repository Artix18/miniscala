class B[T1,T2]
{
    def m[T1,Y] () : Unit = {}
}

class A[X] extends B[Array[X],String] {}

object Main
{
    def main(args: Array[String]) { var truc : A[Int] = null }
}
