@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_VENTAS_4112   as select from ztb_clnts_lib_4
{
  key id_libro as IdLibro,
      count( * ) as Ventas
}
group by id_libro
