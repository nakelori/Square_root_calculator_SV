module sqr_rt_tb();
    logic [31:0] op,result;
    logic clk,rst,flag;

    square_root DUT(.op(op),.result(result),.clk(clk),.reset(rst),.flag(flag));

    always #5 clk = ~clk; 
    initial begin
        $dumpfile("test_sqr.vcd");
        $dumpvars(0,sqr_rt_tb);
         
        op = 32'd63504;
        assert (op[31]==0) begin //make sure the operand is positive
            rst = 1;
            clk = 0;
            #10;
            rst = 0;

            wait(flag == 1'b1); //wait for the algorithm to finish
            $display("The square root of %d is %d",op, result);
        end
        else
            $display("The operand is negative");
        $finish;
    end
endmodule
