@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Store Value Help'

define view entity ZI_GM_STORE_VH
  as select from zgm_store
{
    key store_id,
        store_name
}
