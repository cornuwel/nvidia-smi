module NvidiaSmi

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

  return_keys = @@nvidia_keys.map(&:clone).each do |s|
    s.gsub!('.', '_')
  end

  Struct.new('Gpu', *return_keys)


  def self.gpu_count
    `nvidia-smi --query-gpu=count --format=csv,noheader -i 0`.to_i
  end

  def self.driver_version
    `nvidia-smi --query-gpu=driver_version --format=csv,noheader -i 0`.strip
  end

  def self.gpus
    gpus = Array.new
    data = `nvidia-smi --query-gpu=#{@@nvidia_keys.join(',')} --format=csv,noheader`.each_line do |line|
      values = line.strip.split(',').each do |v|
        v.strip!
      end

      gpus << Struct::Gpu.new(*values)
    end
    return gpus
  end

end

