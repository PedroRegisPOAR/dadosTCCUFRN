#for e in l:
#	print('(' + str(e[2]) + ', ' + str(e[1]) + ')')

s = """1, 11, 2
2, 10, 3
3, 9, 4
3, 8, 5
5, 7, 6
5, 6, 7
7, 5, 8
5, 4, 9
9, 3, 10
9, 2, 11
11, 1, 12"""

cotas = """67,2	63,8
60,5	67,2
69,5	72,0
77,4	69,5
71,7	67,2
77,4	71,7
77,4	79,0
85,8	77,4
85,8	84,4
97,7	85,8
112,0	97,7"""

cotas = [e.replace(',','.').split('\t') for e in cotas.split('\n')]



l = [e. split(', ') for e in s.split('\n')]

def f(l, i):
	for e in l:
		if str(i) == e[0]: 
			print(i)
			f(l, e[2])
			

#f(l, 1)




def f(l, c, i):
	for e in l:
		if str(i) == e[0]:
			#print(i, e[2]) 
			
			print(i, c[int(e[2])-1])

			f(l, c, e[2])
			
			

#f(l, cotas, 1)


#print(len(l), len(cotas))
"""
for e in l:
	if e[1] == '11':
		print(e[1], cotas[int(e[1])-1][0])
		print(e[1], cotas[int(e[1])-1][1])
	else:
		print(e[1], cotas[int(e[1])-1][1])
"""

# Nó raiz
for e in l:
	if e[0] == '1':
		print(e[0], cotas[int(e[1])-1][0])
		print(e[1], cotas[int(e[1])-1][1])
	else:
		print(e[2], cotas[int(e[1])-1][1])



for line in re.sub("\s\s+", " ", s).split('\n'):
	print(re.sub("\s", ";",line))

	
