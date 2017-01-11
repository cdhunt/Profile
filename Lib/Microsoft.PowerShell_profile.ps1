$ProfileVariables = DATA -supportedCommand Invoke-Generate {
    @{'SessionTitleName' = Invoke-Generate '[Adjective][Noun]'}
    @{'AnsiShaddow' = @'


   ██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ███████╗██╗  ██╗███████╗██╗     ██╗
   ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝██║     ██║
   ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝███████╗███████║█████╗  ██║     ██║
   ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔══██║██╔══╝  ██║     ██║
   ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████║██║  ██║███████╗███████╗███████╗
   ╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

'@}
}

Import-Module Profile

$PlasterTemplate = 'C:\Source\TMGit\Winsys_US\powershell-module-template\ModuleTemplate\'

$PSDefaultParameterValues=@{"*-Module:Repository"="PSGallery"
                            "Invoke-WebRequest:UseBasicParsing"=$true
                            "Invoke-Plaster:TemplatePath"=$PlasterTemplate}
