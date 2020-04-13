using ThArrays
using Test

@testset "Simple TorchScript" begin

    @testset "Run simple method" begin
        script = """
def main(a, b):
    return a + b
"""
        cu = Script.compile(script)

        ta = Tensor(rand(3, 2))
        tb = Tensor(rand(3, 2))
        res = cu[:main](ta, tb)

        @test res == ta + tb
    end
end