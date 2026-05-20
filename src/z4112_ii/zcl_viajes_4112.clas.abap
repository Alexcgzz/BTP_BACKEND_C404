CLASS zcl_viajes_4112 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_viajes_4112 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel   TYPE TABLE OF ztb_travel_4112,
          lt_booking  TYPE TABLE OF ztb_booking_4112,
          lt_booksup  TYPE TABLE OF ztb_booksup_4112.

    SELECT
      travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      booking_fee,
      total_price,
      currency_code,
      description,
      status        AS overall_status,
      createdby     AS created_by,
      createdat     AS created_at,
      lastchangedby AS last_changed_by,
      lastchangedat AS last_changed_at
      FROM /dmo/travel
      INTO CORRESPONDING FIELDS OF TABLE @lt_travel
      UP TO 50 ROWS.

    IF lt_travel IS NOT INITIAL.

      SELECT
        *
        FROM /dmo/booking
        FOR ALL ENTRIES IN @lt_travel
        WHERE travel_id = @lt_travel-travel_id
        INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    ENDIF.

    IF lt_booking IS NOT INITIAL.

      SELECT
        *
        FROM /dmo/book_suppl
        FOR ALL ENTRIES IN @lt_booking
        WHERE travel_id  = @lt_booking-travel_id
          AND booking_id = @lt_booking-booking_id
        INTO CORRESPONDING FIELDS OF TABLE @lt_booksup.

    ENDIF.

    DELETE FROM ztb_booksup_4112.
    DELETE FROM ztb_booking_4112.
    DELETE FROM ztb_travel_4112.

    INSERT ztb_travel_4112  FROM TABLE @lt_travel.
    INSERT ztb_booking_4112 FROM TABLE @lt_booking.
    INSERT ztb_booksup_4112 FROM TABLE @lt_booksup.

    out->write( 'Datos cargados correctamente en las tablas Z.' ).

  ENDMETHOD.

ENDCLASS.
