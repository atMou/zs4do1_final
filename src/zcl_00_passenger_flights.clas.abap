CLASS zcl_00_passenger_flights DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_flight
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS constructor
   IMPORTING
      i_carrier_id TYPE /dmo/carrier_id
      i_connection_id TYPE /dmo/connection_id
      i_plane_type TYPE /dmo/plane_type_id
    RAISING cx_abap_invalid_value.

  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA seats_max TYPE /dmo/plane_seats_max.


ENDCLASS.



CLASS zcl_00_passenger_flights IMPLEMENTATION.



  METHOD constructor.

    super->constructor( i_carrier_id = i_carrier_id
                        i_connection_id = i_connection_id
                        i_plane_type = i_plane_type ).

    " Seats holen

    SELECT SINGLE seatsmax
    FROM zpassenger_max                          " Anderer CDS Name in Zerti
    WHERE planetypeid = @plane_type
    INTO @me->seats_max.

    IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE cx_abap_invalid_value.      " Beachte die cx_ABAP_KLasse
    ENDIF.

  ENDMETHOD.

ENDCLASS.
