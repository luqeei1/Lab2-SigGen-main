#!/bin/sh

~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# cleanup
rm -rf obj_dir
rm -f sinegen.vcd


verilator -Wall --cc --trace sigdelay.sv counter.sv ram2ports.sv --exe sigdelay_tb.cpp


make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

./obj_dir/Vsigdelay
