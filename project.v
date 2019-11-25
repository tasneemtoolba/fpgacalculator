module project (
input  [3:0] dat_a_in,
input  [3:0] dat_b_in,
input  [1:0] function_in,
output [6:0] led1,
output [6:0]led2,
output [6:0]led3
);

reg stat[0:2][0:6];

integer out=0;
integer t;
integer i=0;
integer out2;
always@(dat_a_in or dat_b_in)
begin

i=0;
    case (function_in)

        2'b00: out = dat_a_in + dat_b_in;
        
        2'b01: out = dat_a_in - dat_b_in;
        
        2'b10: out = dat_a_in * dat_b_in;
        
        2'b11: out = dat_a_in / dat_b_in;
        
       
		 endcase
		 
		 
        while( i<3)
		    begin
          t = out % 10;
          out = out / 10;
          case(t)
          0:begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b0;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b1;
         end			 
          1:
			 begin
			 stat[i][0] = 1'b1;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b1;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b1;
			 stat[i][6] = 1'b1;
         end
			
          2:
			 begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b1;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b0;
			 stat[i][5] = 1'b1;
			 stat[i][6] = 1'b0;
         end
          3:
			 begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b1;
			 stat[i][6] = 1'b0;
         end
			 
          4:
			 begin
			 stat[i][0] = 1'b1;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b1;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b0;
         end
			 5:begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b1;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b0;
         end
			6:
			begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b0;
			 stat[i][5] = 1'b1;
			 stat[i][6] = 1'b0;
         end
          7:begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b1;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b1;
			 stat[i][6] = 1'b1;
         end
			 8:
			 begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b0;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b0;
         end
			 9:
			 begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b1;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b0;
         end
			 default:
			 begin
			 stat[i][0] = 1'b0;
			 stat[i][1] = 1'b0;
			 stat[i][2] = 1'b0;
			 stat[i][3] = 1'b0;
			 stat[i][4] = 1'b0;
			 stat[i][5] = 1'b0;
			 stat[i][6] = 1'b1;
         end
          endcase

          i = i + 1;
        end       
      
         
   
end


assign led1[0]= stat[0][0];
assign led1[1]= stat[0][1];
assign led1[2]= stat[0][2];
assign led1[3]= stat[0][3];
assign led1[4]= stat[0][4];
assign led1[5]= stat[0][5];
assign led1[6]= stat[0][6];
assign led2[0]=stat[1][0];
assign led2[1]=stat[1][1];
assign led2[2]=stat[1][2];
assign led2[3]=stat[1][3];
assign led2[4]=stat[1][4];
assign led2[5]=stat[1][5];
assign led2[6]=stat[1][6];

assign led3[0]=stat[2][0];
assign led3[1]=stat[2][1];
assign led3[2]=stat[2][2];
assign led3[3]=stat[2][3];
assign led3[4]=stat[2][4];
assign led3[5]=stat[2][5];
assign led3[6]=stat[2][6];


// pin planner for led[0][0:6] for 1st block
// ...................[1][0:6] .... 2nd block
// ...................[2][0:6] .... 3rd block


endmodule