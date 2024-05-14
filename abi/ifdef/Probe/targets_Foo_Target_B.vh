// This file is used to globally enable all instance choices when Target=B.
//
// This file is correctly empty of defines as there are no defines associated
// with this choice.  However, this file still checks that it is not included in
// an incorrect order with other files.

`ifdef __target_Target_foo_x
  `ERROR__target_Target_foo_x__must__not__be__set
`endif

`ifdef __targetref_Foo_x_a a
 `ERROR__targetref_Foo_x_a__must__not__be__set
`endif

// This file has no defines.
