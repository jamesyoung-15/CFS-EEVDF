# Testing Setup

## Compiling Kernels

See [here](./compile-kernel.md)

## Phoronix Test Suite

Either install with distro packages (eg. `sudo apt-get install phoronix-test-suite). 

Alternatively download [source from Github](https://github.com/phoronix-test-suite/phoronix-test-suite) and run the install.sh like this:

``` bash
curl -L https://github.com/phoronix-test-suite/phoronix-test-suite/archive/refs/heads/master.zip > phoronix-test-suite.zip 
unzip phoronix-test-suite.zip 
cd phoronix-test-suite-master 
chmod +x install-sh
sudo ./install-sh && cd ..
```

 This [script](./phoronix-test-setup.sh) does the above. You may need to install certain dependencies like `php`, `php-xml`, etc.
