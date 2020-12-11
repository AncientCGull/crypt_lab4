class Center

    attr_reader :n

    def initialize(lengthN)
        @pp = getPrimeBase(lengthN/10)
        @qq = getPrimeBase(lengthN/10*9)
        @n = @pp * @qq
    end

    def reg(v)
        @v = v
    end

    def sendBit(x)
        @x = x
        @e = rand(2)
        return @e
    end

    def lastCheck(y)
        return y == 0 ? false : y.pow(2, @n) == @x * @v**@e % @n
    end

    def isPrimeLog(x)
        seed = Random.new_seed
        for i in 0..100
            a = (rand(seed) % (x - 2)) + 2
            if gcd(a, x) != 1
                return false
            end
            if (a.pow(x-1, x) != 1)
                return false
            end
        end
        return true
    end
    
    def getPrimeBase(bits)
        prime = rand(2**(bits-1)..2**bits-1)
        if prime % 2 == 0
            prime += 1
        end
        while (not isPrimeLog(prime))
            prime += 2
            if (prime > 2**bits-1)
                return getPrimeBase(bits)
            end
        end
        return prime
    end
    
    def gcd(a, b)
        a, b = b, a % b until b.zero?
        a.abs
    end
end