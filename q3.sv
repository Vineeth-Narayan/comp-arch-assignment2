//NOT WORKING

module inp(x,res,out,c);
  input  x,res;
  output reg out;
  reg sum,g;
  parameter a1=1, a2=2 , a0=0;
  always @(res)
    begin
      assign res=0;
      if(sum)
        out=0;
      else
        out=1;
      sum<=a0;
    end
  always @(posedge c)
    case(sum)
      a0:begin
        if(x)
          sum<=a1;
      end
      
      a1:begin
        if(x)
          sum<=a2;
      end
      
      a2:begin
        if(x)
          sum<=a0;
      end
      
      default: begin
        if(x)
          sum<=a1;
        else
          sum<=a0;
      end
    endcase
endmodule


module t;
  reg c;
  wire out,x,res;
  
  inp a(x,res,out,c);
  
  initial
    begin
      
    assign res=1'b0;
      c<=1'b0;
      $dumpfile("x.vcd");
      $dumpvars(1,t);
      
    end
  
      
    always #2 c=~c;
  
  initial
    begin
      #1
      assign x=1'b1;
      #4
      assign x=1'b0;
      #4
      assign x=1'b1;
      #4
      assign x=1'b1;
      assign res=1;
      $display(out);
      $finish;
      
    end
endmodule
      
        
    
  
  
