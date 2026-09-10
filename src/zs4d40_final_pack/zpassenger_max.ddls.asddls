@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Passenger'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPASSENGER_MAX as select distinct from /lrn/passflight
{

    plane_type_id as PlaneTypeId,
    seats_max as SeatsMax

}
