//created in behaivoural form


module count (clock,x);
  input clk;
  output reg [3:0]x;
  parameter x1 = 4'b0000, x2 = 4'b0001, x3 = 4'b0010  ,x4 = 4'b0011, x5 = 4'b0100, x6 = 4'b0101,x7 = 4'b0110,x8 = 4'b0111,x9 = 4'b1000,x10 = 4'b1001,x11 = 4'b1010;
 
  
parameter S0 = 0, S1 = 1, S2 = 2,S3 = 3, S4 = 4, S5 = 5,S6 = 6, S7 = 7,S8 = 8, S9 = 9,S10 = 10;
  reg [9:0] state;
  
  always @ (posedge clock)
    begin
      case (state)
        S0: begin			
          x <= x1; state <= S1;
        end
        S1: begin			
          x <= x2; state <= S2;
        end
        S2: begin			
          x <= x3; state <= S3;
        end
         S3: begin			
          x <= x4; state <= S4;
        end
        S4: begin			
          x <= x5; state <= S5;
        end
        S5: begin			
          x <= x6; state <= S6;
        end
         S6: begin			
          x <= x7; state <= S7;
        end
        S7: begin			
          x <= x8; state <= S8;
        end
        S8: begin			
          x <= x9; state <= S9;
        end
        S9: begin			
          x <= x10; state <= S10;
        end
        S10: begin			
          x <= x11; state <= S0;
        end
        
        
       default:begin
          x <= x1; state <= S1;
        end
      endcase
    end
endmodule
module t;
  reg clk;
  wire [3:0] y;
  
count z(clk, y);
  
  initial
    begin
    clk = 1'b0;
   
    $dumpfile("a.vcd");
    $dumpvars(0,t);
    forever #5 clk = ~clk;
      
     #50 $finish;
    end
endmodule
