module Foo(output a);

`ifndef target_Foo_Target_foo_x
 `define target_Foo_Target_foo_x Bar
`endif
  `target_Foo_Target_foo_x x(.a(a));

endmodule
