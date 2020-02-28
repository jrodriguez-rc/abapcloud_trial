"! <p class="shorttext synchronized" lang="en">SAP Community Coding Challenge Series</p>
CLASS zcl_rslt_sap_challenges DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
    "! <p class="shorttext synchronized" lang="en">Challenge 001</p>
    "! SAP Community Coding Challenge Series
    "! https://blogs.sap.com/2020/02/28/sap-community-coding-challenge-series/
    METHODS challenge_001.

    "! <p class="shorttext synchronized" lang="en">Get unique letters for a word</p>
    "!
    "! @parameter iv_word | <p class="shorttext synchronized" lang="en">Word</p>
    "! @parameter rv_letters | <p class="shorttext synchronized" lang="en">Number of unique letters</p>
    METHODS get_unique_letters
      IMPORTING
        iv_word           TYPE csequence
      RETURNING
        VALUE(rv_letters) TYPE i.

    "! <p class="shorttext synchronized" lang="en">Write ADT output</p>
    "!
    "! @parameter iv_data | <p class="shorttext synchronized" lang="en">Data</p>
    "! @parameter iv_name | <p class="shorttext synchronized" lang="en">Name</p>
    METHODS write
      IMPORTING
        iv_data TYPE any
        iv_name TYPE string OPTIONAL  .

  PRIVATE SECTION.
    DATA mi_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.



CLASS zcl_rslt_sap_challenges IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    mi_out = out.

    challenge_001( ).

  ENDMETHOD.


  METHOD challenge_001.

    DATA(lv_sentence) = `ABАP  is excellent `.

    SPLIT lv_sentence AT space INTO TABLE DATA(lt_words).

    DELETE lt_words WHERE table_line = space.

    write( |Number of words: { lines( lt_words ) }| ).

    LOOP AT lt_words INTO DATA(lv_word).
      write( |Number of unique characters in the word: { lv_word } - { get_unique_letters( lv_word ) }| ).
    ENDLOOP.

  ENDMETHOD.


  METHOD get_unique_letters.

    DO strlen( iv_word ) TIMES.
      rv_letters = CONV #( LET position = sy-index - 1
                            IN COND #( WHEN iv_word+sy-index CA iv_word+position(1) THEN rv_letters
                                                                                    ELSE rv_letters + 1 ) ).
    ENDDO.

  ENDMETHOD.


  METHOD write.
    mi_out->write( data = iv_data name = iv_name ).
  ENDMETHOD.

ENDCLASS.
