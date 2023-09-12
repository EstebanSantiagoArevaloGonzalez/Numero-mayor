.data
    numero1: .word 1
    numero2: .word 3
    numero3: .word 9
    mensaje: .asciiz "El número menor es: "

.text
    main:
        # Cargar los números en registros
        lw $t0, numero1
        lw $t1, numero2
        lw $t2, numero3

        # Inicializar $t3 con el valor máximo posible (0xFFFFFFFF)
        li $t3, -1

        # Comparar $t0 y $t1
        blt $t0, $t1, comparar_1_3
        move $t3, $t1  # Si $t0 >= $t1, $t1 es el menor
        j imprimir_menor

comparar_1_3:
        # Comparar $t0 y $t2
        blt $t0, $t2, comparar_2_3
        move $t3, $t2  # Si $t0 >= $t2, $t2 es el menor
        j imprimir_menor

comparar_2_3:
        # En este punto, sabemos que $t0 es el menor
        move $t3, $t0

imprimir_menor:
        # Imprimir el mensaje "El número menor es: "
        li $v0, 4
        la $a0, mensaje
        syscall

        # Imprimir el valor de $t3 (el número menor)
        li $v0, 1
        move $a0, $t3
        syscall

        # Terminar el programa
        li $v0, 10
        syscall
