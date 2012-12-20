require 'benchmark'

total = (ENV['TOTAL'] || 50_000).to_i

S = [111, 163, 196, 61, 208, 137, 167, 1, 35, 35]
M = [4, 30, 237, 184, 148, 15, 230, 118, 158, 15,
     139, 46, 213, 148, 200, 123, 67, 165, 63, 134,
     187, 9, 155, 181, 132]
L = [76, 54, 220, 94, 65, 183, 77, 119, 241, 65,
     153, 30, 254, 84, 95, 239, 150, 65, 67, 217,
     195, 155, 183, 124, 26, 116, 136, 228, 73, 19,
     127, 146, 6, 131, 212, 151, 163, 219, 13, 207,
     62, 48, 192, 222, 226, 220, 84, 210, 64, 53]
X = [212, 58, 243, 98, 10, 45, 48, 50, 62, 98, 231,
     68, 169, 35, 192, 143, 134, 61, 167, 81, 220,
     252, 131, 146, 133, 74, 218, 177, 93, 73, 55,
     177, 239, 209, 72, 170, 186, 170, 146, 110, 115,
     19, 30, 151, 0, 230, 192, 254, 1, 158, 179, 145,
     106, 27, 162, 185, 32, 101, 129, 250, 197, 117,
     21, 74, 46, 86, 172, 21, 16, 173, 79, 164, 235,
     214, 210, 174, 93, 7, 113, 226, 98, 117, 210, 85,
     198, 64, 83, 153, 209, 154, 198, 239, 79, 40, 0,
     184, 33, 217, 210, 38, 233, 55, 106, 27, 165, 87,
     85, 127, 24, 76, 6, 136, 246, 98, 108, 45, 108,
     97, 87, 196, 41, 76, 162, 234, 168, 92, 218, 49,
     158, 55, 191, 186, 197, 241, 31, 158, 88, 75, 167,
     113, 236, 195, 71, 217, 83, 93, 114, 234, 172, 219,
     177, 147, 184, 99, 158, 71, 162, 144, 88, 164, 200,
     254, 56, 131, 67, 174, 186, 148, 202, 151, 47, 155,
     104, 95, 154, 179, 50, 12, 145, 27, 141, 40, 71, 49,
     89, 149, 203, 56, 22, 17, 68, 147, 133, 191, 69, 39,
     77, 220, 68, 42, 30, 67, 96, 142, 174, 168, 99, 93,
     49, 62, 1, 87, 234, 57, 22, 235, 218, 79, 150, 90,
     155, 107, 206, 7, 228, 9, 173, 45, 133, 154, 227, 209,
     172, 14, 69, 157, 109, 245, 248, 41, 210, 13, 127,
     186, 63, 225, 63, 34, 142, 43, 115, 7, 82, 119, 59]

Benchmark.bmbm do |x|
  x.report("loop") do
    total.times { 1 }
  end

  x.report("[].pack('C*')") do
    total.times { [].pack("C*") }
  end

  x.report("[S].pack('C0')") do
    total.times { S.pack("C0") }
  end

  x.report("[S].pack('C')") do
    total.times { S.pack("C") }
  end

  x.report("[S].pack('C1')") do
    total.times { S.pack("C1") }
  end

  x.report("[S].pack('C3')") do
    total.times { S.pack("C3") }
  end

  x.report("[S].pack('C5')") do
    total.times { S.pack("C5") }
  end

  x.report("[S].pack('C1C1C1C1C1')") do
    total.times { S.pack("C1C1C1C1C1") }
  end

  x.report("[S].pack('C*')") do
    total.times { S.pack("C*") }
  end

  x.report("[M].pack('C*')") do
    total.times { M.pack("C*") }
  end

  x.report("[L].pack('C*')") do
    total.times { L.pack("C*") }
  end

  x.report("[X].pack('C*')") do
    total.times { X.pack("C*") }
  end

  # U
  x.report("[S].pack('U')") do
    total.times { S.pack('U') }
  end

  x.report("[M].pack('U')") do
    total.times { M.pack('U') }
  end

  x.report("[L].pack('U')") do
    total.times { L.pack('U') }
  end

  x.report("[S].pack('U10')") do
    total.times { S.pack('U10') }
  end

  x.report("[M].pack('U20')") do
    total.times { M.pack('U20') }
  end

  x.report("[L].pack('U40')") do
    total.times { L.pack('U40') }
  end

  x.report("[S].pack('U*')") do
    total.times { S.pack('U*') }
  end

  x.report("[M].pack('U*')") do
    total.times { M.pack('U*') }
  end

  x.report("[L].pack('U*')") do
    total.times { L.pack('U*') }
  end
end
