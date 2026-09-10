@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'Z00TRAVEL'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_Z00TRAVEL
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_Z00TRAVEL
  association [1..1] to ZR_Z00TRAVEL as _BaseEntity on $projection.TRAVELID = _BaseEntity.TRAVELID
{
  key TravelID,
  AgencyID,
  CustomerID,
  BeginDate,
  EndDate,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  BookingFee,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  TotalPrice,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  Description,
  Status,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
