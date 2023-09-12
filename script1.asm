.data
    numero1: .word 1
    numero2: .word 3
    numero3: .word 2
    mensaje: .asciiz "El número mayor es: "

.text
    main:
        # Cargar los números en registros
        lw $t0, numero1
        lw $t1, numero2
        lw $t2, numero3

        # Comparar $t0 y $t1
        bgt $t0, $t1, comparar_1_3
        move $t3, $t1  # Si $t0 <= $t1, $t1 es el mayor
        j imprimir_mayor

comparar_1_3:
        # Comparar $t0 y $t2
        bgt $t0, $t2, comparar_2_3
        move $t3, $t2  # Si $t0 <= $t2, $t2 es el mayor
        j imprimir_mayor

comparar_2_3:
        # En este punto, sabemos que $t0 es el mayor
        move $t3, $t0

imprimir_mayor:
        # Imprimir el número mayor
        li $v0, 4
        la $a0, mensaje
        syscall

        # Imprimir el valor de $t3 (el número mayor)
        li $v0, 1
        move $a0, $t3
        syscall

        # Terminar el programa
        li $v0, 10
        syscall
