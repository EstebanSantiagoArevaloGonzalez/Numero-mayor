.data
    N: .word 10       # Cambia N al número de términos que deseas mostrar
    mensaje: .asciiz "Serie Fibonacci: "
    espacio: .asciiz " "

.text
    main:
        # Cargar N desde memoria
        lw $t0, N

        # Verificar si N es menor o igual a 0
        blez $t0, terminar_programa

        # Inicializar los primeros dos términos de la serie Fibonacci
        li $t1, 0   # Término n-2
        li $t2, 1   # Término n-1

        # Imprimir el mensaje inicial
        li $v0, 4
        la $a0, mensaje
        syscall

        # Imprimir los primeros N términos de la serie Fibonacci
        loop:
            # Imprimir el valor actual (término n)
            li $v0, 1
            move $a0, $t2
            syscall

            # Imprimir espacio
            li $v0, 4
            la $a0, espacio
            syscall

            # Calcular el siguiente término (término n+1)
            add $t3, $t1, $t2

            # Actualizar los términos n-2 y n-1 para la próxima iteración
            move $t1, $t2
            move $t2, $t3

            # Decrementar N y continuar el bucle si N > 0
            subi $t0, $t0, 1
            bnez $t0, loop

        # Terminar el programa
        terminar_programa:
            li $v0, 10
            syscall
