// Defines for the instance choices
`ifndef target_Target_foo_x
 `define target_Target_foo_x Bar
 `define targetref_Foo_x_a b
`endif

// Defines for the refs
`define ref_Foo_x x.`targetref_Foo_x_a

module Foo();

  `target_Target_foo_x x();

endmodule

module Test();

  Foo foo();
  wire a = foo.`ref_Foo_x;

endmodule
