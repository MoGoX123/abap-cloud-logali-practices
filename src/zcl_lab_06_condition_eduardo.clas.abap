CLASS zcl_lab_06_condition_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_condition_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. IF / ENDIF
*    Declarar la siguiente variable de tipo “I”:
*       ● LV_CONDITIONAL, asignándole el valor de “7”.
*    Validar si la variable es igual o diferente de “7” utilizando la
*    sentencia “IF/ELSE/ENDIF”. Para ambos casos mostrar en pantalla
*    un mensaje que identifica si es igual o diferente al valor de la
*    variable. Para esta actividad es necesario llamar y asignar
*    nuevamente la variable, una vez con algún otro número.

    out->write( |1. IF / ENDIF| ).

    DATA: lv_conditional TYPE i VALUE 7,
          lv_aux         TYPE i VALUE 9.

    IF lv_conditional = lv_aux.
      out->write( |La variable aux es igual a: { lv_conditional }| ).
    ELSE.
      out->write( |La variable aux es distinto a: { lv_conditional }| ).
    ENDIF.

*    2. CASE / ENDCASE
*    Declarar la siguiente variable del tipo “STRING”:
*       ● LV_STRING,
*    Validar la variable utilizando la sentencia “CASE/ENDCASE”. en 3
*    escenarios:
*        -  Para el valor “LOGALI” muestra en pantalla el valor
*           “Academy”.
*        -  Para el valor “SAP” muestra en pantalla el valor “Enterprise
*           software”.
*        -  Para cualquier otro valor distinto a los dos primeros, muestra
*           en pantalla el valor “Unknown”.
*    Es necesario realizar varias asignaciones a la variable para validar
*    cada uno de los posibles escenarios y mostrar el resultado por
*    consola. Para este caso una opción es crear una subrutina con la
*    sentencia “FORM” en la cual dependiendo de la entrada devuelva la
*    cadena de caracteres correspondiente.

    out->write( | | ).
    out->write( |2. CASE / ENDCASE| ).

    DATA: lv_string TYPE string VALUE 'LOGALI'.

    out->write( lv_string ).

    CASE lv_string.

      WHEN 'LOGALI'.
        out->write( |Academy| ).

      WHEN 'SAP'.
        out->write( |Enterprise software| ).

      WHEN OTHERS.
        out->write( |Unknown| ).

    ENDCASE.

*    3. DO / ENDDO
*    Declarar la siguiente variable del tipo “I”:
*       ● LV_COUNTER.
*    Realizar 10 iteraciones utilizando la sentencia “DO” y la condición
*    “10 TIMES” y mostrar el valor de la variable “LV_COUNTER” que va
*    aumentando su valor en “1” en cada iteración.

    out->write( | | ).
    out->write( |3. DO / ENDDO| ).

    DATA: lv_counter TYPE i VALUE 0.

    DO 10 TIMES.

      lv_counter += 1.
      out->write( lv_counter ).

    ENDDO.

*    4. CHECK
*    Repetir el bucle anterior liberando o inicializando a cero la variable
*    “LV_COUNTER” pero terminando el ciclo en la séptima vuelta. Por
*    último, devolver el valor de la variable en cada iteración.

    out->write( | | ).
    out->write( |4. CHECK| ).

    lv_counter = 0.

    DO 10 TIMES.

      lv_counter += 1.
      out->write( lv_counter ).

      CHECK lv_counter = 7.
      EXIT.

    ENDDO.

*    5. SWITCH
*    Declarar la siguiente variable del tipo “STRING”:
*       ● LV_STRING_2,
*    Validar la variable utilizando la sentencia “SWITCH. en 3 escenarios:
*       - Para el valor “LOGALI” muestra en pantalla el valor “SAP Academy”.
*       - Para el valor “SAP” muestra en pantalla el valor “Enterprise software”.
*       - Para el valor “MOVISTAR” muestra en pantalla el valor “Telephony”
*       - Para cualquier otro valor distinto a los dos primeros, muestra
*         en pantalla el valor “Unknown”.
*    Es necesario realizar varias asignaciones a la variable para validar
*    cada uno de los posibles escenarios y mostrar el resultado por
*    consola. Para este caso una opción es crear un método en el cual
*    dependiendo de la entrada devuelva la cadena de caracteres
*    correspondiente.

    out->write( | | ).
    out->write( |5. SWITCH| ).

    DO 4 TIMES.

      lv_string = SWITCH #( sy-index
      WHEN 1 THEN |LOGALI|
      WHEN 2 THEN |SAP|
      WHEN 3 THEN |MOVISTAR|
      ELSE |Otro| ).

      DATA(lv_string_2) = SWITCH #( lv_string
                                      WHEN 'LOGALI' THEN |SAP Academy|
                                      WHEN 'SAP' THEN |Enterprise software|
                                      WHEN 'MOVISTAR' THEN |Telephony|
                                      ELSE |Unknown| ).

      out->write( |Time { sy-index }: { lv_string } { lv_string_2 }| ).
    ENDDO.

    out->write( | | ).
    out->write( |6. COND| ).

    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).
