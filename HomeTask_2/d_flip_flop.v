module d_flip_flop(
    d_i, // data
    c_i, // condition
    q_o,
    qn_o
);

input   wire    d_i;
input   wire    c_i;
output  wire    q_o;
output  wire    qn_o;

wire qm;

d_latch d_latch_master(
    .d_i(d_i), 
    .c_i(~c_i), 
    .q_o(qm)
  );

d_latch d_latch_slave(
    .d_i(qm),
    .c_i(c_i),
    .q_o(q_o),
    .qn_o(qn_o)
  );

endmodule
