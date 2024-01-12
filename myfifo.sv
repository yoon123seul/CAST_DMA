module FIFO  //////////가장 최근 버전
    import dma_pkg::*;
(
    input   logic                           clk,
    input   logic                           rstn,
    output  logic                           full,
    output  logic                           empty,
    input   logic                           push,
    input   logic  [MEM_DATA_WIDTH-1:0]     push_data,
    input   logic                           pop,
    output  logic  [MEM_DATA_WIDTH-1:0]     pop_data,

    input  logic [3:1] num_input,
    output logic       push_finish,
    output logic       pop_finish
);
logic                                       wr_en;
logic                                       rd_end;
logic                                       count;

logic [15:0]                                wr_ptr, rd_ptr;
logic [MEM_DATA_WIDTH/4-1:0] mem [15:0];

assign wr_en = push & ~full;
assign rd_en = pop & ~empty;

always_ff @ (posedge clk) begin 
    if (~rstn) begin 
        wr_ptr <= 16'd0;
        rd_ptr <= 16'd0;
    end
    else begin
        if (wr_en) wr_ptr <= wr_ptr + 16'd1;
        else wr_ptr <= wr_ptr;
        if (rd_en) rd_ptr <= rd_ptr + 16'd1;
        else rd_ptr <= rd_ptr;
    end
end

always_comb begin
    
end




endmodule