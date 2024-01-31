namespace ContainerizedSonarScanProj;

public static class Program
{
    public static void Main(string[] args)
    {
        var helloGenerator = new HelloGenerator();
        Console.WriteLine(helloGenerator.GenerateHello("Luke"));
    }
}