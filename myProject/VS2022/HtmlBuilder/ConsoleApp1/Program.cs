using Python.Runtime;


// 初始化 Python 引擎
Runtime.PythonDLL = "Python312";

PythonEngine.Initialize();

// Console.WriteLine("path: " + PythonEngine.PythonPath);


using (Py.GIL())
{
    // 导入自定义模块
    dynamic pyChat = PyModule.Import("PyChat");
    
    // 使用模块中的函数或对象
    Console.WriteLine(pyChat.chat_with_seek());
}
 