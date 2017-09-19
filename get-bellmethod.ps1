function getbellmethod {
    param (
        [parameter(Mandatory = $true)]        
        [string]$bellmethod
    )
    $uri = "http://methods.ringing.org/cgi-bin/simple.pl?name=$bellmethod"
    $xmldoc = Invoke-WebRequest -Uri $uri -Method Get -ContentType "application/xml" -ErrorAction:Stop -TimeoutSec 60
    $methodinfo = ([xml]$xmldoc.Content).methods.method

    


    #pipe returned XML result to out-gridview (allowing single selection only)
    $methodinfo|Out-GridView -OutputMode Single |
        ForEach-Object {
        $methodtitle = $_.title
        $methodnotation = $_.pn.symblock
        $methodstage = $_.stage
        $methodleadhead = $_."lead-head"
    }
    Write-Output $methodtitle, $methodnotation, $methodstage,$methodleadhead
    $Global:methodnotation = $methodnotation
    $Global:methodstage = $methodstage   
}


getbellmethod -bellmethod rutland
methodswitch -placenotation $methodnotation[0] -stage $methodstage