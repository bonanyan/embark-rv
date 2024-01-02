# 00\_Build _Memory_

## Run

First enter ``test`` folder:
```bash
cd embark-rv/src/01_fetch/test
```

To run simulation:
```bash
make
```

To plot the waveform:
```bash
make plot
```

To clean up (remove the generated files):
```bash
make clean
```

## Files
```
00_memory
├── rtl
│   └── memory.v    //design
└── test
    ├── makefile    //top entry
    ├── plot.tcl    //loaded tcl script for loading waveforms, optional
    ├── testbench.v //verilog testbench
    ├── wave        //generated executable
    └── wave.vcd    //generated waveform file
```
