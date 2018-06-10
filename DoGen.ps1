function dogen {
    param(
        [Parameter(Mandatory)]    
        $name
    )


$fileName  = ($name -split '-' | % {$_.substring(0,1).toupper()+$_.substring(1)}) -join ''

pushd
md $name
cd $name

md __test__
pushd
cd __test__
"" | set-content "$($filename).tests.ps1"
popd
"" | set-content "README.md"
"" | set-content "$($filename).ps1"

}

#dogen knuth-morris-pratt