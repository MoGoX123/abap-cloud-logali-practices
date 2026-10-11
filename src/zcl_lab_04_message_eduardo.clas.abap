CLASS zcl_lab_04_message_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_message_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. Símbolos de texto
*    Crear un símbolo de texto con el ID “001” y agregar el texto “Test
*    with text symbols”.

    out->write( |1. Símbolos de texto| ).
    out->write( |TEXT 001: { TEXT-001 }| ).

*    2. Funciones de descripción
*    Declarar las siguientes variables:
*        ● LV_ORDER_STATUS, del tipo “STRING” con un valor de “Purchase Completed Successfully”.
*        ● LV_CHAR_NUMBER, del tipo “I”.
*    Realizar las siguientes operaciones utilizando la variable “LV_ORDER_STATUS”:
*        ● Contar la longitud de caracteres de la primera variable con las funciones “STRLEN()” y “NUMOFCHAR()”.
*        ● Contar la cantidad de los caracteres “A” en su totalidad sin
*          distinguir entre mayúsculas y minúsculas dentro de la variable.
*        ● Encontrar la posición del patrón “Exit” utilizando la función “FIND()”.
*    Para todos los casos utilizar para esto la segunda variable para
*    mostrar los resultados en consola.

    DATA: lv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i.

    lv_char_number = strlen( lv_order_status ).

    out->write( | | ).
    out->write( |2. Funciones de descripción| ).
    out->write( |lv_order_status: { lv_order_status }| ).
    out->write( |strlen of lv_order_status: { lv_char_number }| ).

    lv_char_number = numofchar( lv_order_status ).
    out->write( |numofchar of lv_order_status: { lv_char_number }| ).

    DATA(lv_order_status_aux) = lv_order_status.
    lv_char_number = count( val = lv_order_status_aux sub = 'A' case = abap_false ).
    out->write( |count (A or a) of lv_order_status: { lv_char_number }| ).

    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( |find Exit of lv_order_status: { lv_char_number }| ).

*    3. Funciones de procesamiento
*    Realizar las siguientes operaciones reutilizando la variable “LV_ORDER_STATUS”:
*        ● Cambiar el formato del contenido de la variable a mayúsculas, minúsculas y a un mixto entre los 2 formatos.
*        ● Desplazar los 9 primeros caracteres al final de la variable.
*        ● Extraer la palabra “Completed” de la variable.
*        ● Revertir el orden de los caracteres de la variable.

    out->write( | | ).
    out->write( |3. Funciones de procesamiento| ).
    out->write( |lv_order_status: { lv_order_status }| ).

*   ● Cambiar el formato del contenido de la variable a mayúsculas, minúsculas y a un mixto entre los 2 formatos.

    lv_order_status_aux = to_upper( lv_order_status ).
    out->write( |to_upper of lv_order_status: { lv_order_status_aux }| ).

    lv_order_status_aux = to_lower( lv_order_status ).
    out->write( |to_lower of lv_order_status: { lv_order_status_aux }| ).

    lv_order_status_aux = to_mixed( lv_order_status ).
    out->write( |to_mixed of lv_order_status: { lv_order_status_aux }| ).

    lv_order_status_aux = from_mixed( lv_order_status ).
    out->write( |from_mixed of lv_order_status: { lv_order_status_aux }| ).

*   ● Desplazar los 9 primeros caracteres al final de la variable.

    lv_order_status_aux = shift_left( val = lv_order_status circular = 9 ).
    out->write( |shift_left circular 9 to lv_order_status: { lv_order_status_aux }| ).

*   ● Extraer la palabra “Completed” de la variable.

    DATA(lv_complete) = 'Completed'.
    DATA(lv_Completed_len) = strlen( lv_complete ).
    DATA(lv_Completed_find) = find( val = lv_order_status sub = lv_complete ).

    lv_order_status_aux = substring( val = lv_order_status off = lv_completed_find len = lv_completed_len ).

    out->write( |substring (Completed) to lv_order_status: { lv_order_status_aux }| ).

*   ● Revertir el orden de los caracteres de la variable.

    lv_order_status_aux = reverse( lv_order_status ).
    out->write( |reverse to lv_order_status: { lv_order_status_aux }| ).

*    4. Funciones de contenido
*    Declarar las siguientes variables del tipo “STRING”:
*        ● LV_PATTERN, con el valor “\d{3}-\d{3}-\d{4}”.
*        ● LV_PHONE, con el valor “Agregar cualquier teléfono”.
*    Validar utilizando la función “CONTAINS()” el teléfono ingresado por
*    el cliente dentro de la segunda variable y validar si contiene el
*    formato correcto para esto utilizar el patrón dentro de la primera variable.

    out->write( | | ).
    out->write( |4. Funciones de contenido| ).

    DATA lv_patter TYPE string VALUE '\d{3}-\d{3}-\d{4}'.
    DATA(lv_phone) = '123-456-7890'.

    IF contains( val = lv_phone pcre = lv_phone ).
      out->write( |Contiene un numero de telefono valido| ).
    ELSE.
      out->write( |Contiene un numero de telefono invalido| ).
    ENDIF.


*    5. Funciones con expresiones regulares
*    Declarar la variable del tipo “STRING”:
*       ● LV_EMAIL, con el valor “Agregar cualquier correo”.
*    Validar el correo ingresado por el cliente dentro de la variable y
*    validar si contiene el formato correcto para esto reutilizar la variable
*    “LV_PATTER”, reemplazando su contenido con la expresión regular:
*    “\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b”.

    out->write( | | ).
    out->write( |5. Funciones con expresiones regulares| ).

    DATA(lv_email) = 'eduardo@hotmail.com'.
    lv_patter = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF matches( val = lv_email pcre = lv_patter ).
      out->write( |Contiene un correo valido| ).
    ELSE.
      out->write( |Contiene un correo invalido| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
