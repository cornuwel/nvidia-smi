module NvidiaSmi

  # :stopdoc:

  # All the values we want to extract from nvidia-smi
  @@nvidia_keys = [
    'index',
    'pci.bus',
    'name',
    'uuid',
    'temperature.gpu',
    'fan.speed',
    'memory.used',
    'memory.total',
    'memory.free',
    'utilization.memory',
    'utilization.gpu',
    'power.draw',
    'power.limit',
    'pstate',
    'clocks.gr',
    'clocks.sm',
    'clocks.mem',
    'clocks.video',
    'vbios_version'
  ]

  # Attributes names in the return Struct, with _ instead of . to keep ruby happy
  return_keys = @@nvidia_keys.map(&:clone).each do |s|
    s.gsub!('.', '_')
  end

  # The structure containing all the values we have about a GPU
  Struct.new('Gpu', *return_keys)

  # :startdoc:


  # Returns an Integer representing the number of GPUs seen by nvidia-smi
  #
  def self.gpu_count
    `nvidia-smi --query-gpu=count --format=csv,noheader -i 0`.to_i
  end

  # Returns a String containing the driver's version
  #
  def self.driver_version
    `nvidia-smi --query-gpu=driver_version --format=csv,noheader -i 0`.strip
  end

  # Returns an Array of Struct::Gpu
  # The members of the struct are the values we extracted from nvidia-smi, as Strings.
  #
  def self.gpus
    gpus = Array.new
    data = `nvidia-smi --query-gpu=#{@@nvidia_keys.join(',')} --format=csv,noheader`.each_line do |line|
      values = line.strip.split(',').each do |v|
        v.strip!
      end
      gpus << Struct::Gpu.new(*values)
    end

    gpus
  end
end

