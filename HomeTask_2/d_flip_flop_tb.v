`timescale 1ns/10ps

module d_flip_flop_tb();

reg DATA; // registers for input signals
reg COND; 
wire Q;   // wires for output signals
wire QN; 

d_flip_flop d_flip_flop_inst(
    .d_i(DATA), // data
    .c_i(COND), // condition
    .q_o(Q),
    .qn_o(QN)
);

realtime period = 10; // setting period variable

always #(period) COND = ~COND; // setting clk inverting every period 

initial 
begin
    $dumpvars;
    COND = 1'b0;
    DATA = 1'b0;
    #10 DATA = 1'b1;
    #20 DATA = 1'b0;

    #100 $finish;
end

initial
begin
    $monitor("simtime = %g, DATA =%b, COND =%b, Q =%b, QN =%b", $time,DATA,COND,Q, QN);
end

endmodule