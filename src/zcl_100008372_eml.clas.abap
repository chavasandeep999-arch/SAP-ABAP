CLASS zcl_100008372_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_100008372_eml IMPLEMENTATION.

" Whenever a user tries to write*modify ENTITIES OF /DMO/I_AgencyTP"
 "on the /DMO/I_AgencyTP BO, the following code is executed. And all the changes cannot be made without a commit statement and"
 " COMMIT ENTITIES. "
" without the commit statement the changes are saved in the application buffer."
  METHOD if_oo_adt_classrun~main.

  DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

  agencies_upd = VALUE #(
    (
      agencyid = '070026'
      name     = 'N Travels'
    )
  ).
  MODIFY ENTITIES OF /DMO/I_AgencyTP
    ENTITY /DMO/Agency
    UPDATE FIELDS ( Name )
    WITH agencies_upd.

    COMMIT ENTITIES.
  out->write( `Method execution finished!` ).

ENDMETHOD.
ENDCLASS.
