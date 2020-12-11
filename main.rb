require_relative 'center.rb'
require_relative 'proving.rb'

lengthN = 1024
center = Center.new(lengthN)
n = center.n

proving = Proving.new(n, true)
v = proving.v
center.reg(v)

z = 20

for j in 1..100 do
    for i in 1..z do
        x = proving.sendX
        e = center.sendBit(x)
        y = proving.sendY(e)
        center.lastCheck(y) ? next : break
    end

    printf "#{i} "
end
