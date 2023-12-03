CLASS zcl_day_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zi_aoc.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_day_1 IMPLEMENTATION.


  METHOD zi_aoc~solve_part_one.

    DATA lv_temp TYPE i.
    DATA: lv_first      TYPE i,
          lv_last       TYPE i,
          sum_of_values TYPE int8.

    LOOP AT it_input INTO DATA(ls_input).
      lv_first = match( val = ls_input pcre = '\d' occ = 1 ).
      lv_last = match( val = ls_input pcre = '\d' occ = -1 ).
      lv_temp = |{ lv_first }{ lv_last }|.
      sum_of_values = sum_of_values + lv_temp.

      CLEAR: lv_first, lv_last, lv_temp.
    ENDLOOP.

    rv_response = CONV #( sum_of_values ).

  ENDMETHOD.


  METHOD zi_aoc~solve_part_two.

    CONSTANTS: lc_pattern TYPE string VALUE '((one|two|three|four|five|six|seven|eight|nine)|[0-9])'.

    DATA(lt_digits) = VALUE string_table( ( |zero| ) ( |one| ) ( |two| ) ( |three| ) ( |four| )
                                          ( |five| ) ( |six| ) ( |seven| ) ( |eight| ) ( |nine| ) ).

    DATA lv_temp        TYPE string.
    DATA: lv_first      TYPE string,
          lv_first_digit type i,
          lv_last       TYPE string,
          lv_last_digit type i,
          sum_of_values TYPE int8.
    DATA lv_index TYPE i.
    LOOP AT it_input INTO DATA(ls_input).

      lv_first = match( val = ls_input xpath = lc_pattern occ = 1 ).
      READ TABLE lt_digits with key table_line = lv_first TRANSPORTING NO FIELDS .
      lv_first_digit = cond #( when sy-subrc = 0 then sy-tabix - 1 else CONV i( lv_first ) ).

      lv_last = match( val = ls_input xpath = lc_pattern occ = -1 ).
      READ TABLE lt_digits WITH KEY table_line = lv_last TRANSPORTING no fields.
      lv_last_digit = cond #( when sy-subrc = 0 then sy-tabix - 1 else CONV i( lv_last ) ).

      lv_temp = |{ lv_first_digit }{ lv_last_digit }|.
      sum_of_values += lv_temp.

      CLEAR: lv_first, lv_last, lv_temp, lv_first_digit, lv_last_digit.
    ENDLOOP.

    rv_response = CONV #( sum_of_values ).

  ENDMETHOD.



ENDCLASS.
