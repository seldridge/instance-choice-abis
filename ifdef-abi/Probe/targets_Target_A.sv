`ifdef target_Target_foo_x
  `ERROR__target_Target_foo_x__must__not__be__set
`endif

`define target_Target_foo_x Baz
`define targetref_Foo_x_a a
