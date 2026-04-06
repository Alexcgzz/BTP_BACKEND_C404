@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes por libro'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CLNTS_LIB_4112 as select from ztb_clnts_lib_4 as R
    inner join ztb_clientes_4 as C
    on C.id_cliente = R.id_cliente
{
    key R.id_libro      as IdLibro,
    key C.id_cliente    as IdCliente,
        C.nombre        as Nombre,
        C.apellidos     as Apellidos,
        C.email         as Email,
        C.url           as Url  
}
