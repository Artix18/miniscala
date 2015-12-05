
class A[X] { def m(x: X) : X = x }
class B[X] extends A[X] { }
class C { var b = new B[Int](); var v = b.m(42) }
object Main { def main(args: Array[String]) { var c = new C(); print(c.v) } }

/* je viens de penser à un cas qui ferait peut etre échouer le truc de mihai : 
  class A[Y,X] { ... }
  class B[X,Z] extends A[X,Z] { ... }
*/

/* petite aide 
class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }
*/

/* LIRE */
