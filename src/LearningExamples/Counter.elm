module LearningExamples.Counter exposing (..)

import Browser
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import String exposing (fromInt)

--Main
main =
    Browser.sandbox {init=init, update=update, view=view}

--Model
type alias Model = Int

init: Model
init =
    0

--Update
type Msg =
    Increment |
    Decrement |
    Reset

update: Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0

view: Model -> Html Msg
view model =
    div [] [
        div [] [ text (fromInt model) ],
        button [ onClick Increment] [ text "Increment"],
        button [ onClick Decrement] [ text "Decrement"],
        button [ onClick Reset] [ text "Reset"]
    ]
