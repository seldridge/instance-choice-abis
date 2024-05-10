#!/usr/bin/env bash

set -euo pipefail

function test_pass() {
  echo "Test: '$1'"

  if $1; then
    echo "  pass"
  else
    echo "  fail"
    exit 1
  fi
}

function test_fail() {
  echo "Test: '$1'"

  if ! $1 2>/dev/null; then
    echo "  pass"
  else
    echo "  fail"
    exit 1
  fi
}

VERILATOR_OPTIONS="-Wall"

test_pass "verilator --lint-only Foo.sv -I."
test_pass "verilator --lint-only targets_Foo_Target_A.sv Foo.sv -I."
test_pass "verilator --lint-only targets_Foo_Target_B.sv Foo.sv -I."

test_fail "verilator --lint-only Foo.sv targets_Foo_Target_A.sv -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only Foo.sv targets_Foo_Target_B.sv -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only targets_Foo_Target_A.sv targets_Foo_Target_A.sv Foo.sv -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only targets_Foo_Target_A.sv targets_Foo_Target_B.sv Foo.sv -I. $VERILATOR_OPTIONS"
