library verilog;
use verilog.vl_types.all;
entity shift_reg_l4_vlg_check_tst is
    port(
        OSL             : in     vl_logic;
        shift_rg        : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end shift_reg_l4_vlg_check_tst;
