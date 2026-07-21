CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
  METHODS get_output
  RETURNING
    VALUE(r_output) TYPE string_table.

    CLASS-METHODS class_constructor.

    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id.

  PRIVATE SECTION.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    TYPES:
  BEGIN OF st_details,
    DepartureAirport   TYPE /dmo/airport_from_id,
    DestinationAirport TYPE /dmo/airport_to_id,
    AirlineName        TYPE /dmo/carrier_name,
  END OF st_details.

DATA details TYPE st_details.

    TYPES:
      BEGIN OF st_airport,
        AirportID TYPE /dmo/airport_id,
        Name      TYPE /dmo/airport_name,
      END OF st_airport.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
                      WITH NON-UNIQUE DEFAULT KEY.

    CLASS-DATA airports TYPE tt_airports.

ENDCLASS.



CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

    SELECT
      FROM /DMO/I_Airport
      FIELDS AirportID,
             Name
      INTO TABLE @airports.

  ENDMETHOD.


  METHOD constructor.

    SELECT SINGLE
      FROM /DMO/I_Connection
      FIELDS DepartureAirport,
             DestinationAirport,
             \_Airline-Name AS AirlineName
      WHERE AirlineID    = @i_carrier_id
        AND ConnectionID = @i_connection_id
      INTO CORRESPONDING FIELDS OF @details.

    me->carrier_id    = i_carrier_id.
    me->connection_id = i_connection_id.

  ENDMETHOD.


  METHOD get_output.

    DATA(departure) =
        airports[
            AirportID = details-DepartureAirport
        ].

    DATA(destination) =
        airports[
            AirportID = details-DestinationAirport
        ].

    APPEND |--------------------------------| TO r_output.

    APPEND |Carrier: { carrier_id } { details-AirlineName }| TO r_output.

    APPEND |Connection: { connection_id }| TO r_output.

    APPEND |Departure: { details-DepartureAirport } { departure-name }| TO r_output.

    APPEND |Destination: { details-DestinationAirport } { destination-name }| TO r_output.

  ENDMETHOD.

ENDCLASS.
