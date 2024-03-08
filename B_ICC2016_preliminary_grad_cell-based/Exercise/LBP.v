
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output  [13:0] 	gray_addr;
output         	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  [13:0] 	lbp_addr;
output  	lbp_valid;
output  [7:0] 	lbp_data;
output  	finish;
//====================================================================


reg [6:0] x,y,x_s,y_s;
reg [3:0] countNine;
reg [2:0] state, nextState;
reg finishGetData, finishStoreBack, finishSetCenter;
reg [7:0] thresh [0:8];
reg [13:0] storeAddr;

wire [7:0] expOf2 [0:8];
wire [2:0] START, SETCENTER, GETDATA, CALCULATE, STOREBACK, FINISH;
assign expOf2[0] = 8'b0000_0001;
assign expOf2[1] = 8'b0000_0010;
assign expOf2[2] = 8'b0000_0100;
assign expOf2[3] = 8'b0000_1000;
assign expOf2[5] = 8'b0001_0000;
assign expOf2[6] = 8'b0010_0000;
assign expOf2[7] = 8'b0100_0000;
assign expOf2[8] = 8'b1000_0000;

assign START = 0;
assign SETCENTER = 1;
assign GETDATA = 2;
assign CALCULATE = 3;
assign STOREBACK = 4;
assign FINISH = 5;

/*
always@()begin
	for(integer i = 0;i < 8;i = i + 1)
		calculated_result = calculated_result + (thresh[i] * expOf2[i]);
	end
end*/

assign finish = (state == FINISH);
assign lbp_data = (thresh[0] >= thresh[4]) * expOf2[0] + (thresh[1] >= thresh[4]) * expOf2[1] + (thresh[2] >= thresh[4]) * expOf2[2] + (thresh[3] >= thresh[4]) * expOf2[3] + (thresh[5] >= thresh[4]) * expOf2[5] 
+ (thresh[6] >= thresh[4]) * expOf2[6] + (thresh[7] >= thresh[4]) * expOf2[7] + (thresh[8] >= thresh[4]) * expOf2[8];
assign lbp_addr = x + (y * 128);
assign lbp_valid = (state == STOREBACK);
//presume x_s, y_s already set
assign gray_addr = x_s + y_s * 128;
assign gray_req = (state == GETDATA);

always@(state, gray_ready, finishGetData, finishStoreBack, finishSetCenter)begin
	case(state)
		START:
			if(gray_ready)
				nextState = SETCENTER;
			else
				nextState = START;
		SETCENTER:
			nextState = GETDATA;
		GETDATA:
			if(finishGetData)
				nextState = STOREBACK;
			else
				nextState = GETDATA;
		STOREBACK:
			if(x == 126 && y == 126)
				nextState = FINISH;
			else if(finishStoreBack)
				nextState = SETCENTER;
		default
			nextState = 0;
	endcase
end

always@(posedge clk)begin
	if(reset)
		state = 3'b000;
	else
		state = nextState;
	finishGetData <= 0;
	finishSetCenter <= 0;
	finishStoreBack <= 0;
	if(reset)begin
		x <= 0;
		y <= 1;
		countNine <= 0;
	end
	else
		case(state)	
			SETCENTER:begin
				if(x == 126)begin
					x <= 1;
					y <= y + 1;
				end
				else
					x <= x + 1;
				finishSetCenter <= 1;
			end
			GETDATA:begin
				if(countNine == 9)begin
					finishGetData <= 1;
				end
				else
					countNine <= countNine + 1;
				case(countNine)
					0:begin 
						x_s = x - 1;
						y_s = y - 1;
					end
					1:begin 
						x_s = x;
						y_s = y - 1;
						thresh[0] <= gray_data;
					end
					2:begin 
						x_s = x + 1;
						y_s = y - 1;
						thresh[1] <= gray_data;
					end
					3:begin 
						x_s = x - 1;
						y_s = y;
						thresh[2] <= gray_data;
					end
					4:begin 
						x_s = x;
						y_s = y;
						thresh[3] <= gray_data;
					end
					5:begin 
						x_s = x + 1;
						y_s = y;
						thresh[4] <= gray_data;
					end
					6:begin 
						x_s = x - 1;
						y_s = y + 1;
						thresh[5] <= gray_data;
					end
					7:begin 
						x_s = x;
						y_s = y + 1;
						thresh[6] <= gray_data;
					end
					8:begin 
						x_s = x + 1;
						y_s = y + 1;
						thresh[7] <= gray_data;
					end
					9:begin
						thresh[8] <= gray_data;
						countNine <= 0;
					end
					default:begin
						countNine <= 0;
					end
				endcase
			end
			STOREBACK:begin
				finishStoreBack <= 1;
			end
		endcase
end





//====================================================================
endmodule
