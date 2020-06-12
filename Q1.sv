module j4count(clock,a);                                  //design
  input clock;
  output [3:0] a;
  reg [3:0] a;
  parameter s0=0, s1=1, s2=2,s3=3;
  reg [1:0] state;
  initial 
    a=0;
  
  always @(posedge clock)
    case (state)
      s0: begin 
        a[0]=a[0]+1;
        state<=s1;
      end
      s1:begin 
        a[1]=a[1]+1;
        state<=s2;
      end
   
      s2:begin 
        a[2]=a[2]+1;
        state<=s3;
      end
    
      s3:begin 
        a[3]=a[3]+1;
        state<=s0;
      end
      
      default:begin
        a[0]=1;
        state<=s1;
      end
    endcase
endmodule
  
        
  module test;
 reg clock;
  wire [3:0] a;
  j4count z(clock,a);
  
    initial
      begin
        
        $dumpfile("counter.vcd");
        $dumpvars(1,test); 
        $monitor($time ,a);                                       //testbench
      
    end
  
  always #5 clock=~clock;
  initial
    begin
    clock=1'b0;
    #100 $finish;
  end
endmodule

