CLASS zcl_lab_09_structure_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_09_structure_eduardo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    1. Declaración estructuras
*    Declarar los siguientes tipos:
*        ● TY_FLIGHTS
*        ● TY_AIRLINES

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights,

           BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airpfrom  TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF ty_airlines.

*    2. Estructuras anidadas (NESTED)
*    Declarar la estructura Nested “TY_NESTED” utilizando los dos tipos
*    declarados anteriormente.

    TYPES: BEGIN OF ty_nested,
             flights  TYPE ty_flights,
             airlines TYPE ty_airlines,
           END OF ty_nested.

*    3. Estructuras complejas (DEEP)
*    Declarar la estructura Deep “TY_DEEP”
*    Donde el campo “FLIGHTS” es un tipo tabla del tipo “TY_FLIGHTS”.

    TYPES: BEGIN OF ty_deep,
             flights TYPE TABLE OF ty_flights WITH EMPTY KEY,
           END OF ty_deep.

*    4. Añadir datos
*    Agregar datos a todas las estructuras declaradas.

    DATA: ls_flights  TYPE ty_flights,
          ls_airlines TYPE ty_airlines,
          ls_nested   TYPE ty_nested,
          ls_deep     TYPE ty_deep.

    ls_flights = VALUE #(
        iduser     = 'JUAN PEREZ'
        aircode    = 'LH'
        flightnum  = '0400'
        key        = 'DE'
        seat       = 120
        flightdate = '20261025'
    ).

    ls_airlines = VALUE #(
        carrid    = 'LH'
        connid    = '0400'
        countryfr = 'DE'
        cityfrom  = 'FRANKFURT'
        airpfrom  = 'FRA'
        countryto = 'AR'
    ).

    ls_nested = VALUE #(
        flights = ls_flights
        airlines = ls_airlines
    ).

    APPEND ls_flights TO ls_deep-flights.

    APPEND VALUE ty_flights(
        iduser     = 'ALFREDO HERNANDEZ'
        aircode    = 'TP'
        flightnum  = '0500'
        key        = 'DE'
        seat       = 11
        flightdate = '20261114'
    ) TO ls_deep-flights.

    out->write( |4. Añadir datos| ).
    out->write( | | ).
    out->write( data = ls_flights name = 'ls_flights' ).
    out->write( | | ).
    out->write( data = ls_airlines name = 'ls_airlines' ).
    out->write( | | ).
    out->write( data = ls_nested name = 'ls_nested' ).
    out->write( | | ).
    out->write( data = ls_deep name = 'ls_deep' ).

*    5. Estructura INCLUDE
*    Declarar una estructura “INCLUDE” utilizando los tipos
*    “TY_FLIGHTS” y “TY_AIRLINES”. Con el nombre
*    “TY_INCLUDE_FLIGHTS” y asignarle valores.

    TYPES BEGIN OF ty_include_flights.
    INCLUDE TYPE ty_flights AS flights RENAMING WITH SUFFIX _flights.
    INCLUDE TYPE ty_airlines AS airlines RENAMING WITH SUFFIX _airlines.
    TYPES END OF ty_include_flights.

*******    DEJO ESTA ESTRUCTURA NADA MAS POR INDOLE EDUCATIVO   *******

    TYPES BEGIN OF ty_include_flights_2.
    INCLUDE STRUCTURE ls_flights AS flights.
    INCLUDE STRUCTURE ls_airlines AS airlines.
    TYPES END OF ty_include_flights_2.

*******    DEJO ESTA ESTRUCTURA NADA MAS POR INDOLE EDUCATIVO   *******

    ls_airlines = VALUE #(
        carrid    = 'LH'
        connid    = '0400'
        countryfr = 'DE'
        cityfrom  = 'FRANKFURT'
        airpfrom  = 'FRA'
        countryto = 'AR'
    ).


    DATA(ls_include_flights) = VALUE ty_include_flights(
        iduser_flights = 'EDUARDO MOGO'
        aircode_flights = 'FF'
        flightnum_flights = '0101'
        key_flights = 'AA'
        seat_flights = 96
        flightdate_flights = '20261110'

        carrid_airlines = 'PP'
        connid_airlines = '0400'
        countryfr_airlines = 'AP'
        cityfrom_airlines = 'CARACAS'
        airpfrom_airlines = 'VZL'
        countryto_airlines = 'ARG'
     ).

    out->write( | | ).
    out->write( |5. Estructura INCLUDE| ).
    out->write( | | ).
    out->write( data = ls_include_flights name = 'ls_include_flights' ).

*    6. Eliminar datos
*    Eliminar datos de las estructuras “NESTED” y “DEEP”.

    CLEAR: ls_nested,
           ls_deep.

    out->write( | | ).
    out->write( |6. Eliminar datos| ).
    out->write( | | ).
    out->write( data = ls_nested name = 'ls_nested' ).
    out->write( | | ).
    out->write( data = ls_deep name = 'ls_deep' ).

  ENDMETHOD.

ENDCLASS.
