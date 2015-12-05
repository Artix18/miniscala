
class A[X] { def m(x: X) : X = x }
class B[Y] extends A[Y] { }
class C { var b = new A[Int](); var v = a.m(42) }
object Main { def main(args: Array[String]) { } }
