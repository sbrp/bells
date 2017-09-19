function methodswitch {
    param (
        #$placenotation = "-38-14-58-16-14-18.34.12-18"
        #$stage = "8"

        [parameter(Mandatory = $true)]
        $placenotation,

        [parameter(Mandatory = $true)]
        $stage
    )


    #$placenotation = "-38-14-58-16-14-18.34.12-18"
    #$stage = "8"

    #set a variable for testing to say a particular pair of bells don't move....
    #$stay = @(1, 2)
    $toswitch = [ordered]@{}

    #set up the hash table containing bell name(bellX) and place(value)
    $bells = [ordered]@{}
    foreach ($i in 1..$stage) {
        $val = ("bell" + [int]$i)
        $bells.add($val, $i)
    }

    #sort the hash table by name initially
    $bells = $bells.GetEnumerator() | Sort-Object value
    playbells -bells $bells.name
    Start-Sleep -Milliseconds 45
    playbells -bells $bells.name
    Start-Sleep -Milliseconds 45

    $stay = @()
    #$placenotation.Split()
    $i = 0
    do {
    
        if ($placenotation[$i] -eq "-") {
            $stay = @()
            $i++
        }
        elseif ($placenotation[$i] -eq ".") {
            $i++
            $stay += $placenotation[$i]
            $i++
            $stay += $placenotation[$i]
            $i++
        }
        else {
            $stay += $placenotation[$i]
            $i++
            $stay += $placenotation[$i]
            $i++
        }
    
        foreach ($b in 0.. ($stage - 1)) {
            if ($stay -contains [string]$bells[$b].Value) {
            }
            else {
                $toswitch.Add($bells[$b].Name, $bells[$b].Value)
            }
            #Write-Output "current bell place value is" $bells[$b].Value
            if ($toswitch.Values.Count -eq 2) {
                $bells |ForEach-Object {
                    if ($toswitch[0] -eq $_.Value) {
                        $_.Value = $toswitch[1]
                    }
                    elseif ($toswitch[1] -eq $_.Value) {
                        $_.Value = $toswitch[0]
                    }

                }
                $bells = $bells.GetEnumerator() | Sort-Object value        
                #Write-Output $bells
                $toswitch.Clear()
            }
        }
        $stay = @()
        Write-Output $bells
        playbells -bells $bells.name
        Start-Sleep -Milliseconds 45
    } until ($placenotation[$i] -eq $null)
}