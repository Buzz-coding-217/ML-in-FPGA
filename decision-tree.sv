module DecisionTreeNode (
    input wire [2:0] features,
    output reg prediction     
);

    reg [2:0] feature;
    reg left_branch, middle_branch, right_branch;
    assign feature = features;
    always @* begin
        case (feature)
            3'b000: begin
                left_branch = 1'b1;
                middle_branch = 1'b0;
                right_branch = 1'b0;
            end
            3'b001: begin
                left_branch = 1'b0;
                middle_branch = 1'b1;
                right_branch = 1'b0;
            end
            3'b010: begin
                left_branch = 1'b1;
                middle_branch = 1'b0;
                right_branch = 1'b0;
            end
            3'b011: begin
                left_branch = 1'b0;
                middle_branch = 1'b0;
                right_branch = 1'b1;
            end
            3'b100: begin
                left_branch = 1'b0;
                middle_branch = 1'b0;
                right_branch = 1'b1;
            end
            3'b101: begin
                left_branch = 1'b1;
                middle_branch = 1'b0;
                right_branch = 1'b0;
            end
            3'b110: begin
                left_branch = 1'b0;
                middle_branch = 1'b1;
                right_branch = 1'b0;
            end
            3'b111: begin
                left_branch = 1'b0;
                middle_branch = 1'b0;
                right_branch = 1'b1;
            end
            default: begin
                left_branch = 1'bX;
                middle_branch = 1'bX; 
                right_branch = 1'bX;
            end
        endcase
    end

    always @* begin
        if (left_branch) begin
            prediction = 1'b0;
        end else if (middle_branch) begin
            prediction = 1'b1;
        end else if (right_branch) begin
            prediction = 1'b1;
        end else begin
            prediction = 1'bX;
        end
    end

endmodule
