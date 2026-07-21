@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category Interface View'

define view entity ZI_GROC_CATEGORY
  as select from zgroc_category
{
    key category_id,
        category_name
}
