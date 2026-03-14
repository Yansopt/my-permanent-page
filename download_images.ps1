# 下载图片并替换URL的脚本

# 下载图片函数
function Download-Image {
    param(
        [string]$Url,
        [string]$Filename
    )
    try {
        Invoke-WebRequest -Uri $Url -OutFile $Filename
        Write-Host "下载成功: $Url -> $Filename"
        return $true
    } catch {
        Write-Host "下载失败: $Url, 错误: $($_.Exception.Message)"
        return $false
    }
}

# 替换HTML文件中的URL函数
function Replace-UrlInHtml {
    param(
        [string]$FilePath,
        [string]$OldUrl,
        [string]$NewFilename
    )
    if (Test-Path $FilePath) {
        $content = Get-Content -Path $FilePath -Encoding UTF8 -Raw
        $content = $content -replace [regex]::Escape($OldUrl), $NewFilename
        Set-Content -Path $FilePath -Value $content -Encoding UTF8
        Write-Host "替换完成: $OldUrl -> $NewFilename in $FilePath"
    }
}

# 处理图片1
$url1 = "https://pic1.zhimg.com/70/v2-46486a8fc23ab76762e45a4db09c5d09_1440w.avis?source=172ae18b&biz_tag=Post"
$filename1 = "v2-46486a8fc23ab76762e45a4db09c5d09_1440w.avis"
if (Download-Image -Url $url1 -Filename $filename1) {
    Replace-UrlInHtml -FilePath "tourism.html" -OldUrl $url1 -NewFilename $filename1
}

# 处理图片2
$url2 = "https://bkimg.cdn.bcebos.com/pic/314e251f95cad1c8a786851e2b6e7009c93d70cffbf0?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"
$filename2 = "314e251f95cad1c8a786851e2b6e7009c93d70cffbf0.jpg"
if (Download-Image -Url $url2 -Filename $filename2) {
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url2 -NewFilename $filename2
}

# 处理图片3
$url3 = "https://bkimg.cdn.bcebos.com/pic/77094b36acaf2edda3cc4176ac4916e93901203f35a1?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"
$filename3 = "77094b36acaf2edda3cc4176ac4916e93901203f35a1.jpg"
if (Download-Image -Url $url3 -Filename $filename3) {
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url3 -NewFilename $filename3
}

# 处理图片4
$url4 = "https://ts1.tc.mm.bing.net/th/id/OIP-C.6Xi1aGdazwmt9Zjn-d5wbwAAAA?rs=1&pid=ImgDetMain&o=7&rm=3"
$filename4 = "6Xi1aGdazwmt9Zjn-d5wbwAAAA.png"
if (Download-Image -Url $url4 -Filename $filename4) {
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url4 -NewFilename $filename4
}

# 处理图片5
$url5 = "https://ts2.cn.mm.bing.net/th/id/R-C.8c7f8c7f8c7f8c7f8c7f8c7f8c7f8c7f?rik=R0rsmeM93txhcA&pid=ImgRaw&r=0"
$filename5 = "8c7f8c7f8c7f8c7f8c7f8c7f8c7f8c7f.png"
if (Download-Image -Url $url5 -Filename $filename5) {
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url5 -NewFilename $filename5
}

# 处理图片6
$url6 = "https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=traditional%20Hakka%20village%20map%20of%20Zhixi%2C%20ancient%20streets%20and%20ancestral%20halls%2C%20hand-drawn%20style&image_size=square"
$filename6 = "traditional-hakka-village-map.png"
if (Download-Image -Url $url6 -Filename $filename6) {
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url6 -NewFilename $filename6
}

# 处理图片7
$url7 = "https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=popular%20tourist%20spots%20in%20Zhixi%20village%2C%20ancient%20ancestral%20halls%2C%20traditional%20architecture%2C%20tourists%20visiting&image_size=square"
$filename7 = "popular-tourist-spots.png"
if (Download-Image -Url $url7 -Filename $filename7) {
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url7 -NewFilename $filename7
}

# 处理图片8
$url8 = "https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=ancient%20Hakka%20ancestral%20hall%20in%20Zhixi%20village%2C%20ornate%20wooden%20carvings%2C%20traditional%20architecture%2C%20cultural%20heritage&image_size=square"
$filename8 = "ancient-hakka-ancestral-hall.png"
if (Download-Image -Url $url8 -Filename $filename8) {
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url8 -NewFilename $filename8
}

# 处理图片9
$url9 = "https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=traditional%20Hakka%20houses%20in%20Zhixi%20village%2C%20ancient%20streets%2C%20stone%20paths%2C%20traditional%20architecture&image_size=square"
$filename9 = "traditional-hakka-houses.png"
if (Download-Image -Url $url9 -Filename $filename9) {
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url9 -NewFilename $filename9
}

# 处理图片10
$url10 = "https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=tourism%20services%20in%20Zhixi%20village%2C%20tourists%20visiting%20ancient%20ancestral%20halls%2C%20traditional%20Hakka%20village%20tourism%2C%20scenic%20views&image_size=landscape_16_9"
$filename10 = "tourism-services.png"
if (Download-Image -Url $url10 -Filename $filename10) {
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url10 -NewFilename $filename10
}

# 处理图片11
$url11 = "https://p3-flow-imagex-sign.byteimg.com/tos-cn-i-a9rns2rl98/rc/pc/super_tool/9dc38b0d8cbb4261a00faa4e097879cc~tplv-a9rns2rl98-image.image?lk3s=8e244e95&rcl=20260212123004B7B3FD7F2383C835BCE9&rrcfp=f06b921b&x-expires=1773462667&x-signature=RqfOErcI9e0OCTWadDi%2BFTKM8%2FM%3D"
$filename11 = "9dc38b0d8cbb4261a00faa4e097879cc.png"
if (Download-Image -Url $url11 -Filename $filename11) {
    Replace-UrlInHtml -FilePath "tourism.html" -OldUrl $url11 -NewFilename $filename11
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url11 -NewFilename $filename11
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url11 -NewFilename $filename11
    Replace-UrlInHtml -FilePath "intangible.html" -OldUrl $url11 -NewFilename $filename11
    Replace-UrlInHtml -FilePath "architecture.html" -OldUrl $url11 -NewFilename $filename11
}

# 处理图片12
$url12 = "https://p3-flow-imagex-sign.byteimg.com/tos-cn-i-a9rns2rl98/rc/pc/super_tool/abc5c4852c8242dd82a1e275e9040820~tplv-a9rns2rl98-image.image?lk3s=8e244e95&rcl=20260212123004B7B3FD7F2383C835BCE9&rrcfp=f06b921b&x-expires=1773462667&x-signature=KGR3aUp44rGnJOC1MdjLhMKfLJE%3D"
$filename12 = "abc5c4852c8242dd82a1e275e9040820.png"
if (Download-Image -Url $url12 -Filename $filename12) {
    Replace-UrlInHtml -FilePath "tourism.html" -OldUrl $url12 -NewFilename $filename12
    Replace-UrlInHtml -FilePath "history.html" -OldUrl $url12 -NewFilename $filename12
    Replace-UrlInHtml -FilePath "index.html" -OldUrl $url12 -NewFilename $filename12
    Replace-UrlInHtml -FilePath "intangible.html" -OldUrl $url12 -NewFilename $filename12
    Replace-UrlInHtml -FilePath "architecture.html" -OldUrl $url12 -NewFilename $filename12
}

Write-Host "所有操作完成!"
