module adder (
    input [3:0] A,
    input [3:0] B,
    input [31:0] X [0:19],
    input [31:0] Y [0:19],
  output reg [3:0] Sum,
  output reg [31:0] sum_x_squared,
  output reg [31:0] mean_x,
  output reg [31:0] mean_y,
  output reg [31:0] slope,
  output reg [31:0] intercept
);
   reg [31:0] sum_x;
   reg [31:0] sum_y;
   reg [63:0] numerator;
   reg [63:0] denominator;
   integer i;

   always @* begin
      sum_x = 0;
      sum_y = 0;
      sum_x_squared = 0;
      for (i = 0; i < 20; i = i + 1) begin
         sum_x = sum_x + X[i];
         sum_y = sum_y + Y[i];
         sum_x_squared = sum_x_squared + (X[i] * X[i]);
        $display("sum_x_squared = %d", sum_x_squared);
      end
      
      // Display the value of sum_x_squared

   
      mean_x = sum_x / 20;
      mean_y = sum_y / 20;
      numerator = 0;
      denominator = 0;
      for (i = 0; i < 20; i = i + 1) begin
      	numerator = numerator + (X[i] - mean_x) * (Y[i] - mean_y);
      	denominator = denominator + (X[i] - mean_x) * (X[i] - mean_x);
      end
     $display("Demonitor = %d", denominator);
     if (denominator != 0)
      slope = numerator / denominator;
    else
      slope = 0;
    intercept = mean_y - slope * mean_x;
      Sum = A + B;
   end
endmodule
