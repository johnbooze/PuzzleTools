$numToLetterLookup = @{}
$letterToNumLookup = @{}
1..26 | % {
    $c = [char] (64 + $_ )
    $numToLetterLookup.Add($_, $c)
    $letterToNumLookup.Add([string]$c, $_)
}

function EncodeStringToNumbers([string] $str)
{
    $str.GetEnumerator() | % { $letterToNumLookup[ [string]$_ ] }
}

function DecodeNumbersToChars([int[]] $numbers)
{
    $numbers | % { $numToLetterLookup[ $_ ] }
}

function DecodeNumbersToString([int[]] $numbers)
{
    $chars = DecodeNumbersToChars $numbers
    [string]::Join('', $chars)
}

EncodeStringToNumbers 'EXAMPLE'
DecodeNumbersToString @(14,21,13,2,5,18,19,20,15,3,8,1,18,19)
