FIRRTL version 4.0.0
circuit Foo:

  target Target:
    option A
    option B

  module Baz:
    output a: Probe<UInt<1>>

    node c = UInt<1>(1)
    define a = probe(c)

  module Bar:
    output a: Probe<UInt<1>>

    node b = UInt<1>(0)
    define a = probe(b)

  public module Foo:
    output a: Probe<UInt<1>>

    instchoice x of Bar, Target:
      A => Baz

    define a = x.a
