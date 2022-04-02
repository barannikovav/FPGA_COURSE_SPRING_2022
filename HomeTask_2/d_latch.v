module d_latch (
    d_i, // data
    c_i, // condition
    q_o,
    qn_o
);

input	wire		d_i;
input 	wire		c_i;
output  wire		q_o;
output  wire		qn_o;

wire r;
wire s;

assign r = ~(c_i & (~d_i));
assign s = ~(d_i & c_i);

sr_and_latch sr_latch_inst(
	.r_i(r),          // after dot name of variable from original module, in brackets name of local variable
	.s_i(s), 
	.q_o(q_o),
	.qn_o(qn_o)
	);

endmodule