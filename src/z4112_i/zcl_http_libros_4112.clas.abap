CLASS zcl_http_libros_4112 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_http_libros_4112 IMPLEMENTATION.

    METHOD if_http_service_extension~handle_request.

      DATA lv_body TYPE string.
      DATA ls_libro TYPE ztb_libros_4112.

      lv_body = request->get_text( ).

      ls_libro-id_libro = '100'.
      ls_libro-titulo   = lv_body.

      INSERT ztb_libros_4112 FROM @ls_libro.

      response->set_text( 'Libro insertado correctamente' ).

    ENDMETHOD.

ENDCLASS.
