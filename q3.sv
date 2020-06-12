// Code your design here
module inp(x,res,out,c);
  input  x,res,c;
  output reg out;
  reg sum,g;
  parameter a1=1, a2=2 , a0=0;
  
  always @(posedge res)
    begin
      
      if(sum)
        out=0;
      else
       out=1;
       sum=a0;
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
  reg out,x,res,c;
  
  inp a(x,res,out,c);
  
  initial
    begin
      
      res=1'b0;
      c<=1'b0;
      $monitor("%d  %d  %d ",out,$time,res);
      
    end
  
      
    always #2 c=~c;
  
  initial
    begin
      #1
       x=1'b1;
      #4
       x=1'b0;
      #4
       x=1'b1;
      #4
       x=1'b1;
       res=1;
      $display(out);
      $finish;
      
    end
endmodule
      
        
    
  
  
