read_lib /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl {fa.v sa.v}
elaborate
set_db use_scan_seqs_for_non_dft false
read_sdc input_constraint.sdc
set_top sa

syn_generic
syn_map
syn_opt
current_design sa
ungroup -all -flatten 

write_netlist > sa_netlist.v

write_sdc > gate_output_constraint.sdc

report area > ../reports/syn_area.rpt
report timing > ../reports/syn_timing.rpt
report power > ../reports/syn_power.rpt
