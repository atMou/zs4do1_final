CLASS zcx_00_no_agency1 DEFINITION
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
      begin of zcx_00_no_agency1,
        msgid type symsgid value 'ZC_00_MESSAGE',    " meldungsklasse beachten
        msgno type symsgno value '002',
        attr1 type scx_attrname value 'lv_agency_id',
        attr2 type scx_attrname value 'attr2',
        attr3 type scx_attrname value 'attr3',
        attr4 type scx_attrname value 'attr4',
      end of zcx_00_no_agency1.


    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        agency_id LIKE lv_agency_id OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_00_no_agency1 IMPLEMENTATION.


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
    IF agency_id IS NOT INITIAL.
    lv_agency_id = agency_id.
    ENDIF.
  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

ENDCLASS.
