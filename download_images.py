import os
import re
import requests
from urllib.parse import urlparse

# 定义要处理的文件扩展名
HTML_FILES = ['index.html', 'history.html', 'tourism.html', 'architecture.html', 'intangible.html']

# 定义图片文件扩展名
IMAGE_EXTENSIONS = ['.png', '.jpg', '.jpeg', '.gif', '.webp']

# 下载图片的函数
def download_image(url, save_path):
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        with open(save_path, 'wb') as f:
            f.write(response.content)
        print(f"下载成功: {url} -> {save_path}")
        return True
    except Exception as e:
        print(f"下载失败: {url}, 错误: {e}")
        return False

# 处理HTML文件的函数
def process_html_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 查找所有图片URL
    pattern = r'https?://[^"\']+\.(png|jpg|jpeg|gif|webp)'
    matches = re.findall(pattern, content)
    
    # 处理每个匹配的URL
    for match in re.finditer(pattern, content):
        url = match.group(0)
        # 提取文件名
        parsed_url = urlparse(url)
        path = parsed_url.path
        filename = os.path.basename(path)
        # 清理文件名中的查询参数
        filename = filename.split('?')[0]
        # 确保文件名唯一
        counter = 1
        original_filename = filename
        while os.path.exists(filename):
            name, ext = os.path.splitext(original_filename)
            filename = f"{name}_{counter}{ext}"
            counter += 1
        # 下载图片
        if download_image(url, filename):
            # 替换HTML中的URL为文件名
            content = content.replace(url, filename)
    
    # 写回文件
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"处理完成: {file_path}")

# 主函数
def main():
    for html_file in HTML_FILES:
        if os.path.exists(html_file):
            process_html_file(html_file)
        else:
            print(f"文件不存在: {html_file}")

if __name__ == "__main__":
    main()
