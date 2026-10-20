//AI Generated Test Bench Below
timescale 1ns/1ps

module alu_tb;

    logic [31:0] A;
    logic [31:0] B;
    logic [3:0] ALUControl;
    logic [31:0] Result;

    alu dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result)
    );

    initial begin
        // Test 1: Addition (10 + 5 = 15)
        A = 32'd10;
        B = 32'd5;
        ALUControl = 4'b0000;
        #10;
        if (Result !== 32'd15)
            $error("ADD failed: got %0d", Result);
        else
            $display("ADD passed");

        // Test 2: Subtraction (10 - 5 = 5)
        ALUControl = 4'b0001;
        #10;
        if (Result !== 32'd5)
            $error("SUB failed: got %0d", Result);
        else
            $display("SUB passed");

        // Test 3: AND (10 & 5 = 0)
        ALUControl = 4'b0010;
        #10;
        if (Result !== 32'd0)
            $error("AND failed: got %0d", Result);
        else
            $display("AND passed");

        // Test 4: OR (10 | 5 = 15)
        ALUControl = 4'b0011;
        #10;
        if (Result !== 32'd15)
            $error("OR failed: got %0d", Result);
        else
            $display("OR passed");

        // Test 5: XOR (10 ^ 5 = 15)
        ALUControl = 4'b0100;
        #10;
        if (Result !== 32'd15)
            $error("XOR failed: got %0d", Result);
        else
            $display("XOR passed");

        // Test 6: Signed less-than (10 < 5 is false)
        ALUControl = 4'b0101;
        #10;
        if (Result !== 32'd0)
            $error("SLT failed: got %0d", Result);
        else
            $display("SLT passed");

        // Test 7: Shift left (1 << 3 = 8)
        A = 32'd1;
        B = 32'd3;
        ALUControl = 4'b0110;
        #10;
        if (Result !== 32'd8)
            $error("SLL failed: got %0d", Result);
        else
            $display("SLL passed");

        // Test 8: Logical shift right (16 >> 2 = 4)
        A = 32'd16;
        B = 32'd2;
        ALUControl = 4'b0111;
        #10;
        if (Result !== 32'd4)
            $error("SRL failed: got %0d", Result);
        else
            $display("SRL passed");

        // Test 9: Arithmetic shift right
        A = 32'hFFFFFFF8;  // -8 in signed 32-bit two's complement
        B = 32'd1;
        ALUControl = 4'b1000;
        #10;
        if (Result !== 32'hFFFFFFFC)
            $error("SRA failed: got %h", Result);
        else
            $display("SRA passed");

        $display("All basic ALU tests completed.");
        $finish;
    end

endmodule