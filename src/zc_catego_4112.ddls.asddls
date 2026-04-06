@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_CATEGO_4112 as select from ztb_catego_4112
{
    key bi_categ    as BiCateg,
        descripcion as Descripcion
}
