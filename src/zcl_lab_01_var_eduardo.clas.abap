CLASS zcl_lab_01_var_eduardo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_var_eduardo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t.

    mv_purchase_date = '20261005'.
    mv_purchase_time = '050600'.

    out->write( |mv_purchase_date: { mv_purchase_date }| ).
    out->write( |mv_purchase_time: { mv_purchase_time }| ).

    DATA: mv_price TYPE f VALUE '10.5',
          mv_tax   TYPE i VALUE 16.

    out->write( |mv_price: { mv_price }| ).
    out->write( |mv_tax: { mv_tax }| ).

    DATA: mv_increase  TYPE decfloat16 VALUE '20.5',
          mv_discounts TYPE decfloat34 VALUE '10.5'.

    out->write( |mv_increase: { mv_increase }| ).
    out->write( |mv_discounts: { mv_discounts }| ).

    DATA: mv_type     TYPE c LENGTH 10 VALUE 'PC',
          mv_shipping TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36'.

    out->write( |mv_type: { mv_type }| ).
    out->write( |mv_shipping: { mv_shipping }| ).

    DATA: mv_id_code TYPE n LENGTH 4 VALUE 1110,
          mv_qr_code TYPE x LENGTH 5 VALUE 'F5CF'.

    out->write( |mv_id_code: { mv_id_code }| ).
    out->write( |mv_qr_code: { mv_qr_code }| ).

    TYPES:
      BEGIN OF mty_customer,
        id       TYPE i,
        customer TYPE c LENGTH 15,
        age      TYPE i,
      END OF mty_customer.

    DATA ls_customer TYPE mty_customer.

    ls_customer-id       = 1.
    ls_customer-customer = 'Eduardo Mogo'.
    ls_customer-age      = 30.

    out->write( |ls_customer-id: { ls_customer-id }| ).
    out->write( |ls_customer-customer: { ls_customer-customer }| ).
    out->write( |ls_customer-age: { ls_customer-age }| ).

    DATA ms_employees TYPE /dmo/employee_hr.

    ms_employees-first_name = 'Eduardo'.
    ms_employees-last_name = 'Mogollon'.
    ms_employees-salary = '1000'.

    out->write( |ms_employees-first_name: { ms_employees-first_name }| ).
    out->write( |ms_employees-last_name: { ms_employees-last_name }| ).
    out->write( |ms_employees-salary: { ms_employees-salary }| ).

    DATA: mv_product      TYPE string VALUE 'Laptop',
          MV_BAR_CODE_aux TYPE string VALUE '12121 121211',
          mv_bar_code     TYPE xstring.

    mv_bar_code =  mv_bar_code_aux.

    out->write( |mv_product: { mv_product }| ).
    out->write( |mv_bar_code: { mv_bar_code }| ).


    CONSTANTS:
      mc_purchase_date TYPE d VALUE '20261005',
      mc_purchase_time TYPE t VALUE '050600',
      mc_price         TYPE f VALUE '10.5',
      mc_tax           TYPE i VALUE 16,
      mc_increase      TYPE decfloat16 VALUE '20.5',
      mc_discounts     TYPE decfloat34 VALUE '10.5',
      mc_type          TYPE c LENGTH 10 VALUE 'PC',
      mc_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
      mc_id_code       TYPE n LENGTH 4 VALUE '1110',
      mc_qr_code       TYPE x LENGTH 5 VALUE 'F5CF',
      mc_product       TYPE string VALUE 'Laptop',
      mc_bar_code_aux  TYPE string VALUE '12121 121211'.

    DATA(lv_product) = mv_product.
    DATA(lv_bar_code) = mv_bar_code.

    out->write( |lv_product: { lv_product }| ).
    out->write( |lv_bar_code: { lv_bar_code }| ).



  ENDMETHOD.
ENDCLASS.
