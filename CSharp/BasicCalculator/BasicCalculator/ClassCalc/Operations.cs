using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCalculator.ClassCalc
{
    class Addition : BaseOperation
    {
        public override double DoOperation(double num1, double num2)
        {
            return num1 + num2;
        }
    }

    class Subtraction : BaseOperation
    {
        public override double DoOperation(double num1, double num2)
        {
            return num1 - num2;
        }
    }

    class Multiplication : BaseOperation
    {
        public override double DoOperation(double num1, double num2)
        {
            return num1 * num2;
        }
    }

    class Division : BaseOperation
    {
        public override double DoOperation(double num1, double num2)
        {
            return num1 / num2;
        }
    }
}
