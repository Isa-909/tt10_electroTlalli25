module testbench;
    reg clk;
    reg rst_n;
    reg [7:0] ui_in;
    wire [7:0] uo_out;

    tt_um_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uo_out(uo_out)
    );

    initial begin
        clk = 1;
        rst_n = 0;
        ui_in = 8'b00000100; // ui_in[2] = 1 (incrementar)
        #10 rst_n = 1;
        #100 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim.vcd");
        $dumpvars(0, testbench);
    end

endmodule