*    DATA(lv_time) = CONV t( '135020' ).

    out->write( |Tiempo antes de formatear: { lv_time }| ).

    DATA(lv_time_formatted) = COND string(
        WHEN lv_time < '120000'
            THEN |{ lv_time TIME = ISO } AM|

        WHEN lv_time > '120000'
            THEN |{ CONV t( lv_time - 12 * 3600 ) TIME = ISO } PM|

        WHEN lv_time = '120000'
            THEN |{ lv_time TIME = ISO } High Noon|

        ELSE |Tiempo desconocido|
    ).

    out->write( |Tiempo: { lv_time_formatted }| ).

*    7. WHILE / ENDWHILE
*    Declarar la variable del tipo “I”:
*       ● LV_COUNTER_2.
*    Realizar un bucle con la condición “WHILE”, con la condición que la
*    primera variable sea menor que “20”, incremente el valor de la
*    variable en cada ciclo y mostrar el valor en pantalla. Luego sin
*    utilizar la sentencia “EXIT” implementa la lógica del código para que
*    muestre en pantalla el valor de la variable hasta que el valor sea
*    igual a “10”.

    out->write( | | ).
    out->write( |7. WHILE / ENDWHILE| ).

    DATA: lv_counter_2 TYPE i.

    lv_counter_2 = 0.

    WHILE lv_counter_2 < 20.

      lv_counter_2 += 1.
      IF lv_counter_2 <= 10.
        out->write( lv_counter_2 ).
      ENDIF.

    ENDWHILE.

*    8. LOOP / ENDLOOP
*    Declarar una tabla interna estándar y una estructura (Opcional) del
*    tipo de la tabla transparente “ZEMP_LOGALI”:
*        ● LT_EMPLOYEES.
*        ● LS_EMPLOYEES.
*    Realizar una consulta a la tabla “ZEMPL_LOGALI” y guardar todos sus
*    registros en la tabla interna declarada. Luego, ejecutar un ciclo
*    “LOOP” sobre dicha tabla para iterar únicamente los registros cuyo
*    campo “APE2” coincida con “JIMENEZ”, utilizando la condición
*    “WHERE”. Finalmente, mostrar una lista de los correos electrónicos
*    asociados en el campo “EMAIL”.

***** No existe la tabla ZEMP_LOGALI asi que use la tabla ZEMPL_LOGALI *****

    out->write( | | ).
    out->write( |8. LOOP / ENDLOOP| ).

    DATA: lt_employees TYPE STANDARD TABLE OF zempl_logali,
          ls_employees TYPE zempl_logali.

    SELECT *
      FROM zempl_logali
      INTO TABLE @lt_employees.

    LOOP AT lt_employees INTO ls_employees
         WHERE e_name = 'Edwin Vargas'.

      out->write( ls_employees-email ).

    ENDLOOP.

*    9. TRY / ENDTRY
*    Declarar la siguiente variable del tipo “F”:
*       ● LV_EXCEPTION, asignándole el valor de “5”.
*    Realizar un bucle “DO” de 5 iteraciones asignándole el valor de “5” a
*    la variable “LV_COUNTER” donde en cada iteración se reste en “1”
*    el valor de dicha variable y se divida el valor de la variable
*    “LV_EXCEPTION” con el de la variable “LV_COUNTER” que está
*    cambiando en cada ciclo. Por último, capturar la excepción
*    “CX_SY_ZERODIVIDE”.

    out->write( | | ).
    out->write( |9. TRY / ENDTRY| ).

    DATA: lv_exception     TYPE f VALUE 5,
          lv_Aux_EXCEPTION TYPE f.

    lv_counter = 5.

    TRY.

        DO 5 TIMES.

          lv_Aux_EXCEPTION = lv_exception.
          lv_counter -= 1.

          lv_exception = lv_exception / lv_counter.

          out->write( |{ lv_Aux_EXCEPTION }/{ lv_counter } = { lv_exception }| ).

        ENDDO.

      CATCH cx_sy_zerodivide INTO DATA(lv_error).
        out->write( |Error division por cero| ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
