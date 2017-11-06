
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'spec'
task 'gem:release' => 'spec'

Bones {
  name     'nvidia-smi'
  authors  'Julien Cornuwel'
  email    'julien@cornuwel.net'
  url      'https://github.com/cornuwel/nvidia-smi'
}

