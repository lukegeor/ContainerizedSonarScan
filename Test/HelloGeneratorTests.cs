using ContainerizedSonarScanProj;

namespace Test;

public class HelloGeneratorTests
{
    [Fact]
    public void HelloGenertator()
    {
        // Arrange
        var sut = new HelloGenerator();
        var input = "myname";

        // Act
        var response = sut.GenerateHello(input);
        
        // Assert
        Assert.Equal($"Hello {input}", response);
    }
}