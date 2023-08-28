param($targetDir,$projectDir,$projectName)
Write-Output "targetDir:'$targetDir'"
Write-Output "projectDir:'$projectDir'"
Write-Output "projectName:'$projectName'"

$filesToExclude = @(
"Microsoft.CSharp.dll",
<#
# update array by executing this on the server to ignore all existing files. Remove the , of the last row.
$portalFolder = "C:\Program Files (x86)\WEBCON\WEBCON BPS Portal"
$workflowServiceFolder = "C:\Program Files (x86)\WEBCON\WEBCON BPS WorkFlow Service"
$portalFiles = Get-childitem -Path  "$portalFolder\*.dll"

$commonFiles =New-Object System.Collections.ArrayList
foreach ($portalFile in $portalFiles){
    # 
    #$portalFile = $portalFiles | where {$_.Name -eq "Newtonsoft.Json.dll"} 
    #
    
    if (!(Test-Path "$workflowServiceFolder\$($portalFile.Name)")) {
        continue
    }
    
    $workflowServiceFile = Get-ChildItem -Path "$workflowServiceFolder\$($portalFile.Name)"
    try{
    $portalAssembly = [System.Reflection.AssemblyName]::GetAssemblyName($portalFile)
    $serviceAssembly = [System.Reflection.AssemblyName]::GetAssemblyName($workflowServiceFile)
    if ($portalAssembly.Version -eq  $serviceAssembly.Version) {
        [void]$commonFiles.Add($portalAssembly.FullName)
    }
    }
    catch{
        Write-Host $_
    }
}
$commonFiles  | % {"'$($_)',"} | clip
#>
'Aspose.BarCode, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Aspose.Cells, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Aspose.Email, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Aspose.PDF, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Aspose.Words, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Aspose.Words.Pdf2Word, Version=23.4.0.0, Culture=neutral, PublicKeyToken=716fcc553a201e56',
'Azure.Core, Version=1.25.0.0, Culture=neutral, PublicKeyToken=92742159e12e44c8',
'Azure.Identity, Version=1.7.0.0, Culture=neutral, PublicKeyToken=92742159e12e44c8',
'CommonServiceLocator, Version=2.0.2.0, Culture=neutral, PublicKeyToken=489b6accfaf20ef0',
'CommonServiceLocator.SolrNet, Version=1.0.20.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'DocumentFormat.OpenXml, Version=2.16.0.0, Culture=neutral, PublicKeyToken=8fb06cb64d019a17',
'Google.Protobuf, Version=3.19.4.0, Culture=neutral, PublicKeyToken=a7d26565bac4d604',
'Grpc.Core.Api, Version=2.0.0.0, Culture=neutral, PublicKeyToken=d754f35622e28bad',
'HtmlAgilityPack, Version=1.11.34.0, Culture=neutral, PublicKeyToken=bd319b19eaf3b43a',
'iTextSharp-4.1.6, Version=4.1.6.0, Culture=neutral, PublicKeyToken=8354ae6d2174ddca',
'JetBrains.Annotations, Version=4242.42.42.42, Culture=neutral, PublicKeyToken=1010a0d8d6380325',
'Microsoft.Bcl.AsyncInterfaces, Version=7.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'Microsoft.Exchange.WebServices.NETStandard, Version=2.2.1.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'Microsoft.Extensions.Configuration.Abstractions, Version=7.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60',
'Microsoft.Extensions.FileProviders.Abstractions, Version=7.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60',
'Microsoft.Extensions.Primitives, Version=7.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60',
'Microsoft.Graph.Core, Version=2.0.5.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.Graph, Version=4.11.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.Identity.Client.Extensions.Msal, Version=2.19.3.0, Culture=neutral, PublicKeyToken=0a613f4dd989e8ae',
'Microsoft.IdentityModel.Abstractions, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.JsonWebTokens, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.Logging, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.Protocols, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.Protocols.OpenIdConnect, Version=6.19.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.Protocols.WsTrust, Version=6.8.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.IdentityModel.Tokens, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'Microsoft.SharePoint.Client, Version=16.1.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c',
'Microsoft.SharePoint.Client.Runtime, Version=16.1.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c',
'MyGeneration.dOOdads, Version=8.1.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'Newtonsoft.Json, Version=13.0.0.0, Culture=neutral, PublicKeyToken=30ad4fe6b2a6aeed',
'NodaTime, Version=3.1.6.0, Culture=neutral, PublicKeyToken=4226afe0d9b296d1',
'OpenTelemetry.Api, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Api.ProviderBuilderExtensions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Exporter.Console, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Exporter.Jaeger, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Exporter.OpenTelemetryProtocol, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Instrumentation.EventCounters, Version=1.0.0.2, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Instrumentation.Http, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'OpenTelemetry.Instrumentation.SqlClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7bd6737fe5b67e3c',
'Oracle.ManagedDataAccess, Version=2.0.19.1, Culture=neutral, PublicKeyToken=89b483f429c47342',
'SignLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=ffdaa12fb4cf4a55',
'SkiaSharp, Version=2.88.0.0, Culture=neutral, PublicKeyToken=0738eb9f132ed756',
'SolrNet, Version=1.0.20.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'System.Configuration.ConfigurationManager, Version=6.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.Data.OracleClient, Version=1.0.6.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'System.Data.SqlClient, Version=4.6.1.5, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Diagnostics.DiagnosticSource, Version=7.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.Diagnostics.EventLog, Version=7.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.Drawing.Common, Version=6.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.IdentityModel.Tokens.Jwt, Version=6.24.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35',
'System.Memory.Data, Version=1.0.2.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.Private.ServiceModel, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Runtime.CompilerServices.Unsafe, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Security.AccessControl, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Security.Cryptography.ProtectedData, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Security.Permissions, Version=6.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51',
'System.ServiceModel.Duplex, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.ServiceModel.Federation, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.ServiceModel.Http, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.ServiceModel.NetTcp, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.ServiceModel.Primitives, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.ServiceModel.Security, Version=4.9.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'System.Text.Encoding.CodePages, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a',
'TimeZoneConverter, Version=6.0.1.0, Culture=neutral, PublicKeyToken=e20ab7d0d9479841',
'WebCon.ActiveDirectory.Utils, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'Webcon.DependencyInjection.Abstract, Version=1.0.4.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WEBCON.Exchange.Utils, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Actions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Analytics.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Analytics, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.BPS.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.BpsResources, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.BusinessLogic.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.BusinessLogic.Data.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.BusinessLogic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.CSOM.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Data, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Data.Solr, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Extensions.GDPR, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Model, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.SDK, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.SDK.Internal, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Tools.Abstract, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba',
'WebCon.WorkFlow.Tools, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c30f1f18c194ceba'

)


