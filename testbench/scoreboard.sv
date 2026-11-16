// Scoreboard: Compares the monitored input and output values.

module scoreboard(
    input logic clk,
    input logic done,
    input logic D,
    input logic Q
);

    integer errors;

    initial begin
        errors = 0;
    end

    // The monitor updates mon_D and mon_Q one time unit after
    // the rising edge. Check them after that update.
    always @(posedge clk) begin
        #2;

        if (Q !== D) begin
            $display("TEST FAILED: D=%b Q=%b", D, Q);
            errors = errors + 1;
        end
        else begin
            $display("TEST PASSED");
        end
    end

    // Print the final result after the generator finishes.
    always @(posedge done) begin
        #1;

        $display("----------------------");
        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TOTAL ERRORS = %0d", errors);
        $display("----------------------");
    end

endmodule
