$SessionTitleName = Invoke-Generate '[Adjective][Noun]'

$ProfileVariables = DATA -supportedCommand Invoke-Generate {
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

$PSDefaultParameterValues=@{"*-Module:Repository" = "PSGallery"
                            "Invoke-WebRequest:UseBasicParsing" = $true
                            "Invoke-Plaster:TemplatePath" = $PlasterTemplate
                            "Out-Default:OutVariable" = "___"
                            }

