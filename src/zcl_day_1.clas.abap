CLASS zcl_day_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zi_aoc .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_day_1 IMPLEMENTATION.


  METHOD zi_aoc~solve_part_one.

    DATA lv_temp TYPE i.
    DATA: lv_first      TYPE i,
          lv_last       TYPE i,
          sum_of_values TYPE int8.

    LOOP AT it_input into data(ls_input).
      lv_first = match( val = ls_input pcre = '\d' occ = 1 ).
      lv_last = match( val = ls_input pcre = '\d' occ = -1 ).
      lv_temp = |{ lv_first }{ lv_last }|.
      sum_of_values = sum_of_values + lv_temp.

      CLEAR: lv_first, lv_last, lv_temp.
    ENDLOOP.

    rv_response = CONV #( sum_of_values ).

  ENDMETHOD.


  METHOD zi_aoc~solve_part_two.
  ENDMETHOD.
ENDCLASS.
