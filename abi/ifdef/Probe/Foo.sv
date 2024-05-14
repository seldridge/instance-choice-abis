// Defines for the instance choices
`ifndef __target_Target_foo_x
 `define __target_Target_foo_x Bar
`endif

module Foo();

  `__target_Target_foo_x x();

endmodule
