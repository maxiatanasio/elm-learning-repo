module LearningExamples.SuperBasic exposing (..)

import Html exposing (Html, div, p, text)

main =
    view "Hello World"

view: String -> Html String
view model =
    div [] [
        p [] [ text model ]
    ]
