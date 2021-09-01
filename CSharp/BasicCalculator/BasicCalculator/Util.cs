using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BasicCalculator
{
    class Util
    {
        public static string GetInput(string Question, string[] Answers)
        {
            string answer = null;
            while (answer == null || !Answers.Contains(answer.ToLower())) {
                Console.WriteLine(Question);
                answer = Console.ReadLine();
            }
            return answer;
        }
    }
}
