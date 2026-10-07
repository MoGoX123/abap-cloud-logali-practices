CLASS zcl_lab_02_arithmetic_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_eduardo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    1. Suma / Sentencia ADD
*    Declarar las siguientes variables de tipo “I”:
*        ● LV_BASE_RATE asignándole el valor de “20”.
*        ● LV_CORP_AREA_RATE asignándole el valor de “10”.
*        ● LV_MEDICAL_SERVICE_RATE asignándole el valor de “15”.
*        ● LV_TOTAL_RATE.
*    Aplicar la operación de sumatoria utilizando el carácter “+” donde se
*    guarda el resultado de la operación en la tercera variable aplicada
*    sobre las variables con valor (primeras tres). Al resultado final suma
*    el valor “5” utilizando la sentencia “ADD”.

    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.

    lv_total_rate = lv_base_rate +
                    lv_corp_area_rate +
                    lv_medical_service_rate.

    ADD 5 TO lv_total_rate.

    out->write( |Resultado Suma: { lv_total_rate }| ).

*    2. Resta / Sentencia SUBTRACT
*    Declarar las siguientes variables de tipo “I”:
*        ● LV_MAINTENANCE_RATE asignándole el valor de “30”.
*        ● LV_MARGIN_RATE asignándole el valor de “10”.
*        ● LV_BASE_RATE.
*    Aplicar la operación de resta utilizando el carácter “-” donde se
*    guarda el resultado de la operación en la tercera variable aplicada
*    sobre las variables con valor (primeras dos). Al resultado final resta
*    el valor “4” utilizando la sentencia “SUBTRACT”.


    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.

    lv_base_rate = lv_maintenance_rate - lv_margin_rate.

    SUBTRACT 4 FROM lv_base_rate.

    out->write( |Resultado Resta: { lv_base_rate }| ).

*    3. Multiplicación / Sentencia MULTIPLY
*    Declarar las siguientes variables de tipo “I”:
*        ● LV_PACKAGE_WEIGHT asignándole el valor de “2”.
*        ● LV_COST_PER_KG asignándole el valor de “3”.
*        ● LV_MULTI_RATE.
*    Aplicar la operación de multiplicación utilizando el carácter “*” para
*    guardar el resultado de la operación en la tercera variable. Utiliza la
*    sentencia “MULTIPLY” para multiplicar por “2” el resultado de la
*    operación.

    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.


    lv_multi_rate = lv_package_weight * lv_cost_per_kg.

    MULTIPLY lv_multi_rate BY 2.

    out->write( |Resultado Multiplicación: { lv_multi_rate }| ).

*    4. División / Sentencia DIVIDE
*    Declarar las siguientes variables:
*        ● LV_TOTAL_WEIGHT de tipo “I”, asignándole el valor de “38”.
*        ● LV_NUM_PACKAGES de tipo “I” asignándole el valor de “4”.
*        ● LV_APPLIED_RATE de tipo incompleto “P” con una longitud
*    de 8 y 2 decimales.
*    Aplica la operación de división utilizando el carácter “/” guardando
*    el resultado de la operación en la tercera variable.
*    Utiliza la sentencia “DIVIDE” para dividir por “3” el resultado de la
*    operación de la tercera variable.


    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    lv_applied_rate = lv_total_weight / lv_num_packages.

    DIVIDE lv_applied_rate BY 3.

    out->write( |Resultado División: { lv_applied_rate }| ).

*    5. División sin resto / Sentencia DIV
*    Declarar las siguientes variables:
*    ● LV_TOTAL_COST de tipo “I”, asignándole el valor de “17”.
*    ● LV_DISCOUNT_THRESHOLD de tipo “I” asignándole el valor de “4”.
*    ● LV_RESULT de tipo incompleto “P” con una longitud de “4” y “2” decimales.
*    Obtener el resultado de la división sin resto (residuo) en la última
*    variable. Muestra por pantalla el valor de la tercera variable.

    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.

    lv_result = 17 DIV 4.

    out->write( |Resultado División sin resto: { lv_result }| ).

*    6. Resto (residuo) de división / Sentencia MOD
*    Declarar las siguientes variables:
*        ● LV_TOTAL_COST de tipo “I”, asignándole el valor de “19”.
*        ● LV_DISCOUNT_THRESHOLD de tipo “I” asignándole el valor de “4”.
*        ● LV_REMAINDER de tipo incompleto “P” con una longitud de “4” y “2” decimales.
*    Obtén el resultado de la operación resto de división aplicada sobre
*    las dos primeras variables en la última variable declarada.

    DATA lv_remainder TYPE p LENGTH 4 DECIMALS 2.

    lv_total_cost = 19.
    lv_discount_threshold = 4.

    lv_remainder = lv_total_cost MOD lv_discount_threshold.

    out->write( |Resultado Resto (residuo) de división: { lv_remainder }| ).

*    7. Exponenciación
*    Declarar las siguientes variables de tipo “I”:
*        ● LV_WEIGHT asignándole el valor de “5”.
*        ● LV_EXPO.
*    Eleva al cuadrado la primera variable y guarda el resultado en una
*    variable en la última.

    DATA: lv_weight TYPE i VALUE 5,
          lv_expo   TYPE i.

    lv_expo = lv_weight ** 2.

    out->write( |Resultado Exponenciación: { lv_expo }| ).

*    8. Raíz cuadrada
*    Declarar las siguientes variables de tipo “I”:
*       ● LV_SQUARE_ROOT.
*    Obtener la raíz cuadrada del valor de la variable LV_EXPO de la
*    actividad anterior.

    DATA lv_square_root TYPE i.

    lv_square_root = sqrt( lv_expo ).

    out->write( |Resultado Raíz cuadrada: { lv_square_root }| ).

  ENDMETHOD.
ENDCLASS.
