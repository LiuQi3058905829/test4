# ----------------------------------------
# Created on: Tue May 14 18:52:29 2024
# Auto generated by Pango
# ----------------------------------------

vsim  -novopt  -L work -L usim -L adc -L ddrc -L ddrphy -L hsst_e2 -L iolhr_dft -L ipal_e1 -L pciegen2 AorB_tb usim.GTP_GRS
add wave *
view wave
view structure
view signals

run 1000ns

# ----------------------------------------