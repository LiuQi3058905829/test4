#Generated by Fabric Compiler ( version 2022.2-SP1-Lite <build 132640> ) at Wed Jun 12 15:37:29 2024

add_design "D:/pdsproject/project/project1/AorB/test2/test2_1/AandB/ABorCD/AyB/project6/jk/source/jk.v"
add_design "D:/pdsproject/project/project1/AorB/test2/test2_1/AandB/ABorCD/AyB/project6/jk/source/gate74LS112.v"
add_constraint "D:/pdsproject/project/project1/AorB/test2/test2_1/AandB/ABorCD/AyB/project6/jk/source/jk.fdc"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module jk
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module jk
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
