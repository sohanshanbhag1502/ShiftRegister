`timescale 1ns / 1ps

module Sreg_tb();

    reg tclk, tsinp, treset;
    wire tsout;
    wire [3:0]tpout;

    Sreg reg1(.clk(tclk), .sinp(tsinp), .reset(treset), .out(tpout), .sout(tsout));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, Sreg_tb);
    end

    initial begin
        tclk=1'b0;
        forever #5 tclk=~tclk;
    end

    initial begin
        $monitor("clk=%d SerialInput=%d ParallelOutput=%d SerialOutput=%d", tclk, tsinp, tpout, tsout);
    end

    initial begin
        treset=1'b1;
        #10
        treset=1'b0;
        tsinp=1'b1;
        #10
        treset=1'b0;
        tsinp=1'b0;
        #10
        treset=1'b0;
        tsinp=1'b1;
        #10
        treset=1'b0;
        tsinp=1'b0;
        #10
        treset=1'b1;
        tsinp=1'b0;
        #10
        $finish;
    end

endmodule