using BasicCalculator.ClassCalc;
using System;

namespace BasicCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                DoCalc();
            }
        }

        static void DoCalc()
        {
            string mode = Util.GetInput("Use the [f]unction based backend, the [c]lass based backend, or [e]xit?", new string[] { "f", "c", "e" });
            if (mode == "e")
            {
                Environment.Exit(0);
            }
            string calcType = Util.GetInput("Do [a]dd, [s]ubtract, [m]ultiply, or [d]ivide?", new string[] { "a", "s", "m", "d" });
            double num1 = 0, num2 = 0;
            string inp = null;
            Console.WriteLine("Enter number 1: ");
            while (inp == null)
            {
                inp = Console.ReadLine();
                try
                {
                    num1 = Convert.ToDouble(inp);
                }
                catch (FormatException)
                {
                    inp = null;
                }
            }
            inp = null;
            Console.WriteLine("Enter number 2: ");
            while (inp == null)
            {
                inp = Console.ReadLine();
                try
                {
                    num2 = Convert.ToDouble(inp);
                }
                catch (FormatException)
                {
                    inp = null;
                }
            }
            if (mode == "f")
            {
                Console.WriteLine(FunctionCalc.DoOperation(calcType, num1, num2));
            }
            else
            {
                switch (calcType)
                {
                    case "a":
                        BaseOperation a = new Addition();
                        Console.WriteLine(a.DoOperation(num1, num2));
                        break;
                    case "s":
                        BaseOperation s = new Subtraction();
                        Console.WriteLine(s.DoOperation(num1, num2));
                        break;
                    case "m":
                        BaseOperation m = new Multiplication();
                        Console.WriteLine(m.DoOperation(num1, num2));
                        break;
                    case "d":
                        BaseOperation d = new Division();
                        Console.WriteLine(d.DoOperation(num1, num2));
                        break;
                }
            }
        }
    }
}
