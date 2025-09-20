Get-Content packages-selective.txt | %{ apt install -y $_ }

Get-Content packages-github.txt | %{ Invoke-RestMethod -Uri $_ } | %{ $_.assets.browser_download_url -match '\.AppImage\Z' } | %{ wget -cnd $_ }

<#
Get-Content packages-html_pages.txt |
	%{ Invoke-WebRequest -Uri $_ } |
	%{ $_.Links } |
	Select-Object href |
	%{
		if ($_.href -match 'Debian.+?amd64' -or $_.href -match '\.deb\Z') {
			wget -cnd $_.href;
			break;
		}
	}
#>

