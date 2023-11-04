`timescale 1ns / 1ps

module top_test;

    // Inputs
    reg set_vars;
    reg [3:0] syn;
    reg expd;
    reg w;
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire axon;
    wire [14:0] V;

    // Instantiate the Unit Under Test (UUT)
    top uut (
        .set_vars(set_vars), 
        .syn(syn), 
        .expd(expd), 
        .w(w), 
        .t(t), 
        .clk(clk), 
        .rst(rst), 
        .axon(axon), 
        .V(V)
    );

    initial begin
        // Specify the dump file
        $dumpfile("top.vcd");

        // Dump all variables in the test 
        $dumpvars(0, top_test);
        // Initialize Inputs
        set_vars = 0;
        syn = 0;
        expd = 0;
        w = 0;
        t = 0;
        clk = 0;
        rst = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Test functionality
        rst = 1; #20; // Reset the module
        rst = 0; #10; // Release reset
        //set_vars = 1; #20
        set_vars = 1; expd = 0; w = 1; t = 1; #20; // Set all inputs to 1 for 8 clock cycles
        set_vars = 1; expd = 0; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 1; #20;
        set_vars = 1; expd = 1; w = 0; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 0; w = 1; t = 1; #20; // Set all inputs to 1 for 8 clock cycles
        set_vars = 1; expd = 0; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 1; #20;
        set_vars = 1; expd = 1; w = 0; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; w = 1; t = 0; #20;
        set_vars = 1; expd = 1; t = 0; #20;
        set_vars = 1; expd = 1; t = 0; #20;
        set_vars = 1; expd = 1; t = 0; #20;
        set_vars = 1; expd = 1; t = 0; #20;
        set_vars = 0; syn = 4'b1111; #30 // Change inputs to some other values
        rst = 1; #20; // Reset the module
        rst = 0; #20
        syn = 0;
        #10000 $finish; // Stop the simulation after 200 time units
    end
      
    always #10 clk = ~clk;   // Toggle clock every 10 time units

endmodule
