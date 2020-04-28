module detect(out,x,clk);
  input x;
  output reg out;
  
  reg state;
  parameter s0=0,s1=1,s2=2,s3=3,s4=4;
  
 
  
  always @(posedge clk)
    case(state)
      s0: begin
        out<=0;
        if(x)
          state<=s1;
      end
      
      s1:begin
        out<=0;
        if(x);
        else
          state<=s2;
      end
      
      s2:begin
        out<=0
        if(x)
          state<=s3;
        else
          state<=s0;
      end
      
      s3: begin
        begin
        if(x)
          state<=s1;
          out<=0;
        end
        
        else
          begin
          state<=s0;
          out <=1;
       end
        
      default:state<=s0;
   endcase
 endmodule
        
        
        
module test;
reg clk,x;
wire out;
  detect a(out,x,clk);
initial
  begin
    $dumpfile("z.vcd");
      $dumpvars(0,test);
    clk=1'b0;
  end
always #5 clk=~clk;
initial
  begin
    #2 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    $finish;
  end
endmodule
