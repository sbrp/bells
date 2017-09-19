function playbells {
    param (
        [parameter(Mandatory = $true)]
        $bells
    )

    $length = 240
    
    $belltone1 = 600
    $belltone2 = 550
    $belltone3 = 500
    $belltone4 = 450
    $belltone5 = 400
    $belltone6 = 370
    $belltone7 = 340
    $belltone8 = 300
    $belltone9 = 280
    $belltone10 = 250
    <#
    $belltone11 = 300
    $belltone12 = 300
    $belltone13 = 300
    $belltone14 = 300
    #>
    
    

    foreach ($bell in $bells) {
        #Write-Output $round
        #$bell = ($round.Split(","))
        #Write-Output $bell        
        switch ($bell) {
            bell1 { [console]::beep($belltone1, $length)}
            bell2 { [console]::beep($belltone2, $length)}
            bell3 { [console]::beep($belltone3, $length)}
            bell4 { [console]::beep($belltone4, $length)}
            bell5 { [console]::beep($belltone5, $length)}
            bell6 { [console]::beep($belltone6, $length)}
            bell7 { [console]::beep($belltone7, $length)}
            bell8 { [console]::beep($belltone8, $length)}
            bell9 { [console]::beep($belltone9, $length)}
            bell10 { [console]::beep($belltone10, $length)}
            bell11 { [console]::beep($belltone11, $length)}
            bell12 { [console]::beep($belltone12, $length)}
            bell13 { [console]::beep($belltone13, $length)}
            bell14 { [console]::beep($belltone14, $length)}
            
            Default {$null}
        }
    }
}