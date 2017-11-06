
require File.expand_path('../spec_helper', __FILE__)

describe NvidiaSmi do

  context "when asked for the number of GPUs" do
    it "should return the number of GPUs as an Integer" do
      NvidiaSmi.should_receive(:`).with("nvidia-smi --query-gpu=count --format=csv,noheader -i 0").and_return("3")
      expect(NvidiaSmi.gpu_count).to eq(3)
    end
  end

  context "when asked the driver's version" do
    it "should return the driver's version as a String" do
      NvidiaSmi.should_receive(:`).with("nvidia-smi --query-gpu=driver_version --format=csv,noheader -i 0").and_return("384.90")
      expect(NvidiaSmi.driver_version).to eq("384.90")
    end
  end

  context "when asked the GPUs list" do

    before(:each) do
      NvidiaSmi.should_receive(:`).with("nvidia-smi --query-gpu=index,pci.bus,name,uuid,temperature.gpu,fan.speed,memory.used,memory.total,memory.free,utilization.memory,utilization.gpu,power.draw,power.limit,pstate,clocks.gr,clocks.sm,clocks.mem,clocks.video,vbios_version --format=csv,noheader").and_return("0, 0x01, GeForce GTX 1060 3GB, GPU-57737cf0-1db6-4905-9caa-1eeb73beb974, 71, 54 %, 2404 MiB, 3013 MiB, 609 MiB, 74 %, 99 %, 106.27 W, 120.00 W, P2, 1860 MHz, 1860 MHz, 3802 MHz, 1670 MHz, 86.06.3C.00.8E")
    end

    it "should return an Array" do
      expect(NvidiaSmi.gpus).to be_a(Array)
    end

    it "should return an Array with one element per GPU" do
      expect(NvidiaSmi.gpus.count).to eq(1)
    end

    it "should return an Array of Struct::Gpu" do
      expect(NvidiaSmi.gpus.first).to be_a(Struct::Gpu)
    end

    it "should return the GPUs index" do
      expect(NvidiaSmi.gpus.first.index).to eq("0")
    end

    it "should return the GPUs pci bus" do
      expect(NvidiaSmi.gpus.first.pci_bus).to eq("0x01")
    end

    it "should return the GPUs model name" do
      expect(NvidiaSmi.gpus.first.name).to eq("GeForce GTX 1060 3GB")
    end

    # Not sure there really is a point in testing every value here...

  end

end

