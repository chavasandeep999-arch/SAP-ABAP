@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category Interface View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_GS_CATEGORY
  as select from zgs_category
{
  key category_id,
      category_name
}
