module decay( input [14:0] V, input [14:0] tau, output reg [14:0] V_prime);
    reg [29:0] mult;
    always @(V) begin
        if(V) begin
            mult = (V * tau);
            V_prime = mult >>> 15;
        end
        else begin
            V_prime = V;
        end
    end
endmodule