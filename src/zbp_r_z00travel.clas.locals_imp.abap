CLASS LHC_ZR_Z00TRAVEL DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrZ00travel
        RESULT result,
      setInitialStatus FOR DETERMINE ON SAVE
            keys FOR ZrZ00travel~setInitialStatus.
ENDCLASS.

CLASS LHC_ZR_Z00TRAVEL IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD setInitialStatus.

  DATA travels_upd TYPE TABLE FOR UPDATE zr_z00travel.
   READ ENTITIES OF zr_z00travel IN LOCAL MODE
     ENTITY zrz00travel FIELDS ( Status )
      WITH CORRESPONDING #( keys )
        RESULT DATA(travels).

   LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
      <travel>-Status = 'N'.
   ENDLOOP.

   travels_upd = CORRESPONDING #( travels ).

   Modify ENTITIES OF zr_z00travel IN LOCAL MODE
        ENTITY zrz00travel UPDATE FIELDS ( Status )
        WITH travels_upd REPORTED DATA(reported_records).
   reported-zrz00travel = CORRESPONDING #( reported_records-zrz00travel ).

  ENDMETHOD.

ENDCLASS.
