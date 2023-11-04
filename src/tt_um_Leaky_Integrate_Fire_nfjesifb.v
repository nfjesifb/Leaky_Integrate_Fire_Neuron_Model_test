module tt_um_Leaky_Integrate_Fire_nfjesifb #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire rst = ! rst_n;
    wire [14:0] out;

    assign out[7:0] = uo_out;
    assign out[14:8] = uio_out[7:1];

    assign uio_oe[7:0] = 0;

    top t(ui_in[0], ui_in[4:1], ui_in[5], ui_in[6], ui_in[7], clk, rst, uio_out[0], out);

endmodule