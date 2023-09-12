module LogisticRegressionInference (
  input wire clk,
  input wire [31:0] x1, x2,
  output reg prediction
);

  real w1 = 0.5;
  real w2 = 0.75;
  reg [31:0] b = 32'd2;
  real z;
  real w_1;
  real w_2;
  real b_;
  real test;
  real y_pred;
  real expo;
  real r = 1.0;
  real t = 1.0;
  real t1 = 1.0;
  assign w_1 = x1 * 0.1;
  assign w_2 = x2 * 0.1;
  assign b_ = b;
  assign z = w_1 * w1 + w_2 * w2 + b_;
  always @* begin
    real i;
    for (i = 1.0; i < 10.0; i = i + 1.0) begin
      t1 = (z / i);
      t = t1 * t;
      r = r + t;
    end
    expo = r;
    assign y_pred = 1 / (1 + (-expo));
    $display(y_pred);
    if (y_pred >= 0.5)
      prediction = 1'b1;
    else
      prediction = 1'b0;
  end
endmodule
