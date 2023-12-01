INTERFACE zi_aoc
  PUBLIC .

  types ty_input type string_table.

  methods:
    get_input_data returning value rt_input type ty_input,
    part_one,
    part_two.

ENDINTERFACE.
