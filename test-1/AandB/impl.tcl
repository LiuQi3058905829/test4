#Generated by Fabric Compiler ( version 2022.2-SP1-Lite <build 132640> ) at Wed Jun 12 17:44:35 2024

set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module AandB
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 