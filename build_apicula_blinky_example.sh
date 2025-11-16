#!/usr/bin/sh

cd apicula/examples

yosys -D LEDS_NR=6 -p "read_verilog blinky.v; synth_gowin -json blinky.json"

DEVICE='GW1NR-LV9QN88PC6/I5'
BOARD='tangnano9k'

nextpnr-himbaechel --json blinky.json \
                   --write pnrblinky.json \
                   --device $DEVICE \
                   --vopt family=GW1N-9C \
                   --vopt cst=$BOARD.cst

gowin_pack -d GW1N-9C -o pack.fs pnrblinky.json

openFPGALoader -b $BOARD pack.fs
