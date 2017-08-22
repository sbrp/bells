function playbells {
    param (
        [parameter(Mandatory = $true)]
        $bellmethod
    )

    $bellmethod = Get-Content $bellmethod
    $length = 240
    
    $belltone1 = 600
    $belltone2 = 550
    $belltone3 = 500
    $belltone4 = 450
    $belltone5 = 400
    $belltone6 = 370
    $belltone7 = 340
    $belltone8 = 300
    

    foreach ($round in $bellmethod) {
        #Write-Output $round
        $bell = ($round.Split(","))
        Write-Output $bell        
        switch ($bell) {
            1 { [console]::beep($belltone1, $length)}
            2 { [console]::beep($belltone2, $length)}
            3 { [console]::beep($belltone3, $length)}
            4 { [console]::beep($belltone4, $length)}
            5 { [console]::beep($belltone5, $length)}
            6 { [console]::beep($belltone6, $length)}
            7 { [console]::beep($belltone7, $length)}
            8 { [console]::beep($belltone8, $length)}
            Default {$null}
        }
    }
}

$bellmethod = "C:\Users\rob\Google Drive\git\plainhunt.csv"
$bellmethod = "C:\Users\rob\Google Drive\git\testbellmethod.csv"

