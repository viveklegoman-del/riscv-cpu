
module alu (
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [3:0]  ALUControl,
    output logic [31:0] Result
);

    localparam logic [3:0] ALU_ADD = 4'b0000;
    localparam logic [3:0] ALU_SUB = 4'b0001;
    localparam logic [3:0] ALU_AND = 4'b0010;
    localparam logic [3:0] ALU_OR  = 4'b0011;
    localparam logic [3:0] ALU_XOR = 4'b0100;
    localparam logic [3:0] ALU_SLT = 4'b0101;
    localparam logic [3:0] ALU_SLL = 4'b0110;
    localparam logic [3:0] ALU_SRL = 4'b0111;
    localparam logic [3:0] ALU_SRA = 4'b1000;

    always_comb begin
    
        Result = 32'b0;

        case (ALUControl)

            ALU_ADD: Result = A + B;

            ALU_SUB: Result = A - B;

            ALU_AND: Result = A & B;

            ALU_OR:  Result = A | B;

            ALU_XOR: Result = A ^ B;

            ALU_SLT: Result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;

          
            ALU_SLL: Result = A << B[4:0];

            ALU_SRL: Result = A >> B[4:0];

        
            ALU_SRA: Result = $signed(A) >>> B[4:0];

            default: Result = 32'b0;

        endcase
    end

endmodule