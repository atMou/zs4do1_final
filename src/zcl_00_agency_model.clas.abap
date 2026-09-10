CLASS zcl_00_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_agency IMPORTING iv_agency TYPE /dmo/agency_id RETURNING VALUE(rs_agency) TYPE /dmo/agency
                       RAISING zcx_00_no_agency.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_agency_model IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TRY.
    me->get_agency( iv_agency = '123' ).
    CATCH zcx_00_no_agency INTO DATA(lcx_agency).
    out->write( lcx_agency->get_text(  ) ).

  ENDTRY.

  ENDMETHOD.

  METHOD get_agency.
    SELECT SINGLE FROM /dmo/agency FIELDS * WHERE agency_id = @iv_agency
           INTO @DATA(ls_agency).

    IF sy-subrc <> 0.

    RAISE EXCEPTION TYPE zcx_00_no_agency
     MESSAGE e002(zc_00_message)
      with iv_agency.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
