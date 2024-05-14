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

test_pass "verilator --lint-only ref_Foo.sv Test.sv -I."
test_pass "verilator --lint-only targets_Foo_Target_A.vh ref_Foo.sv Test.sv -I."
test_pass "verilator --lint-only targets_Foo_Target_B.vh ref_Foo.sv Test.sv -I."

test_fail "verilator --lint-only Test.sv targets_Foo_Target_A.vh -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only Test.sv targets_Foo_Target_B.vh -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only targets_Foo_Target_A.vh targets_Test_Target_A.vh Test.sv -I. $VERILATOR_OPTIONS"
test_fail "verilator --lint-only targets_Foo_Target_A.vh targets_Test_Target_B.vh Test.sv -I. $VERILATOR_OPTIONS"
