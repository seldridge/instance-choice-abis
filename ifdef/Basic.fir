FIRRTL version 4.0.0
circuit Foo:

  target Target:
    option A
    option B

  module Baz:
    output a: UInt<1>

    connect a, UInt<1>(1)

  module Bar:
    output a: UInt<1>

    connect b, UInt<1>(0)

  public module Foo:
    output a: UInt<1>

    instchoice x of Bar, Target:
      A => Baz

    connect a, x.a
