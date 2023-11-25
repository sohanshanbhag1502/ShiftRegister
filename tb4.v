`timescale 1ns / 1ps

module Sreg_tb();

    reg tclk, tsinp, tresetsi, tresetpo, tchoice;
    wire tsout;
    wire [3:0]tpout;

    Sreg reg1(.clk(tclk), .sinp(tsinp), .out(tpout), .sout(tsout), .choice(tchoice),
    .resetsi(tresetsi), .resetpo(tresetpo));

    initial begin
        $dumpfile("dump4.vcd");
        $dumpvars(0, Sreg_tb);
    end

    initial begin
        tclk=1'b0;
        forever #5 tclk=~tclk;
    end

    initial begin
        $monitor("clk=%d SerialInput=%d ParallelOutput=%b SerialOutput=%d", tclk, tsinp, tpout, tsout);
    end

    initial begin
        tresetsi=1'b1;
        tresetpo=1'b1;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b1;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tchoice=1'b0;
        tresetsi=1'b0;
        tresetpo=1'b1;
        tsinp=1'b0;
        #10
        tresetsi=1'b1;
        tresetpo=1'b1;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b1;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tchoice=1'b1;
        tresetsi=1'b1;
        tresetpo=1'b0;
        tsinp=1'b0;
        #10
        tresetsi=1'b1;
        tresetpo=1'b1;
        #10
        $finish;
    end

endmodule