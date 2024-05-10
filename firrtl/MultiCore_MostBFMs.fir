FIRRTL version 4.0.0

; This example shows an expected use case of bus-functional models (BFMs), i.e.,
; mocks, of some unit.  Likely this is a multi-core design where you want to
; replace all but one of the cores with a BFM in order to improve simulation
; performance and because you would like to only test one core in order to close
; coverage on it.
;
; One option is exposed, UseCoreBFMs, which results in the ability to set three
; of the cores to BFMs or to have all cores use real hardware.
circuit Foo:
  option UseCoreBFMs = True | False

  module Baz_BFM:

  module Baz:

  module Bar:

    inst baz of Baz

  module Bar_BFM:

    instchoice baz match UseCoreBFMs:
      False => Baz
      True => Baz_BFM

  public module Foo:

    inst bar_0 of Bar
    inst bar_1 of Bar_BFM
    inst bar_2 of Bar_BFM
    inst bar_3 of Bar_BFM
