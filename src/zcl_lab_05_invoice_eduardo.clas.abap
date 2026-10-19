CLASS zcl_lab_05_invoice_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. Concatenación
*    Declarar las siguientes variables:
*        ● MV_EXERCISE de tipo “N” con una longitud de “4”.
*        ● MV_INVOICE_NO de tipo “N” con una longitud de “8”.
*        ● MV_INVOICE_CODE de tipo “STRING”.
*    Asignar valores a las primeras dos variables y concatenar las dos
*    primeras variables en la última separándolas por el carácter “/” .

    DATA: mv_exercise     TYPE n LENGTH 4 VALUE '0123',
          mv_invoice_no   TYPE n LENGTH 8 VALUE '456789DD',
          mv_invoice_code TYPE string.

    mv_invoice_code = mv_exercise && '/' && mv_invoice_no.

    out->write( |1. Concatenación| ).
    out->write( |Concatenación: { mv_invoice_code }| ).

*    2. Concatenaciones líneas de Tablas
*    Realizar una consulta a la tabla “ZEMP_LOGALI” utilizar la
*    declaración dinámica para asignar los valores a la tabla
*    LT_EMPLOYEES, y concatenar a los campos de la consulta un espacio
*    en blanco ““ con la sentencia “CONCAT_LINES_OF”.

    SELECT
    FROM zempl_logali
    FIELDS email
    INTO TABLE @DATA(lt_employees).

    DATA(lv_result) = concat_lines_of( table = lt_employees sep = ' ' ).

    out->write( | | ).
    out->write( |2. Concatenaciones líneas de Tablas| ).
    out->write( lv_result ).

*    3. Condensación
*    Declarar las siguientes variables de tipo “STRING:
*        ● MV_CASE1.
*        ● MV_CASE2.
*    Asignar el valor “Sales invoice with        status in process” para la
*    primera variable, para dejar un solo espacio en blanco. Luego
*    asignar el valor de “***ABAP*Cloud***” a la segunda variable y
*    eliminar el carácter “*” de la cadena de caracteres.

    DATA: mv_case1 TYPE string,
          mv_case2 TYPE string.

    mv_case1 = 'Sales invoice with        status in process'.

    mv_case2 = condense( mv_case1 ).

    out->write( | | ).
    out->write( |3. Condensación| ).
    out->write( |MV_CASE1 : { mv_case1 }| ).
    out->write( |condense (' ') of MV_CASE1: { mv_case2 }| ).

    mv_case1 = '***ABAP*Cloud***'.

    mv_case2 = condense( val = mv_case1 del = '*' ).
    out->write( |MV_CASE1 : { mv_case1 }| ).
    out->write( |condense (*) of MV_CASE1: { mv_case2 }| ).

*    4. SPLIT
*    Declarar las siguientes variables del tipo “STRING”:
*        ● MV_DATA, asignándole el valor “0001111111;LOGALIGROUP;2024”.
*        ● MV_ID_CUSTOMER.
*        ● MV_CUSTOMER.
*        ● MV_YEAR.
*    Separa el valor de la primera variable en las secciones separadas por
*    el carácter “;” y asigna los valores en el resto de ellas con la
*    instrucción “SPLIT”.

    DATA: mv_data        TYPE string VALUE '0001111111;LOGALIGROUP;2024',
          mv_id_customer TYPE string,
          mv_customer    TYPE string,
          mv_year        TYPE string.

    SPLIT mv_data AT ';' INTO mv_id_customer mv_customer mv_year.

    out->write( | | ).
    out->write( |4. SPLIT| ).
    out->write( |mv_data: { mv_data }| ).
    out->write( |mv_id_customer: { mv_id_customer }| ).
    out->write( |mv_customer: { mv_customer }| ).
    out->write( |mv_year: { mv_year }| ).


*    5. SHIFT
*    Declarar la siguiente variable:
*        ● MV_INVOICE_NUM, del tipo “STRING” y asignando el valor “2015ABCD”.
*    Eliminar 2 caracteres al inicio y al final
*    de la variable con la sentencia “SHIFT”.

    out->write( | | ).
    out->write( |5. SHIFT| ).

    DATA mv_invoice_num TYPE string VALUE '2015ABCD'.

    out->write( mv_invoice_num ).

    SHIFT mv_invoice_num BY 2 PLACES LEFT.
    SHIFT mv_invoice_num BY 2 PLACES RIGHT CIRCULAR.
    SHIFT mv_invoice_num BY 2 PLACES LEFT.

    out->write( mv_invoice_num ).

*    6. Funciones STRLEN y NUMOFCHAR
*    Declarar las siguientes variables:
*        ● MV_RESPONSE, asignando el valor “ Generating Invoice ”.
*        ● MV_COUNT.
*    Mostrar por consola la cantidad de caracteres de la primera variable
*    aplicando las funciones “STRLEN()” y “NUMOFCHAR()”.

    DATA(mv_response) = ' Generating Invoice '.
    DATA(mv_count) =  strlen( mv_response ).

    out->write( | | ).
    out->write( |6. Funciones STRLEN y NUMOFCHAR| ).
    out->write( |mv_response: { mv_response }| ).
    out->write( |strlen c: { mv_count }| ).
    mv_response = ` Generating Invoice `.
    mv_count =  strlen( mv_response ).
    out->write( |strlen str: { mv_count }| ).

    mv_response = ' Generating Invoice '.
    mv_count = numofchar( mv_response ).
    out->write( |numofchar c: { mv_count }| ).
    mv_response = ` Generating Invoice `.
    mv_count = numofchar( mv_response ).
    out->write( |numofchar str: { mv_count }| ).

*    7. Funciones TO_LOWER y TO_UPPER
*    Declarar la siguiente variable:
*        ● MV_TRANSLATE_INVOICE, del tipo “STRING” asignándole el valor “Report the issuance of this invoice”.
*    Cambiar el formato del contenido de la variable a mayúsculas y
*    luego a minúsculas utilizando la sentencia “TRANSLATE”. Imprimir
*    por pantalla los 2 resultados.

    out->write( | | ).
    out->write( |7. Funciones TO_LOWER y TO_UPPER| ).

    DATA(mv_translate_invoice) = `Report the issuance of this invoice`.
    DATA(MV_TRANSLATE_INVOICE_aux) = mv_translate_invoice.

    TRANSLATE MV_TRANSLATE_INVOICE_aux TO UPPER CASE.
    out->write( |mv_translate_invoice TO UPPER CASE: { MV_TRANSLATE_INVOICE_aux }| ).

    MV_TRANSLATE_INVOICE_aux = mv_translate_invoice.
    TRANSLATE MV_TRANSLATE_INVOICE_aux TO LOWER CASE.
    out->write( |mv_translate_invoice TO LOWER CASE: { MV_TRANSLATE_INVOICE_aux }| ).

*    8. Función INSERT y REVERSE
*    Reutilizar la variable “MV_TRANSLATE_INVOICE” e insertar la
*    cadena de caracteres “ to client” al final de la variable y luego
*    invertir la información de la variable.

    out->write( | | ).
    out->write( |8. Función INSERT y REVERSE| ).
    out->write( |mv_translate_invoice:          { mv_translate_invoice }| ).

    mv_translate_invoice = insert( val = mv_translate_invoice sub = ' to client' off = strlen( mv_translate_invoice ) ).
    out->write( |mv_translate_invoice insert:   { mv_translate_invoice }| ).

    mv_translate_invoice = reverse( mv_translate_invoice ).
    out->write( |mv_translate_invoice reverse:  { mv_translate_invoice }| ).


  ENDMETHOD.

ENDCLASS.
