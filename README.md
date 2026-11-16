# SystemVerilog D Flip-Flop Layered Testbench

## Overview

This project implements a positive-edge-triggered D Flip-Flop and verifies it
using a simple module-based layered testbench written in SystemVerilog.
The project is intended for simulation in AMD/Xilinx Vivado Simulator (XSim).

## Design behaviour

At each rising edge of `clk`, the D Flip-Flop captures the value of `D`:

```systemverilog
always_ff @(posedge clk) begin
    Q <= D;
end
```

There is no reset input in this design. Therefore, `Q` can appear as `X`
(unknown) before the first rising clock edge. This initial unknown value is
expected; after the first active edge, `Q` takes the sampled value of `D`.

## Testbench layers

1. **Generator** (`generator.sv`) – produces five input values.
2. **Driver** (`driver.sv`) – transfers the generated input to the DUT.
3. **DUT** (`d_flipflop.sv`) – stores `D` on the rising edge of the clock.
4. **Monitor** (`monitor.sv`) – samples and displays `D` and `Q`.
5. **Scoreboard** (`scoreboard.sv`) – compares the monitored values and reports
   PASS/FAIL.
6. **Top-level testbench** (`testbench.sv`) – connects the modules and creates
   the clock.

## Folder structure

```text
SystemVerilog-DFF-Layered-Testbench/
├── design/
│   └── d_flipflop.sv
├── testbench/
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   └── testbench.sv
├── simulation/
│   └── README.md
├── README.md
└── .gitignore
```

## How to run in Vivado

1. Create or open a Vivado project.
2. Add `design/d_flipflop.sv` as a design source.
3. Add all five files from the `testbench/` folder as simulation sources.
4. Set `testbench` as the simulation top module.
5. Run **Run Behavioral Simulation**.
6. Check the Tcl Console for `TEST PASSED` messages and `ALL TESTS PASSED`.

The testbench uses simulation delays (`#`) and is intended for simulation,
not hardware synthesis.

## Expected test sequence

The generator applies `D = 0, 1, 0, 1, 0` across five rising clock edges.
The expected sampled output sequence is also `Q = 0, 1, 0, 1, 0`.

## Tools

- SystemVerilog
- AMD/Xilinx Vivado Simulator (XSim)
