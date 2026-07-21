@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Store Interface View'

define root view entity ZI_GROC_STORE
  as select from zgroc_store
{
    key store_id,
        store_name,
        city,
        country
}
