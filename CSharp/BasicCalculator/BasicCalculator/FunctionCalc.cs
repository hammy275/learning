using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCalculator
{
    class FunctionCalc
    {
        public static double DoOperation(string operation, double num1, double num2)
        {
            switch (operation)
            {
                case "a":
                    return num1 + num2;
                case "s":
                    return num1 - num2;
                case "m":
                    return num1 * num2;
                case "d":
                    return num1 / num2;
                default:
                    throw new ArgumentException("Must provide a valid operation argument!");
            }
        }
    }
}
