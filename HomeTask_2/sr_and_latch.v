module sr_and_latch (
	r_i, // reset
	s_i, // set 
	q_o,
	qn_o
);

input  wire		r_i;
input  wire 	s_i;
output wire		q_o;
output wire		qn_o;

assign q_o = ~ (s_i & qn_o);
assign qn_o = ~ (r_i & q_o);

endmodule