module training;
    reg [31:0] w1, w2, b;
    wire [31:0] a, dz;
    reg [31:0] dw1, dw2, db;
    reg [31:0] learning_rate;
    integer i;
    initial begin
        w1 = 0;
        w2 = 0;
        b = 0;
        learning_rate = 0.1;
    end
    always begin
        for (i = 0; i < iterations; i = i + 1) begin
            dw1 = 0;
            dw2 = 0;
            db = 0;
          
            dw1 = dw1 + x1 * dz;
            dw2 = dw2 + x2 * dz;
            db = db + dz;

            w1 = w1 - learning_rate * dw1;
            w2 = w2 - learning_rate * dw2;
            b = b - learning_rate * db;
        end
    end
endmodule

