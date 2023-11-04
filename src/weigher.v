module weigher(input [3:0] syn, input [10:0] weight, output reg [14:0] V);
	always @(*) begin
        V = syn*weight;
    end
endmodule