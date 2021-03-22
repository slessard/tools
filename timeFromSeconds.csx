#!/usr/bin/env dotnet script

int counter = 0; foreach (string arg in Environment.GetCommandLineArgs()) Console.WriteLine("Environment.GetCommandLineArgs()[{0}] : '{1}'", counter++, arg);

// Initialize the "epoch"
// The "epoch" is 12:00:00 AM UTC, January 1, 1970
//
DateTime epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

TimeSpan nowDiff = (DateTime.UtcNow - epoch);
DateTime currentLocalTime = epoch.AddSeconds(nowDiff.TotalSeconds).ToLocalTime();
DateTime currentUtcTime = epoch.AddSeconds(nowDiff.TotalSeconds).ToUniversalTime();

// System.Console.WriteLine("Current Time 2 (Total Seconds): " + DateTimeOffset.UtcNow.ToUnixTimeSeconds());
// System.Console.WriteLine("Current Time 2 (Total Seconds): " + DateTimeOffset.UtcNow.ToUnixTimeMilliseconds());

System.Console.WriteLine("Current Time (Total Seconds): " + nowDiff.TotalSeconds);
System.Console.WriteLine("Current Local Time: " + currentLocalTime.ToString() + " " + TimeZoneInfo.Local.DisplayName);
System.Console.WriteLine("Current UTC Time: " + currentUtcTime.ToString());

