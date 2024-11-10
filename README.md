# CFS vs EEVDF

Some benchmarks comparing CFS and EEVDF CPU schedulers.

## Testing Details

Ran benchmarks with laptop. Below list some info for testing. 

### System Info

- CPU: Ryzen 7 4800H
- RAM: 16 GB DDR4 3200 MHz (2x8GB SODIMM)
- GPU: RTX 2060 (Laptop)
- OS: Arch Linux (see kernel versions below)
- 

### Kernel

CFS was the default CPU scheduler from 2.6 until 6.6, where EEVDF replaced it. I decided to use different kernels to test them rather than re-compile to save time, although it may mean that the result disrepancies can also be because of other kernel patches other than the change in CPU schedulers.

- CFS: 6.5.9
- EEVDF: 6.6.3

### Benchmark Utils

- Hackbench
- Todo


## Results

Todo

