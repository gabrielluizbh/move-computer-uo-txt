# Script Move os objetos computadores do Active Directory para OU especifica, utilizando um arquivo de texto - Créditos Gabriel Luiz - www.gabrielluiz.com ##


# Especifique o caminho para o arquivo de texto com os nomes de conta do computador (Hostnames).

$computers = Get-Content \\ADDS\movimenta-computer\move-computer.txt


# Especifique o caminho para a UO (Unidade Organizacional) para onde os computadores serão movidos.

$TargetOU = "OU=Computadores,OU=TI,DC=contoso,DC=local"


# Mover computadores para a nova UO (Unidade Organizacional).

ForEach($computer in $computers){
    Get-ADComputer $computer | Move-ADObject -TargetPath $TargetOU
    }

# Observação: A variável $TargetOU que o caminho da OU, no qual você que mover os objetos computadores do Active Directory e o parâmetro DistinguishedName, que você pode obter com o cmdlet Get-ADOrganizationalUnit.


# Referências: 

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adorganizationalunit?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-7

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/move-adobject?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adcomputer?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/foreach-object?view=powershell-7