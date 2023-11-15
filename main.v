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

module Sreg(input wire clk, sinp, reset, output wire [3:0]out, output wire sout);
    dflipflop df1(clk, sinp, reset, out[0]);
    dflipflop df2(clk, out[0], reset, out[1]);
    dflipflop df3(clk, out[1], reset, out[2]);
    dflipflop df4(clk, out[2], reset, out[3]);

    assign sout=out[3];
endmodule