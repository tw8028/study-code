// wwwroot/fileDownload.js
window.downloadFile = function (fileName, content) {
    // Create a Blob from the content
    const blob = new Blob([content], {type: 'application/octet-stream'});

    // Create a hidden <a> tag
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = fileName;
    document.body.appendChild(link);

    // Trigger the download
    link.click();

    // Clean up
    document.body.removeChild(link);
    URL.revokeObjectURL(link.href);
};