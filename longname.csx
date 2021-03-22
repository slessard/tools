#!/usr/bin/env dotnet script

//
// Outputs the fully qualified path name of Args[0]
// 
// This is more or less the same tool as the getAbsolutePath script in this
// same repository, but this one is in C# because why not?
//

using System;
using System.IO;

FileInfo fi = new FileInfo(Args[0]);
Console.WriteLine(fi.FullName);

