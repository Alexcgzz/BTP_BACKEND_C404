@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_LIBROS_4112 as select from ztb_libros_4112 as L
    association [0..1] to ZC_CATEGO_4112    as _Categoria on $projection.BiCateg = _Categoria.BiCateg
    association [0..*] to ZC_CLNTS_LIB_4112 as _Clientes  on $projection.IdLibro = _Clientes.IdLibro
    
{
    key L.id_libro as IdLibro,
    
    @Consumption.valueHelpDefinition: [{ entity: {
        name: 'ZC_CATEGO_4112',
        element: 'BiCateg'
    } }]
    key L.bi_categ as BiCateg,
    
        L.titulo as Titulo,
        L.autor as Autor,
    
    @Search.defaultSearchElement: true
        L.editorial as Editorial,
    
        L.idioma as Idioma,
        L.paginas as Paginas,
        L.moneda as Moneda,
        L.formato as Formato,
        L.url as Url,
        
        _Categoria,
        _Clientes
}
