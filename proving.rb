class Proving

    attr_reader :v

    def initialize(n, isIntruder)
        @n = n
        @s = getS(n)
        @v = @s.pow(2, n)
        @s = isIntruder ? 0 : @s
    end

    def sendX()
        @r = rand(@n-2)+1
        return @r.pow(2, @n)
    end

    def sendY(e)
        return @r * @s**e % @n
    end

    def getS(n)
        s = rand(n-1) + 1
        return gcd(s, n) == 1 ? s : getS(n)
    end

    def gcd(a, b)
        a, b = b, a % b until b.zero?
        a.abs
    end
end