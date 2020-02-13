module LearningExamples.HelloWorld exposing (..)

import Browser
import Html exposing (Html, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

greet: String -> String
greet name =
    "hello " ++ name

main =
    Browser.sandbox { init=init, update = update, view = view}

type alias Model = String

init: Model
init =
    ""

type Msg = Change String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Change name ->
            name

view: Model -> Html Msg
view model =
    div []
    [
        input [ value model, onInput Change ] [],
        div [] [ text (greet model) ]

    ]


