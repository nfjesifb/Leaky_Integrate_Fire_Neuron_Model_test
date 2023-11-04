module set_vars(input set_vars,
                input expd, 
                input w,
                input t, 
                input clk, 
                input rst, 
                output reg [14:0] tau, 
                output reg [10:0] weight,
                output reg [14:0] threshold);

    reg [3:0] appender;
    reg [14:0] tauReg;
    reg [10:0] weightReg;
    reg [14:0] thresholdReg;

    always @(negedge set_vars ) begin
        tau <= tauReg;
        weight <= weightReg;
        threshold <= thresholdReg;
    end

    always @(posedge clk) begin
        if (set_vars) begin
            tauReg[appender] <= expd;
            thresholdReg[appender] <= t;
            if (appender < 11) begin
                weightReg[appender] <= w;
            end
        end  
        else begin
            tauReg <= 0;
            weightReg <= 0;
            thresholdReg <= 0;
        end      
    end

    always @(negedge clk) begin
        if (set_vars) begin
            appender <= appender+1;
        end 
        else begin
            appender <= 0;
        end
    end
endmodule
