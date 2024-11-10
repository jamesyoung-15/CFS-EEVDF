# CFS vs EEVDF

Some benchmarks comparing CFS and EEVDF CPU schedulers on Linux. Just for reference not a fully comprehensive/proper test.

## Testing Details

Ran benchmarks with laptop (bare metal). Below list some info for testing. 

### System Info

- CPU: Ryzen 7 4800H
- RAM: 16 GB DDR4 3200 MHz (2x8GB SODIMM)
- GPU: RTX 2060 (Laptop)
- OS: Arch Linux (see kernel versions below)

### Kernel

- CFS: [6.5.9](https://archlinux.org/releng/releases/2023.12.01/)
- EEVDF: [6.6.3](https://archlinux.org/releng/releases/2023.11.01/)

#### Note

CFS was the default CPU scheduler from 2.6 until 6.6, where EEVDF replaced it. This means that some result differences could be potentially because of other patches unrelated to the change in CPU scheduler, but based on the changes in [6.6](https://kernelnewbies.org/Linux_6.6) I believe most disrepancies should be because of the new CPU scheduler.

### Benchmark Utils

- Hackbench

Maybe:

- 7Zip
- Phoronix Test Suite (todo: update)
- perf
- Techempower

## Results

Todo
