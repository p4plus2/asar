org $008000

struct test $0000
	.size: skip 2
endstruct

struct test2 extends test
	.lol: skip 3
endstruct

struct test3 extends test
	.lol: skip 5
endstruct

lda test[1].size
;lda test.size
lda test.test2.lol
lda test.test3.lol

print hex(test[1].size)," ",hex(test[2].test2.lol)," "
print hex(test.size)," ",hex(test.test2.lol)," "
print hex(sizeof(test))," ",hex(sizeof(test.test2))," "
print hex(objectsize(test))," ",hex(objectsize(test.test2))," ",hex(objectsize(test.test3))

jmp [$0000]
jmp [test[1].size]


struct sprite $009E
	.number: skip 12
	.yspeed: skip 12
	.xspeed: skip 12
	.state:	 skip 12
		 skip 3+2+2+3  ;get to next table
	.y_pos:  skip 12
	.x_pos:  skip 12
;etc
endstruct


struct DMA $4300
	.control: skip 1
	.destination: skip 1
	.source
		.source_word:
			.source_word_low: skip 1
			.source_word_high: skip 1
		.source_bank: skip 1
	.size:
		.size_low: skip 1
		.size_high: skip 1
endstruct align $10

lda #$0040
sta DMA[2].size

;math round off
db -1
db -2
dd $EEEEEEEE
math round on
db 2*cos(3.1415926535/4)
math round off
db 2*cos(3.1415926535/4)
