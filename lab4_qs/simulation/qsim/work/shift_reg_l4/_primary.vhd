library verilog;
use verilog.vl_types.all;
entity shift_reg_l4 is
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        ISL             : in     vl_logic;
        rst             : in     vl_logic;
        OSL             : out    vl_logic;
        shift_rg        : out    vl_logic_vector(3 downto 0)
    );
end shift_reg_l4;
