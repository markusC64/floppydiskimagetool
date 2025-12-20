# floppydiskimagetool #

This module provides functions of dealing with Commodore floppy disk images

    
## Example ##
To be done.

## Installation ##
You need powershell 7.3 or newer [https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases "Powershell 7 Download")

### Steps

#### 1. Find the `$PSModulePath`
To find where PowerShell modules are stored, use the following command in your PowerShell terminal:

```powershell
$env:PSModulePath
```

This will output a list of directories that PowerShell uses to search for modules.

#### 2. Copy the Install Folder
Copy the folder containing the PowerShell module to one of the directories listed in `$PSModulePath`. You can copy the module folder manually or via command line. Below are the steps for each operating system.

---

#### Windows

1. **Locate the `$PSModulePath` directories**:
   On Windows, common module locations are:
   - `C:\Program Files\WindowsPowerShell\Modules\`
   - `C:\Users\<YourUsername>\Documents\WindowsPowerShell\Modules\`

2. **Copy the module folder**:
   Copy the module folder "FloppyDiskImageTool" to one of the directories listed above.

3. **Verify the installation**:
   To verify that the module was installed correctly, run the following command in PowerShell:

   ```powershell
   Get-Module -ListAvailable FloppyDiskImageTool
   ```

---

#### macOS

1. **Locate the `$PSModulePath` directories**:
   On macOS, common module locations are:
   - `/usr/local/microsoft/powershell/7/Modules/`
   - `~/.local/share/powershell/Modules/`

2. **Copy the module folder**:
   Copy the module folder "FloppyDiskImageTool" to one of the directories listed above.

3. **Verify the installation**:
   To verify that the module was installed correctly, run the following command in PowerShell:

   ```powershell
   Get-Module -ListAvailable FloppyDiskImageTool
   ```

---

#### Linux

1. **Locate the `$PSModulePath` directories**:
   On Linux, common module locations are:
   - `/usr/local/microsoft/powershell/7/Modules/`
   - `~/.local/share/powershell/Modules/`

2. **Copy the module folder**:
   Copy the module folder "FloppyDiskImageTool" to one of the directories listed above.

3. **Verify the installation**:
   To verify that the module was installed correctly, run the following command in PowerShell:

   ```powershell
   Get-Module -ListAvailable FloppyDiskImageTool
   ```


## Getting more Info


	`Get-Command -Module FloppyDiskImageTool`

	will list you all Commands this module provides.

	`Get-Help Convert-Floppydiskimage -Full`

	will show the documentation for one command, in this case *Convert-Floppydiskimage*
