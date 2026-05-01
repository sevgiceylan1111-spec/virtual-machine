# Windows 11 VM Setup Script

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -AllowAll -FeatureName Microsoft-Hyper-V -All

# Create a new virtual switch
New-VMSwitch -Name "Virtual Switch" -SwitchType Internal

# Create the VM
New-VM -Name "Windows11_VM" -MemoryStartupBytes 4GB -BootDevice VHD -SwitchName "Virtual Switch" -Generation 2

# Add a IDE Controller
Add-VMIdEController -VMName "Windows11_VM"

# Add a Hard Drive
New-VHD -Path "C:\HyperV\Windows11_VM\Windows11_VM.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName "Windows11_VM" -Path "C:\HyperV\Windows11_VM\Windows11_VM.vhdx"

# Start the VM
Start-VM -Name "Windows11_VM"