module square_root(input logic [31:0] op, input reg clk, reset, output logic [31:0] result,output logic flag);
    logic [31:0] cnt,add,sqr;
    logic inreset;

    always_ff @(posedge clk) begin //reset parameters
        if (reset || flag) begin
            cnt<=32'b1;
            add<=32'b11;
            sqr<=32'b1;
            flag<=0;  //A flag - indicates if the algo is done
        end
        else
            if(sqr<op) begin //itertaion - algorithm not finished
                cnt<=cnt+32'b01;
                add<=add+32'b10;
                sqr<=sqr+add;S
                flag<=0;
        end
            else if (sqr==op) begin //op has an intejer square root
                result<=cnt;  
                flag<=1; 
            end
            else begin // op's sqaure root has a decimal point, round down
                result<=cnt-1;
                flag<=1;
            end

    end     
endmodule
