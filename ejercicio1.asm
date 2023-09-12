.data
	num1: .asciiz "Introduce un entero: "
	num2: .asciiz "Introduce segundo un entero: "
	num3: .asciiz "Introduce tercer un entero: "
	msg1: .asciiz "El primer numero es mayor!"
	msg2: .asciiz "El segundo numero es mayor!"
	msg3: .asciiz "El tercer numero es mayor!"
.text
main: 
	li $v0, 4 # código de imprimir cadena
	la $a0, num1 # dirección de la cadena
	syscall 
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t0, $v0
	li $v0, 4 # código de imprimir cadena
	la $a0, num2 # dirección de la cadena
	syscall 
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t1, $v0
	li $v0, 4 # código de imprimir cadena
	la $a0, num3 # dirección de la cadena
	syscall 
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t2, $v0
	bge  $t0,$t1,mayorNum1
	j mayorNum2
mayorNum1:
	bge  $t0,$t2,mayorNum1Result
	j mayorNum3
mayorNum2:
	bge  $t1,$t2,mayorNum2Result
	j mayorNum3
mayorNum1Result: 
	li $v0,4
	la $a0, msg1
	syscall 
	li $v0, 1
	move $a0, $t0
	syscall
	j fin
mayorNum2Result:
	li $v0,4
	la $a0, msg2
	syscall 
	li $v0, 1
	move $a0, $t1
	syscall 
	j fin
mayorNum3:
	li $v0,4
	la $a0, msg3
	syscall 
	li $v0, 1
	move $a0, $t2
	syscall 
fin:
	li $v0, 10
	syscall 
