module KMeansCentroids(
    input wire [7:0] data[7:0],
    output reg [7:0] assignedCentroids[7:0]
);

  real sum = 0;
  real sum1 = 0;
  real count1 = 0;
  real sum2 = 0;
  real count2 = 0;
  real current = 0;
  real centroid1 = 0;
  real centroid2 = 0;

always @(*) begin
    for (int i = 0; i < 8; i = i + 1) begin
        sum = sum + (data[i]);
      $display(data[i]);
    end
  
  sum = sum/2;
  $display(" vgyhn");
  for (int i = 0; i < 8; i = i + 1) begin
    if (current + (data[i]) <= sum) begin
      sum1 = sum1 + (data[i]);
      count1 = count1 + 1;
      current = current + data[i];
    end else begin
      sum2 = sum2 + (data[i]);
      count2 = count2 + 1;
    end
  end
    centroid1 = sum1 / count1;
    centroid2 = sum2 / count2;
  $display(centroid1);
  $display(centroid2);
    for (int i = 0; i < 8; i = i + 1) begin
      if (data[i] - centroid1 > data[i] - centroid2 && centroid1 - data[i] > 0) begin
            assignedCentroids[i] = 8'b0;
        	$display(i);
        	$display(centroid1 - data[i]);
        	$display(centroid2 - data[i]);
        end else begin
            assignedCentroids[i] = 8'b1;
          	$display(i);
        	$display(centroid1 - data[i]);
        	$display(centroid2 - data[i]);
    end
    end
end

endmodule
