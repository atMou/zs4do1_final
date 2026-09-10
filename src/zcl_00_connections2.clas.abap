CLASS zcl_00_connections2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_connections
         IMPORTING i_departure TYPE /dmo/airport_from_id RETURNING VALUE(r_connections) TYPE zt00_connections.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_connections2 IMPLEMENTATION.

  METHOD get_connections.

  " Ergebnis initialisieren
    r_connections = VALUE #(  ).

  "-----------------------------------
  " 1. Direktflüge
  "-----------------------------------

  SELECT
  FROM zconnections
  FIELDS carrier_id,
         airport_from_id,
         airport_to_id
  WHERE airport_from_id = @i_departure
  INTO TABLE @DATA(lt_direct).

  LOOP AT lt_direct INTO DATA(ls_direct).

    APPEND VALUE #(
         carrier_id = ls_direct-carrier_id
         airport_from_id = ls_direct-airport_from_id
         airport_to_id = ls_direct-airport_to_id
         airport_via_id = '-' ) to r_connections.

  ENDLOOP.

  "-----------------------------------
  " 2. Flüge mit einem Umstieg
  "-----------------------------------

  SELECT FROM zconnections AS a
  INNER JOIN zconnections AS b
  on a~carrier_id = b~carrier_id
  AND a~airport_to_id = b~airport_from_id
  FIELDS a~carrier_id,
         a~airport_from_id,
         b~airport_to_id,
         a~airport_to_id AS aiport_via_id
  WHERE a~airport_from_id = @i_departure
  AND   b~airport_to_id <> @i_departure       " Kein Rückflug!
  INTO TABLE @DATA(lt_indirect).

  LOOP AT lt_indirect INTO DATA(ls_indirect).

    APPEND Value #(
          carrier_id = ls_indirect-carrier_id
          airport_from_id = ls_indirect-airport_from_id
          airport_to_id = ls_indirect-airport_to_id
          airport_via_id = ls_indirect-aiport_via_id ) TO r_connections.

   ENDLOOP.


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

   DATA(lo_conn) = NEW zcl_00_connections2( ).

   DATA(lt_result) = lo_conn->get_connections( i_departure = 'EDI' ).

   LOOP AT lt_result INTO DATA(ls).

   out->write( |{ ls-carrier_id } { ls-airport_from_id } -> { ls-airport_to_id } via { ls-airport_via_id }| ).

   ENDLOOP.

  ENDMETHOD.


ENDCLASS.
