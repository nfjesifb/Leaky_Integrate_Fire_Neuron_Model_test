module LIF(input [3:0] syn, 
           input [14:0] tau, 
           input [10:0] weight, 
           input [14:0] threshold, 
           input clk, 
           input rst, 
           output axon, 
           output reg [14:0] V);

    //reg [7:0] voltageReg;

    wire [14:0] syn_scaled;
    wire [14:0] voltage_prime;

    weigher scalar(syn, weight, syn_scaled);
    comparator compare(V, threshold, axon);
    decay decayer(V, tau, voltage_prime);

    always @(posedge clk) begin
        if (rst) begin
            V = 0;
        end 
        else begin
            V = voltage_prime + syn_scaled;
            //voltageReg = voltage_prime;
        end
    end

    //always @(negedge clk) begin
    //    voltageReg <= voltage_prime;
    //end

endmodule
