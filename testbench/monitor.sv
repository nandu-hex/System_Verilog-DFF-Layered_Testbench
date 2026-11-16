// Monitor: Samples and displays the DUT input and output.

module monitor(
    input  logic clk,
    input  logic D,
    input  logic Q,
    output logic mon_D,
    output logic mon_Q
);

    always @(posedge clk) begin
        // Wait for the D Flip-Flop's nonblocking assignment to update.
        #1;
        mon_D = D;
        mon_Q = Q;

        $display("Monitor: D=%b Q=%b", mon_D, mon_Q);
    end

endmodule
