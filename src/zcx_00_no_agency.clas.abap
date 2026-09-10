CLASS zcx_00_no_agency DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA lv_agency_id TYPE /dmo/agency_id.

    constants:
      begin of ZCX_00_NO_AGENCY,
        msgid type symsgid value 'ZC_00_MESSAGE',
        msgno type symsgno value '002',
      end of ZCX_00_NO_AGENCY.


    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_00_no_agency IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

ENDCLASS.