New-Item "$projectDir\Publish" -ItemType Directory -Force -ErrorAction SilentlyContinue
$filesToAdd= New-Object System.Collections.ArrayList
$defaultFiles = Get-ChildItem -Path  "$TargetDir\$projectName.json", "$TargetDir\*.pdb", "$TargetDir\*.bpspkg"#  -Exclude $filesToExclude
$filesToadd.AddRange($defaultFiles)
$allAssemblies = Get-ChildItem -Path  "$TargetDir\*.dll"
foreach ($assemblyFile in $allAssemblies)
{
    #
    #$assemblyFile = $allAssemblies[0]
    #
    $assemblyName = [System.Reflection.AssemblyName]::GetAssemblyName($assemblyFile.Fullname)
    if ($assemblyName -in $filesToExclude) {
        continue
    }
    [void]$filesToAdd.Add($assemblyFile)
}
Compress-Archive -Path $filesToAdd -DestinationPath "$projectDir\Publish\$projectName.zip" -Force -CompressionLevel:Optimal

$bpspkgFiles = [array] (Get-ChildItem -Path "$projectdir\*.bpspkg" -Recurse )
if ($bpspkgFiles.Count -gt 0) {
    Compress-Archive -Path $bpspkgFiles -DestinationPath "$projectDir\Publish\$projectName.zip" -Update
}

<#
$additionalFiles= [array] (Get-ChildItem -Path "$projectdir\AdditionalAssemblies\*.*" -Recurse )
if ($additionalFiles.Count -gt 0) {
    Compress-Archive -Path $additionalFiles -DestinationPath "$projectDir\Publish\$projectName.zip" -Update
}
#>