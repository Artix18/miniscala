class A() { val x : Int = 42; def g() { x = 41 } }
class B() { var a : A = new A(); def m() { a.x = 41 } }

object Main { def main(args: Array[String]) { } }
