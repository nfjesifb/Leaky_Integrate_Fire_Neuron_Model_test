module top(input set_vars, input [3:0] syn, input expd, input w, input t, input clk, input rst, output axon, output [14:0] V);
    wire [14:0] tau;
    wire [10:0] weight;
    wire [14:0] threshold;
    
    set_vars sv(set_vars, expd, w, t, clk, rst, tau, weight, threshold);
    LIF lif(syn, tau, weight, threshold, clk, rst, axon, V);
    
endmodule