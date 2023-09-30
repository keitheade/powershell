## Enter the outpupt txt file for the sigcheck
$sig_filename = .\acsc-sigs.txt
$raw_sig = Get-Content $sig_filename

$data = @()

## loops through the file in groups of 10 lines
for ($i=0; $i -lt $raw_sig.Count;$i+=10)
{
    $s_file = [PSCustomObject]@{
      "Name"             = $raw_sig[$i]
      "Verified"         = ($raw_sig[$i+1]).Split(":",2)[1].trim()
      "Link date"        = ($raw_sig[$i+2]).trim().Split(":",2)[1].trim()
      "Publisher"        = ($raw_sig[$i+3]).trim().Split(":",2)[1].trim()
      "Company"          = ((($raw_sig[$i+4]).trim()) -split "Company")[1].trim()
	    "Description"      = ($raw_sig[$i+5]).trim().Split(":",2)[1].trim()
	    "Product"          = ($raw_sig[$i+6]).trim().Split(":",2)[1].trim()
	    "Product Version"  = ($raw_sig[$i+7]).trim().Split(":",2)[1].trim()
	    "File Version"     = ($raw_sig[$i+8]).trim().Split(":",2)[1].trim()
	    "Machine Type"     = ($raw_sig[$i+9]).trim().Split(":",2)[1].trim()
    }
    $data += $s_file
    
}

$date | out-gridview
