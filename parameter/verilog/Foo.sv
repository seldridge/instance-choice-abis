module Foo#(parameter target = "default")(output a);

  case(target)
    "A":
      Baz x(.a(a));
    default:
      Bar x(.a(a));
  endcase

endmodule
