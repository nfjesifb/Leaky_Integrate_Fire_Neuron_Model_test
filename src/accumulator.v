module accumulator(input clk, input rst, output reg [7:0] count);
	
    always @ (posedge clk) begin
        if(!rst) begin
            count <= count + 1;
        end
        else begin
            count <= 8'b00000000;
        end
    end
endmodule
