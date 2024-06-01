workflow Test-Workflow
{
    Parallel
    {
         Get-Process
         Get-Service
    }
}