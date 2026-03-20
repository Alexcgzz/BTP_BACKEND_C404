@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_LIBROS_4112 as select from ztb_libros_4112
{
    key id_libro as IdLibro,
    key bi_categ as BiCateg,
    titulo as Titulo,
    autor as Autor,
    editorial as Editorial,
    idioma as Idioma,
    paginas as Paginas,
    moneda as Moneda,
    formato as Formato,
    url as Url 
}
