# CFS vs EEVDF

Some benchmarks w/ Phoronix Test Suite comparing CFS and EEVDF CPU schedulers on Linux. Just for reference not a fully comprehensive/proper test.

## Testing Details

Ran benchmarks with laptop (bare metal). Below list some info for testing.

### System Info

- CPU: Ryzen 7 4800H
- RAM: 16 GB DDR4 3200 MHz (2x8GB SODIMM)
- GPU: RTX 2060 (Laptop)
- OS: Arch Linux (see kernel versions below)

### Kernel

Arch Linux with compiled kernel 6.6 and 6.5.

- CFS: [6.5](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tag/?h=v6.5)
- EEVDF: [6.6](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tag/?h=v6.6)

#### Note

CFS was the default CPU scheduler from 2.6 until 6.6, where EEVDF replaced it. I used kernel 6.5 for CFS and 6.6 for EEVDF. See [here](./setup/compile-kernel.md) for how I used different kernel versions.

This means that some result differences could be potentially because of other patches unrelated to the change in CPU scheduler, but based on the changes in [6.6](https://kernelnewbies.org/Linux_6.6) I believe most disrepancies should be because of the new CPU scheduler. I tried to keep kernel versions close as possible for this reason as well.

### Benchmark Utils

- Phoronix Test Suite
  - Hackbench
  - 7Zip
  - nginx

## Results

Todo
