#!/usr/bin/env dotnet script

//
// Outputs the fully qualified path name of Args[0]
//

using System;
using System.IO;

FileInfo fi = new FileInfo(Args[0]);
Console.WriteLine(fi.FullName);

