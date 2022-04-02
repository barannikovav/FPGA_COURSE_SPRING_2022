`timescale 1ns/10ps

module d_flip_flop_tb();

reg DATA; // registers for input signals
reg COND; 
wire Q;   // wires for output signals
wire QN; 

integer i; // loop
realtime period = 10; // setting period variable
reg [3:0] delay;
integer seed = 4; // urandom

d_flip_flop d_flip_flop_inst(
    .d_i(DATA), // data
    .c_i(COND), // condition
    .q_o(Q),
    .qn_o(QN)
);


always #(period) COND = ~COND; // setting clk inverting every period 

initial 
begin
    $dumpvars;
    COND = 1'b0;
    DATA = 1'b0;

    for (i = 0; i < 50; i = i + 1)
    begin
        delay = $urandom(seed) % 10 + 1;
        #(delay) DATA = ~DATA; 
    end

    #100 $finish;
end

initial
begin
    $monitor("simtime = %g, DATA =%b, COND =%b, Q =%b, QN =%b", $time,DATA,COND,Q, QN);
end

endmodule