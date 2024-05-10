module Foo(output a);

`ifndef target_Target_foo_x
 `define target_Target_foo_x Bar
`endif
  `target_Target_foo_x x(.a(a));

endmodule
