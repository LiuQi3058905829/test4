#Generated by Fabric Compiler ( version 2022.2-SP1-Lite <build 132640> ) at Wed Jun 12 16:59:33 2024

add_design "D:/pdsproject/project/project1/AorB/test2/test2_1/test3/source/gate74LS74.v"
add_design "D:/pdsproject/project/project1/AorB/test2/test2_1/test3/source/gate74LS00.v"
add_constraint "D:/pdsproject/project/project1/AorB/test2/test2_1/test3/source/test3.fdc"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module test3
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module test3
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
