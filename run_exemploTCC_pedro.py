import subprocess
import win32com.client as win32

subprocess.call('..\AMPL ' + r'pedro/exemplo_pedro2.run')


with open('pedro/output_exemplo_pedro.txt', 'r') as f:
    with open('pedro/output_exemplo_pedro.xls', 'w') as newf:    
        for line in f:
            newline = line.replace('.',',')
            newf.write(newline)



excel = win32.gencache.EnsureDispatch('Excel.Application')
wb = excel.Workbooks.Open(r'C:\AMPL2\exemplosTCC\pedro\output_exemplo_pedro.xls')
wb.Close()
