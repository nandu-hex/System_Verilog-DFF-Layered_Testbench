// Design Under Test: Positive-edge-triggered D Flip-Flop

module d_flipflop(
    input  logic D,
    input  logic clk,
    output logic Q
);

    always_ff @(posedge clk) begin
        Q <= D;
    end

endmodule
