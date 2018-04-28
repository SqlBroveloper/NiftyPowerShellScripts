function Get-Scripts(
<####################################################################
Author: Alex Fleming
Created On: 04/28/2018
Description: Returns all script files based on the directoy, and search criteria.
Recursion is optional.  The maximum number of files returned must not exceed 50.
####################################################################>
    [string]$Directory, 
    [string]$Criteria,
    [int16]$RecursionFlag
    )
{
    Set-Location $Directory;
    #Add a switch to turn recurision on/off
    $Result = 
    If($RecursionFlag -eq 1)
    {
        Get-ChildItem -Recurse |
        Where-Object{
            $_.Name -like "*$Criteria*"
        }
    }
    ElseIf ($RecursionFlag -eq 0)
    {
        Get-ChildItem |
        Where-Object{
            $_.Name -like "*$Criteria*" -and 
            $_.Length -gt 1
        }
    }
    #CountCheck
    If($Result.Count -le 50)
    {
    Return $Result;
    }
    Else
    {
        Write-Host("The number of scripts found exceeded 50; 
            please refine your search criteria and try again.");
    }
}

