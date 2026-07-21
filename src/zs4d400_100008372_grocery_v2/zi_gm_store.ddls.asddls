@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Store Interface View'

define view entity ZI_GM_STORE
  as select from zgm_store
{
  key store_id,
      store_name,
      city,
      country
}
