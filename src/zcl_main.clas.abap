CLASS zcl_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS:
      get_input_data RETURNING VALUE(rt_input) TYPE string_table,
      create_client
        IMPORTING url              TYPE string
        RETURNING VALUE(ro_result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: lc_day_number TYPE i VALUE 1.
ENDCLASS.



CLASS zcl_main IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lt_input) = get_input_data( ).
    data(lv_response_part1) = new zcl_day_1( )->zi_aoc~solve_part_one( it_input = lt_input ).

    out->write( |Part 1: { lv_response_part1 } | ).

  ENDMETHOD.

  METHOD get_input_data.

    CONSTANTS lc_url TYPE string VALUE 'https://raw.githubusercontent.com/Daniel-luis/AdventOfCode2023/main/input_files/day1.txt'.
    DATA(lo_client) = create_client( lc_url ).
    DATA(ls_response) = lo_client->execute( if_web_http_client=>get )->get_text( ).
    lo_client->close( ).

    SPLIT ls_response AT cl_abap_char_utilities=>newline INTO TABLE rt_input.

  ENDMETHOD.

  METHOD create_client.

    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    ro_result = cl_web_http_client_manager=>create_by_http_destination( dest ).

  ENDMETHOD.

ENDCLASS.
