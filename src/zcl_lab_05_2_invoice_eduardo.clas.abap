CLASS zcl_lab_05_2_invoice_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_2_invoice_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. OVERLAY
*    Declarar la siguiente variable del tipo “STRING”:
*        ● LV_SALE, asignándole el valor “Purchase Completed”.·
*        ● LV_SALE_STATUS, asignando el valor “Invoice”.
*    Utilizar la sentencia “OVERLAY” para sobreponer el valor de la
*    primera variable con la segunda.

*    DATA: lv_sale        TYPE string VALUE 'Purchase Completed',
*          lv_sale_status TYPE string VALUE 'Invoice           '.

    DATA(lv_sale) =        'Purchase Complete'.
    DATA(lv_sale_status) = 'Invoice           '.

    OVERLAY lv_sale_status WITH lv_sale.

    out->write( |1. OVERLAY| ).
    out->write( lv_sale_status ).

*    2. Función SUBSTRING
*    Declarar la siguiente variable del tipo “STRING”:
*       ● LV_RESULT, asignándole el valor “SAP-ABAP-32-PE”.
*    Obtener la cadena de caracteres desde la posición 9 hasta la 14 y
*    devolver el valor en la misma variable. Luego mostrar en consola los
*    resultados de la cadena antes y después de la cadena de caracteres “ABAP”.

    DATA lv_result TYPE string VALUE 'SAP-ABAP-32-PE'.

    out->write( | | ).
    out->write( |2. Función SUBSTRING| ).
    out->write( lv_result ).

    lv_result = substring( val = lv_result off = 8 len = 6 ).
    out->write( lv_result ).

*    3. FIND
*    Declarar las siguientes variables:
*        ● LV_STATUS, de tipo “STRING” asignándole el valor “INVOICE GENERATED SUCCESSFULLY”.
*        ● LV_COUNT, de tipo “I”.
*    Buscar con la sentencia “FIND_ANY_OF” de la primera variable los
*    caracteres “GEN” y muestra por pantalla la posición real de los
*    caracteres buscados. Luego con la sentencia “FIND ALL
*    OCCURRENCES OF IN MATCH COUNT” o con la función “COUNT()”
*    encontrar la cantidad de letras “A” en la primera variable y asignar
*    dicha cantidad a la segunda variable.

    DATA: lv_status TYPE string VALUE 'INVOICE GENERATED SUCCESSFULLY',
          lv_count  TYPE i.

    out->write( | | ).
    out->write( |3. FIND| ).
    out->write( |lv_status: { lv_status }| ).

    lv_count = find_any_of( val = lv_status sub = 'GEN' ) + 1.
    out->write( |find_any_of 'GEN' in lv_status: { lv_count }| ).

    lv_count = count( val = lv_status sub = 'A' ).
    out->write( |count 'A' in lv_status: { lv_count }| ).

*    4. REPLACE
*    Declarar la siguiente variable de tipo “STRING”:
*       ● LV_REQUEST asignándole el mismo valor “SAP-ABAP-32-PE”.
*    Reemplazar todas las ocurrencias del carácter “-” con el carácter “/”.
*    con la instrucción sentencia “REPLACE”.

    DATA lv_request TYPE string VALUE 'SAP-ABAP-32-PE'.

    out->write( | | ).
    out->write( |4. REPLACE| ).
    out->write( |lv_request: { lv_request }| ).

    lv_request = replace( val = lv_request sub = '-' with = '/' occ = 0 ).
    out->write( |REPLACE '-' with '/': { lv_request }| ).

*    5. PCRE Regex
*    Declarar las siguientes variables del tipo “STRING”:
*        ●  LV_REGEX, asignándole el valor “^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]
*           {2,4})$” para validar el formato de los correos electrónicos.
*        ●  LV_EMAIL, asignándole un correo electrónico de su preferencia.
*    Aplicar la sentencia “FIND REGEX” para validar el formato del correo
*    establecido de la segunda variable es válido.

    DATA: lv_regex TYPE string VALUE '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$',
          lv_email TYPE string VALUE 'eduardo@hotmail.com'..

    out->write( | | ).
    out->write( |5. PCRE Regex| ).
    out->write( |lv_email: { lv_email }| ).

    FIND REGEX lv_regex IN lv_email.

    IF sy-subrc EQ 0.
      out->write( |lv_email cumple con la condicion regex| ).
    ELSE.
      out->write( |lv_email no cumple con la condicion regex| ).
    ENDIF.

*    6. Expresiones regulares
*    Declarar las siguientes variables del tipo “STRING”:
*       ● LV_IDCUSTOME, asignándole el valor “0000012345”.
*    Reutilizar la variable “LV_REGEX”, asignándole el valor de “0*” para
*    eliminar los ceros a la izquierda de la variable “LV_IDCUSTOME”.

    DATA(lv_idcustome) = `0000012345`.
    lv_regex = '0*'.

    out->write( | | ).
    out->write( |6. Expresiones regulares| ).
    out->write( |lv_idcustome: { lv_idcustome }| ).

    lv_idcustome = replace( val = lv_idcustome regex = lv_regex with = '' ).
    out->write( |replace regex (0*) with '': { lv_idcustome }| ).

*    7. Repetición de strings
*    Reutilizar la variable “LV_IDCUSTOME” y repetir el valor que
*    contiene 3 veces utilizando la función “REPEAT()”.

    out->write( | | ).
    out->write( |7. Repetición de strings| ).
    out->write( |lv_idcustome: { lv_idcustome }| ).

    lv_idcustome = repeat( val = lv_idcustome occ = 3 ).
    out->write( |repeat 3 times lv_idcustome: { lv_idcustome }| ).

*    8. Función ESCAPE
*    Declarar las siguientes variables:
*       ● LV_FORMAT, del tipo “STRING” asignándole el valor “Send payment data via Internet”.
*    Mostrar en consola el valor de la variable en los formatos URL, Json
*    y String Templates.

    out->write( | | ).
    out->write( |8. Función ESCAPE| ).

    DATA(lv_format) = `Send payment data via Internet`.
    out->write( |lv_format: { lv_format }| ).

    DATA(lv_url) = escape( val = lv_format format = cl_abap_format=>e_uri_full ).
    out->write( |lv_url: { lv_url }| ).

    DATA(lv_json) = escape( val = lv_format format = cl_abap_format=>e_json_string ).
    out->write( |lv_json: { lv_json }| ).

    DATA(lv_stringTemplate) = escape( val = lv_format format = cl_abap_format=>e_string_tpl ).
    out->write( |lv_stringTemplate: { lv_stringTemplate }| ).

  ENDMETHOD.

ENDCLASS.
