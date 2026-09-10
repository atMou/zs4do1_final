CLASS zcl_cs0_insert_values_conn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs0_insert_values_conn IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lt_zconnections TYPE TABLE OF zconnections.


    lt_zconnections = VALUE #(  ( carrier_id = 'LH' connection_id = 400 airport_from_id = 'FRA' airport_to_id = 'JFK'  )
                                ( carrier_id = 'LH' connection_id = 2010 airport_from_id = 'EDI' airport_to_id = 'FRA'  )
                                ( carrier_id = 'SQ' connection_id = 299 airport_from_id = 'EDI' airport_to_id = 'SIN'  )
                                ( carrier_id = 'SQ' connection_id = 300 airport_from_id = 'SIN' airport_to_id = 'EDI'  )
                                ( carrier_id = 'SQ' connection_id = 30 airport_from_id = 'SIN' airport_to_id = 'SYD'  )
                                ( carrier_id = 'BA' connection_id = 447 airport_from_id = 'EDI' airport_to_id = 'LHR'  )
                                ( carrier_id = 'AA' connection_id = 12 airport_from_id = 'LHR' airport_to_id = 'BOS'  )
                                     ).

    MODIFY zconnections FROM TABLE @lt_zconnections.


  ENDMETHOD.
ENDCLASS.


