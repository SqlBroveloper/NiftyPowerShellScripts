function Get-ComputerName
{
<################################################################################
Returns the computer name based on the UserDomain value in the Environment drive
################################################################################>
    [string]$EnvName = (Get-PSDrive | 
    Where-Object{$_.Name -Like "*Env*"});
    $EnvName += ":";

    If(Test-Path $EnvName)
    {
        Set-Location $EnvName;
        Return (Get-ChildItem |
        Where-Object{$_.Name -eq "UserDomain"}).Value;
    }
    Else
    {
        Write-Host "The environment/drive name is invalid."
    }
}