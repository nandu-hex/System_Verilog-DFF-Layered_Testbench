// Top-level testbench: Connects generator, driver, DUT,
// monitor and scoreboard, and generates the clock.

module testbench;

    logic clk;

    logic gen_D;
    logic D;
    logic Q;
    logic done;

    logic mon_D;
    logic mon_Q;

    // Clock generation: 10 time-unit period.
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Generator
    generator G1(
        .clk  (clk),
        .D    (gen_D),
        .done (done)
    );

    // Driver
    driver DR1(
        .D_in (gen_D),
        .D    (D)
    );

    // Design Under Test
    d_flipflop DFF1(
        .D   (D),
        .clk (clk),
        .Q   (Q)
    );

    // Monitor
    monitor M1(
        .clk   (clk),
        .D     (D),
        .Q     (Q),
        .mon_D (mon_D),
        .mon_Q (mon_Q)
    );

    // Scoreboard
    scoreboard S1(
        .clk  (clk),
        .done (done),
        .D    (mon_D),
        .Q    (mon_Q)
    );

    // End simulation after the generator and final check complete.
    initial begin
        wait (done == 1'b1);
        #2;
        $display("SIMULATION COMPLETED");
        $finish;
    end

endmodule
