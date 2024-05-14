// This file is used to globally enable all instance choices when Target=A.
//
// This file must be included before other files which rely on any of the defins
// in this file.  If this file sees those defines already defined it will
// generate an error from an undefined macro.  This is the closest thing Verilog
// has to a preprocessor error like the C preprocessor `#error`.

`ifdef __target_Target_foo_x
 `ERROR__target_Target_foo_x__must__not__be__set
`else
 // This define does _NOT_ include the module name.  This is an internal define
 // which needs to
 `define __target_Target_foo_x Baz
`endif

`ifdef __targetref_Foo_x_a a
 `ERROR__targetref_Foo_x_a__must__not__be__set
`else
 `define __targetref_Foo_x_a a
`endif
