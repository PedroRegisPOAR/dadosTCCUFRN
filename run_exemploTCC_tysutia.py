import subprocess
import win32com.client as win32

subprocess.call('..\AMPL ' + r'tysutia/exemplo_tysutia.run')


with open('tysutia/output_exemplo_tysutia.txt', 'r') as f:
    with open('tysutia/output_exemplo_tysutia.xls', 'w') as newf:    
        for line in f:
            newline = line.replace('.',',')
            newf.write(newline)



excel = win32.gencache.EnsureDispatch('Excel.Application')
wb = excel.Workbooks.Open(r'C:\AMPL2\exemplosTCC\tysutia\output_exemplo_tysutia.xls')
wb.Close()
