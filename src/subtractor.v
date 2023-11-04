module subtractor( input [14:0] V, output reg [14:0] V_prime);
    always @* begin
        if(V != 8'b00000000) begin
            V_prime <= V - 1;
        end
        else begin
            V_prime <= V;
        end
    end
endmodule
