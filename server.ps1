$port = 8000
$docRoot = "c:\Users\Aluno\Documents\quiz feira"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Servidor HTTP iniciado em http://localhost:$port/" -ForegroundColor Green

while ($true) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    $filePath = Join-Path $docRoot $request.Url.LocalPath.TrimStart('/')
    
    if ([string]::IsNullOrWhiteSpace($request.Url.LocalPath) -or $request.Url.LocalPath -eq '/') {
        $filePath = Join-Path $docRoot "Untitled-1.html"
    }
    
    if (Test-Path $filePath -PathType Leaf) {
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $response.ContentType = if ($filePath -match "\.html$") { "text/html; charset=utf-8" } else { "application/octet-stream" }
        $response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $response.StatusCode = 404
        $response.OutputStream.Write([System.Text.Encoding]::UTF8.GetBytes("404 Not Found"), 0, 14)
    }
    
    $response.Close()
}
