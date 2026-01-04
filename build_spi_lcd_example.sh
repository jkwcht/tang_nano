#!/usr/bin/sh

set -e
set -o pipefail

cd src/example_spi_lcd

yosys -D LEDS_NR=6 -p "read_verilog top.v; synth_gowin -json spi_lcd_example.json"

DEVICE='GW1NR-LV9QN88PC6/I5'
BOARD='lcd114_test'

nextpnr-himbaechel --json spi_lcd_example.json \
                   --write pnr_spi_lcd_example.json \
                   --device $DEVICE \
                   --vopt family=GW1N-9C \
                   --vopt cst=$BOARD.cst

gowin_pack -d GW1N-9C -o pack.fs pnr_spi_lcd_example.json

openFPGALoader -b tangnano9k pack.fs
