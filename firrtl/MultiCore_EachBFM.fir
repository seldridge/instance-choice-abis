FIRRTL version 4.0.0

; The design point in MultiCore_AllBFMs.fir may not be acceptable for some use
; cases where design verification wants complete control over the ability to
; turn any, arbitrary core into a BFM.  While this is not supported with a
; single option, this can be exposed with multiple options.
;
; This examples shows the ability to have one option control the BFM swapping
; behavior of each core.
circuit Foo:
  option UseBFM_0 = True | False
  option UseBFM_1 = True | False
  option UseBFM_2 = True | False
  option UseBFM_3 = True | False

  module Baz_BFM:

  module Baz:

  module Bar:

    inst baz of Baz

  module Bar_0_BFM:

    instchoice baz match UseBFM_0:
      False => Baz
      True => Baz_BFM

  module Bar_1_BFM:

    instchoice baz match UseBFM_1:
      False => Baz
      True => Baz_BFM

  module Bar_2_BFM:

    instchoice baz match UseBFM_2:
      False => Baz
      True => Baz_BFM

  module Bar_3_BFM:

    instchoice baz match UseBFM_3:
      False => Baz
      True => Baz_BFM

  public module Foo:

    inst bar_0 of Bar_0_BFM
    inst bar_1 of Bar_1_BFM
    inst bar_2 of Bar_2_BFM
    inst bar_3 of Bar_3_BFM
