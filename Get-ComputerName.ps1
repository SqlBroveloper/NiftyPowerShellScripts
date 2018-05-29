function Get-ComputerName
{
<#
Returns the computer name based on the UserDomain value in the Environment drive
#>
[string]$EnvName = (Get-PSDrive | 
    Where-Object{$_.Name -Like "*Env*"});
    $EnvName += ":";

    Set-Location $EnvName;

    return (Get-ChildItem |
    Where-Object{$_.Name -eq "UserDomain"}).Value;
}