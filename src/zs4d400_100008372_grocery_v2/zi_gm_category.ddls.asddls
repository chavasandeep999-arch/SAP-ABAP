@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category Interface View'

define view entity ZI_GM_CATEGORY
  as select from zgm_category
{
  key category_id,
      category_name
}
