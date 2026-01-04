#!/usr/bin/sh

set -ex
set -o pipefail

verilator -cc src/example_spi_lcd/sim/tb_lcd141.v src/example_spi_lcd/hdl/top.v --binary --trace 
./obj_dir/Vtb_lcd141
