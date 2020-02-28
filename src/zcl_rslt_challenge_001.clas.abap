"! <p class="shorttext synchronized" lang="en">SAP Community Coding Challenge Series</p>
CLASS zcl_rslt_challenge_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
    METHODS get_unique_letters
      IMPORTING
        iv_word           TYPE csequence
      RETURNING
        VALUE(rv_letters) TYPE i.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_rslt_challenge_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_sentence) = `ABАP  is excellent `.

    SPLIT lv_sentence AT space INTO TABLE DATA(lt_words).

    DELETE lt_words WHERE TABLE_LINE = space.

    out->write( |Number of words: { lines( lt_words ) }| ).

    LOOP AT lt_words INTO DATA(lv_word).
      out->write( |Number of unique characters in the word: { lv_word } - { get_unique_letters( lv_word ) }| ).
    ENDLOOP.

  ENDMETHOD.


  METHOD get_unique_letters.

    DO strlen( iv_word ) TIMES.
      rv_letters = CONV #( LET position = sy-index - 1
                            IN COND #( WHEN iv_word+sy-index CA iv_word+position(1) THEN rv_letters
                                                                                    ELSE rv_letters + 1 ) ).
    ENDDO.

  ENDMETHOD.


ENDCLASS.
