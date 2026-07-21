CLASS zcl_100008372_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_100008372_itab IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
  DATA connection TYPE REF TO lcl_connection.
  connection = NEW #(
    i_carrier_id    = 'LH'
    i_connection_id = '0400'
).
out->write(
    connection->get_output( )
).


  ENDMETHOD.

ENDCLASS.
