module LearningExamples.ErrorHandling exposing (..)

import Browser
import Html exposing (Html, div, input, text, label, span)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (isEmpty)

type MaybeName = Name String | InvalidName

type alias Model = MaybeName

init: Model
init = Name ""

type Msg = Change String
update: Msg -> Model -> Model
update msg model =
    case msg of
        Change name ->
            validateName name

validateName: String -> MaybeName
validateName name =
    if isEmpty name then
        InvalidName
    else
        Name name

view: Model -> Html Msg
view model =
    div [] [
        label [] [text "Name: "],
        input [onInput Change] [],
        (
        case model of
            Name name ->
                text ""
            InvalidName ->
                span [] [text "Name is required"]
        )
    ]

main = Browser.sandbox { init=init, update=update, view=view}
