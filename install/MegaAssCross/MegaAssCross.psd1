@{
RootModule = 'MegaAssCross.psm1'
ModuleVersion = '0.3.0'
GUID = '3e7e884c-491e-42d3-93fd-0a72c467f2a0'
Author = 'markusC64'
CompanyName = 'Unknown'
Copyright = '(c) markusC64. All rights reserved.'
Description = 'MegaAssembler-Cross-Assembler: Assembler, Linker, AutoAssembler (Invoke-MegaAssembler) und Disk-Images für das Assemblieren am PC aufbereiten.'
PowerShellVersion = '7.3'
RequiredModules = @("FloppyDiskImageTool")
# Cmdlets in C# (MegaAss.Core, MegaAss.Build und MegaAss.PowerShell in einer DLL); nach FloppyDiskImageTool geladen,
# daher dieselbe CommodoreDiskImageTool.dll.
NestedModules = @("MegaAss.PwSh.dll")
FunctionsToExport = @("Export-MegaAssemblerProject", "ConvertTo-MegaAssemblerFileName", "Get-MegaAssemblerFileName",
                      "Get-MegaAssemblerFileDate")
CmdletsToExport = @("Invoke-MegaAssembler")
VariablesToExport = @()
AliasesToExport = @()
PrivateData = @{
    PSData = @{
    } # End of PSData hashtable
} # End of PrivateData hashtable
}
