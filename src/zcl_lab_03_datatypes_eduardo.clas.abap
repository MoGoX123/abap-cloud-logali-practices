CLASS zcl_lab_03_datatypes_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. Conversiones de Tipo
*    Declarar las siguientes variables:
*        ● MV_CHAR, del tipo “C” con una longitud de “10” con un valor de “12345”.
*        ● MV_NUM, del tipo “I”.
*        ● MV_FLOAT, del tipo “F”.
*    Convierte el valor de MV_CHAR a un número entero y luego a un
*    número de punto flotante.


    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345',
          mv_num   TYPE i,
          mv_float TYPE f.

    mv_num = mv_char.
    mv_float = mv_num.

    out->write( |1. Conversiones de Tipo| ).
    out->write( |mv_num: { mv_num }| ).
    out->write( |mv_float: { mv_float }| ).


*    2. Truncamiento y Redondeo
*    Declarar las siguientes variables del tipo “I”:
*        ● MV_TRUNC,
*        ● MV_ROUND.
*    Reutilizar la variable MV_FLOAT, asignando el valor decimal
*    “123.45” trunca el valor en la primera variable y redondea el valor
*    en la segunda variable sumándole el valor “0,5” de esta actividad, y
*    muestra ambos resultados.

    mv_float = '123.45'.

    DATA: mv_trunc TYPE i,
          mv_round TYPE i.

    mv_trunc = mv_float.
    mv_float += '0.5'.
    mv_round = mv_float.

    out->write( | | ).
    out->write( |2. Truncamiento y Redondeo| ).
    out->write( |mv_trunc: { mv_trunc }| ).
    out->write( |mv_round: { mv_round }| ).

*    3. Tipos en declaraciones en línea
*    Declarar una variable en línea con el valor “ABAP”

    DATA(mv_abap) = 'ABAP'.

    out->write( | | ).
    out->write( |3. Tipos en declaraciones en línea| ).
    out->write( |mv_abap: { mv_abap }| ).

*    4. Conversiones del Tipo Forzado
*    Reutilizar las variables MV_CHAR y MV_NUM para convertir
*    forzadamente el valor de la primera variable que se encuentra en
*    caracteres a número y muestra el resultado

    DATA(mv_num2) = CONV i( mv_char ).

    out->write( | | ).
    out->write( |4. Conversiones del Tipo Forzado| ).
    out->write( |MV_CHAR: { mv_char }| ).
    out->write( |mv_num2: { mv_num2 }| ).

*    5. Cálculo de Fecha y Hora
*    Declarar las siguientes variables:
*        ● MV_DATE_1, del tipo “D”.
*        ● MV_DATE_2, del tipo “D”.
*        ● MV_DAYS, del tipo “I”.
*        ● MV_TIME, del tipo “T”.
*    Obtener el número de días entre la primera variable y la segunda,
*    mostrar el resultado en la tercera. Además de mostrar en consola
*    con el formato de “DDMMAAAA” el valor de la primera variable.

    DATA: mv_date_1 TYPE d,
          mv_date_2 TYPE d,
          mv_days   TYPE i,
          mv_time   TYPE t.

    mv_date_1 = '20260101'.
    mv_date_2 = cl_abap_context_info=>get_system_date(  ).

    mv_days = mv_date_2 - mv_date_1.

    DATA(mv_dia) = mv_date_1+6(2).
    DATA(mv_mes) = mv_date_1+4(2).
    DATA(mv_anio) = mv_date_1(4).

    out->write( | | ).
    out->write( |5. Cálculo de Fecha y Hora| ).
    out->write( |{ mv_date_2 DATE = USER } - { mv_date_1 DATE = USER } = { mv_days }| ).
    out->write( |{ mv_dia }/{ mv_mes }/{ mv_anio }| ).


*    6. Campos Timestamp
*    Declarar la variable:
*       ● MV_TIMESTAMP, del tipo “UTCLONG”.
*    Obtener la fecha actual con la función “UTCLONG_CURRENT()”.
*    Luego obtener la fecha del sistema pasar la fecha y hora a 2
*    variables reutilizar las variables MV_DATE_2 y MV_TIME. Por
*    último, restar 2 días a la primera variable.

    DATA mv_timestamp TYPE utclong.

    mv_timestamp = utclong_current( ).

    out->write( | | ).
    out->write( |6. Campos Timestamp| ).
    out->write( |mv_timestamp: { mv_timestamp } | ).


    mv_date_2 = cl_abap_context_info=>get_system_date( ).
    out->write( |mv_date_2: { mv_date_2 DATE = USER } | ).

    mv_time = cl_abap_context_info=>get_system_time(  ).

    DATA(mv_hora)    = mv_time+0(2).
    DATA(mv_minuto)  = mv_time+2(2).
    DATA(mv_segundo) = mv_time+4(2).

    out->write( |mv_time: { mv_hora }:{ mv_minuto }:{ mv_segundo }| ).

    mv_timestamp = utclong_add( val = mv_timestamp days = -2 ).
    out->write( |mv_timestamp: { mv_timestamp } | ).


  ENDMETHOD.

ENDCLASS.
