read library -liberty /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read design -verilog sa.v -golden
read design -verilog sa_netlist.v -revised
set system mode lec
compare
exit
