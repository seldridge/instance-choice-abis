FIRRTL version 4.0.0

; This example shows that two public modules may instantiate the same module via
; instance choice.
;
; This needs to include all refs under each public module in the emitted enable
; files.
circuit Foo:

  target Target:
    option A

  module Qux:

  module Baz:

  public module Bar:

    instchoice x of Baz, Target:
      A => Qux

  public module Foo:

    instchoice x of Baz, Target:
      A => Qux

    inst bar of Bar
