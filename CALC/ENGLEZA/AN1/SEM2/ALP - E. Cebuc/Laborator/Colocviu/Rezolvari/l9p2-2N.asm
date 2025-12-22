public suma
cod1 segment para 'code'
assume cs:cod1
suma proc NEAR
	loop1:
		add al,ds:[bx]
		inc bx
		loop loop1
	ret
suma endp
cod1 ends
end