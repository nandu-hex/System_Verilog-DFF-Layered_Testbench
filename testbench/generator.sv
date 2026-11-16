// Generator: Produces input values for the D Flip-Flop.

module generator(
    input  logic clk,
    output logic D,
    output logic done
);

    initial begin
        done = 1'b0;

        // Test case 1
        D = 1'b0;

        // Test case 2
        @(negedge clk);
        D = 1'b1;

        // Test case 3
        @(negedge clk);
        D = 1'b0;

        // Test case 4
        @(negedge clk);
        D = 1'b1;

        // Test case 5
        @(negedge clk);
        D = 1'b0;

        // Allow the final rising-edge check to complete.
        @(posedge clk);
        #3;
        done = 1'b1;
    end

endmodule
