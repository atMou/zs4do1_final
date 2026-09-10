CLASS zcl_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_agency IMPORTING iv_agency TYPE /dmo/agency_id
            RETURNING VALUE(rs_agency) type /dmo/agency.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_agency_model IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

  METHOD get_agency.
    SELECT SINGLE FROM /dmo/agency FIELDS * WHERE agency_id = @iv_agency
           INTO @rs_agency.

  ENDMETHOD.

ENDCLASS.
