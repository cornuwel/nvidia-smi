[![Gem Version](https://badge.fury.io/rb/nvidia-smi.svg)](https://badge.fury.io/rb/nvidia-smi)

![Gem](https://img.shields.io/gem/dt/nvidia-smi)

nvidia-smi
===========

Get informations about the system's GPU(s), through nvidia-smi.

Features
--------

* Get the number of GPUs seen by the driver
* Get the driver's version
* Get an array of Struct::Gpu objects with all relevant informations about each GPU

Examples
--------

    require 'nvidia-smi'
    NvidiaSmi.gpu_count
    => 1
    NvidiaSmi.driver_version
    => "384.90"
    NvidiaSmi.gpus.first
    => #<struct Struct::Gpu index="0", pci_bus="0x01", name="GeForce GTX 1060 3GB", uuid="GPU-57737cf0-1db6-4905-9caa-1eeb73beb974", temperature_gpu="72", fan_speed="55 %", memory_used="1216 MiB", memory_total="3013 MiB", memory_free="1797 MiB", utilization_memory="55 %", utilization_gpu="99 %", power_draw="121.77 W", power_limit="120.00 W", pstate="P2", clocks_gr="1759 MHz", clocks_sm="1759 MHz", clocks_mem="3802 MHz", clocks_video="1582 MHz", vbios_version="86.06.3C.00.8E">

Requirements
------------

* Nvidia driver
* nvidia-smi

Install
-------

    sudo gem install nvidia-smi

Author
------

Original author: Julien Cornuwel

Contributors:

* YourNameGoesHere

License
-------

The MIT License

Copyright (c) 2017 Julien Cornuwel

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
