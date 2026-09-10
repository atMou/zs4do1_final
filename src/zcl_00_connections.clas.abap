CLASS zcl_00_connections DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS get_connections IMPORTING i_departure TYPE /dmo/airport_from_id
                          RETURNING VALUE(r_connections) TYPE zt00_connections.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_connections IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( get_connections( i_departure = 'EDI' ) ).

  ENDMETHOD.

  METHOD get_connections.

  SELECT FROM zconnections AS a
   INNER JOIN zconnections AS b
    ON a~airport_to_id = b~airport_from_id AND
    a~airport_from_id <> b~airport_to_id AND
    a~carrier_id = b~carrier_id
    FIELDS a~carrier_id, a~airport_from_id, b~airport_to_id, a~airport_to_id AS airport_via_id
    WHERE a~airport_from_id = @i_departure
  UNION ALL
   SELECT FROM zconnections
   FIELDS carrier_id, airport_from_id, airport_to_id, '-' AS airport_via_id
    WHERE airport_from_id = @i_departure
    INTO TABLE @r_connections.

  ENDMETHOD.

ENDCLASS.
