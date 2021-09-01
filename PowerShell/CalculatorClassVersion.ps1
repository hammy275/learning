class BaseOperation {
    static [double]DoOperation([double]$num1, [double]$num2) {
        throw "Not Implemented.";
    }
}

class Addition : BaseOperation {
    static [double]DoOperation([double]$num1, [double]$num2) {
        return $num1 + $num2;
    }
}

class Subtraction : BaseOperation {
    static [double]DoOperation([double]$num1, [double]$num2) {
        return $num1 - $num2;
    }
}

class Multiplication : BaseOperation {
    static [double]DoOperation([double]$num1, [double]$num2) {
        return $num1 * $num2;
    }
}

class Division : BaseOperation {
    static [double]DoOperation([double]$num1, [double]$num2) {
        return $num1 / $num2;
    }
}

function GetInput-Answers {
    param (
        [string]$Question,
        [string[]]$Answers
    )
    $ans = $null;
    while ($ans -eq $null -or !$Answers.Contains($ans)) {
        $ans = Read-Host $Question;
    }
    return $ans;
}

function GetDouble {
    param (
        [string]$Question
    )
    $isNum = $false;
    $num = "";
    while (!$isNum) {
        $num = Read-Host $Question;
        $num = $num -as [Double];
        $isNum = $num -ne $null;
    }
    return $num;
}

$mode = GetInput-Answers "Would you like to perform [a]ddition, [s]ubtraction, [m]ultiplication, or [d]ivision?" @("a", "s", "m", "d");
$num1 = GetDouble "Enter first number: ";
$num2 = GetDouble "Enter second number: ";
$operationClass = $null;
switch ($mode) {
    "a" {
        $operationClass = [Addition];
        Write-Host $operationClass;
        break;
    }
    "s" {
        $operationClass = [Subtraction];
        break;
    }
    "m" {
        $operationClass = [Multiplication];
        break;
    }
    "d" {
        $operationClass = [Division];
        break;
    }
}

$operationClass::DoOperation($num1, $num2);