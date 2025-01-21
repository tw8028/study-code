window.downloadFile = function (fileName, byteBase64) {
    // 创建一个隐藏的 <a> 标签
    const link = document.createElement('a');
    link.href = 'data:application/octet-stream;base64,' + byteBase64;
    link.download = fileName;
    document.body.appendChild(link);
    link.click(); // 触发下载
    document.body.removeChild(link); // 移除 <a> 标签
};