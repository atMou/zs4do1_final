CLASS zcl_00_flight DEFINITION
  PUBLIC
*                             / Final entfernen
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS constructor
   IMPORTING
      i_carrier_id TYPE /dmo/carrier_id
      i_connection_id TYPE /dmo/connection_id
      i_plane_type TYPE /dmo/plane_type_id
    RAISING cx_abap_invalid_value.


  DATA carrier_id TYPE /dmo/carrier_id READ-ONLY.
  DATA connection_id TYPE /dmo/connection_id READ-ONLY.
  DATA airport_from TYPE /dmo/airport_from_id READ-ONLY.
  DATA airport_to TYPE /dmo/airport_to_id READ-ONLY.



  PROTECTED SECTION.

  DATA plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_00_flight IMPLEMENTATION.
  METHOD constructor.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    me->plane_type = i_plane_type.

     SELECT SINGLE FROM /dmo/connection FIELDS airport_from_id, airport_to_id
             WHERE carrier_id = @carrier_id AND
                   connection_id = @connection_id
                INTO ( @airport_from, @airport_to ).

    IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
