#!/usr/bin/env bash

set -euo pipefail

verilator --lint-only Foo.sv -I.

verilator --lint-only targets_Target_A.sv Foo.sv -I.

verilator --lint-only targets_Target_B.sv Foo.sv -I.

! verilator --lint-only Foo.sv targets_Target_A.sv -I.

! verilator --lint-only Foo.sv targets_Target_B.sv -I.

! verilator --lint-only targets_Target_A.sv targets_Target_A.sv Foo.sv -I.

! verilator --lint-only targets_Target_A.sv targets_Target_B.sv Foo.sv -I.
