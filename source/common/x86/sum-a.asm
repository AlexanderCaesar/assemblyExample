global _sumAssembly  ;全局函数声明，表示这个函数要被外部文件调用，注意下划线，c文件或cpp文件中相应函数去掉下划线
 
_sumAssembly:
 
 push ebp        ;保护ebp指针
 
 mov ebp,esp
 
 mov eax,[ebp+8] ;第一个入口参数int a
 
 mov ebx,[ebp+12];第二个入口参数int b
 
 add eax,ebx

 add eax,#5
 
 pop ebp         ;恢复ebp指针
 
 ret            ;调用者平衡堆栈