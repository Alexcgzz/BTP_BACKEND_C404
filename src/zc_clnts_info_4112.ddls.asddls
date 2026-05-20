@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Informacion Clientes'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CLNTS_INFO_4112 as select from ztb_clientes_4
{
    key id_cliente as IdCliente,
        nombre     as Nombre,
        apellidos  as Apellidos,
        email      as Email,
        url        as Url   
}
