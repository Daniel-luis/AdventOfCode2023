INTERFACE zi_aoc
  PUBLIC .

  METHODS:
    solve_part_one
      IMPORTING it_input           TYPE string_table
      RETURNING VALUE(rv_response) TYPE string,
    solve_part_two
      IMPORTING it_input           TYPE string_table
      RETURNING VALUE(rv_response) TYPE string.

ENDINTERFACE.
