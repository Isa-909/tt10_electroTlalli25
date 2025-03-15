module tt_um_counter (
    input  wire [7:0] ui_in,       // Dedicated inputs
    output wire [7:0] uo_out,      // Dedicated outputs
    input  wire [7:0] uio_in,      // IOs: Input path
    output wire [7:0] uio_out,     // IOs: Output path
    output wire [7:0] uio_oe,      // IOs: Enable path (active high: 0=input, 1=output)
    input  wire        ena,        // always 1 when the design is powered, so you can ignore it
    input  wire        clk,        // clock
    input  wire        rst_n       // reset_n - low to reset
);

    // Internal signals
    wire select;
    reg [3:0] count;

    // Assign inputs to internal signals
    assign clk = ui_in[0];
    assign rst_n = ui_in[1];
    assign select = ui_in[2];

    // 4-bit synchronous up/down counter
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            count <= 4'b0000;
        end else begin
            if (select) begin
                count <= count + 1'b1;
            end else begin
                count <= count - 1'b1;
            end
        end
    end

    // Assign outputs
    assign uo_out[3:0] = count;
    assign uo_out[7:4] = 4'b0000; // Unused outputs to 0
    assign uio_out = 8'b00000000; // Unused IOs to 0
    assign uio_oe = 8'b00000000; // Unused IOs to input mode

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, ui_in[7:3], uio_in, 1'b0};

endmodule
