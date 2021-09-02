function GetInput([string]$Question, [string[]]$Answers) {
    $ans = $null;
    while ($null -eq $ans -or !$Answers.Contains($ans)) {
        $ans = Read-Host $Question;
    }
    return $ans;
}

function GetDouble([string]$Question) {
    $isNum = $false;
    $num = "";
    while (!$isNum) {
        $num = Read-Host $Question;
        $num = $num -as [Double];
        $isNum = $num -ne $null;
    }
    return $num;
}

$mode = GetInput "Would you like to perform [a]ddition, [s]ubtraction, [m]ultiplication, or [d]ivision?" @("a", "s", "m", "d");
$num1 = GetDouble "Enter first number: ";
$num2 = GetDouble "Enter second number: ";
switch ($mode) {
    "a" {
        Write-Host ($num1 + $num2);
        break;
    }
    "s" {
        Write-Host ($num1 - $num2);
        break;
    }
    "m" {
        Write-Host ($num1 * $num2);
        break;
    }
    "d" {
        Write-Host ($num1 / $num2);
        break;
    }
}

