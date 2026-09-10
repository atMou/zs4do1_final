CLASS zcl_00_testclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_testclass IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 TRY.

  DATA(lo_flight) = NEW  zcl_00_passenger_flights(
         i_carrier_id = 'LH'
         i_connection_id = '0400'
         i_plane_type = '747-400' ).

   out->write(  'OK - Objekt wurde erstellt' ).

   CATCH cx_abap_invalid_value INTO DATA(lx_error).

   out->write( |Fehler:| && lx_error->get_text(  ) ).

 ENDTRY.

  out->write( lo_flight ).

  ENDMETHOD.
ENDCLASS.
