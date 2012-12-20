require 'benchmark'
require 'benchmark/ips'

def tak(x, y, z)
  unless y < x
    z
  else
    tak(tak(x-1, y, z),
         tak(y-1, z, x),
         tak(z-1, x, y))
  end
end

def tak_no_tail(x, y, z)
  if y < x
    tak(tak(x-1, y, z),
         tak(y-1, z, x),
         tak(z-1, x, y))
  else
    z
  end
end


Benchmark.ips do |x|
  x.report "tak" do
    tak 6, 3, 0
  end

  x.report "tak notail" do
    tak_no_tail 6, 3, 0
  end
end

