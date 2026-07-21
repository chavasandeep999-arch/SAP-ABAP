@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Store Interface View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_GS_STORE
  as select from zgs_store
{
  key store_id,
      store_name,
      city,
      country
}
