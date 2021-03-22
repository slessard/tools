Some of the scripts in this repository leverage third party tools that aren't included by default with MacOS or Linux distributions. These tools include:
* super sed
* .NET 5.x
* dotnet-script

You can install these third party tools pretty easily using the following commands.

```bash
brew install ssed
brew install dotnet
dotnet tool install -g dotnet-script
```

After running the installation scripts above be sure to follow the on-screen instructions for adding dotnet-script to your PATH.

You can learn more about these tools at their respective home pages:

**super sed** - http://sed.sourceforge.net/grabbag/ssed/

**.NET** - https://dotnet.microsoft.com/ or https://github.com/dotnet/core

**dotnet-script** - https://github.com/filipw/dotnet-script