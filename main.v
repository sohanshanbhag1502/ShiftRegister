module demux(input wire sel, inp, output reg p0, p1);
    always @ * begin
        if (sel==0)
            p0=inp;
        else
            p1=inp;
    end
endmodule

module dflipflop(input wire clk, inp, reset, output wire out);
    reg dfout;
    always @(posedge clk) begin
        if (reset)
            dfout<=0;
        else
            dfout<=inp;
    end
    assign out=dfout;
endmodule

module siso(input wire clk, sinp, reset, output wire sout);
    wire temp[2:0];
    dflipflop df1(clk, sinp, reset, temp[0]);
    dflipflop df2(clk, temp[0], reset, temp[1]);
    dflipflop df3(clk, temp[1], reset, temp[2]);
    dflipflop df4(clk, temp[2], reset, sout);
endmodule

module sipo(input wire clk, sinp, reset, output wire [3:0]out);
    dflipflop df1(clk, sinp, reset, out[0]);
    dflipflop df2(clk, out[0], reset, out[1]);
    dflipflop df3(clk, out[1], reset, out[2]);
    dflipflop df4(clk, out[2], reset, out[3]);
endmodule

module Sreg(input wire clk, sinp, resetsi, resetpo, choice, output wire [3:0]out, 
output wire sout);
    wire inp1, inp2;
    demux d1(choice, sinp, inp1, inp2);
    siso s1(clk, inp1, resetsi, sout);
    sipo s2(clk, inp2, resetpo, out);
endmodule