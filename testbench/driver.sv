// Driver: Transfers the generated input to the DUT.

module driver(
    input  logic D_in,
    output logic D
);

    always_comb begin
        D = D_in;
    end

endmodule
