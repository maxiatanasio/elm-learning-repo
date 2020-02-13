module LearningExamples.Counter exposing (..)

import Browser
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
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
    flexboxContainer True [
        div [ style "width" "100%"] [
                counterPanel model,
                flexboxContainer False [
                    fancyButton Increment "Increment",
                    fancyButton Decrement "Decrement",
                     fancyButton Reset "Reset"
                ]
            ]
    ]

fancyButton: Msg -> String -> Html Msg
fancyButton msg buttonText =
    button [
        onClick msg,
        style "font-size" "18px",
        style "border" "1px solid black",
        style "padding" "12px 20px",
        style "text-align" "center",
        style "margin" "15px",
        style "flex" "1"
    ] [ text buttonText]

flexboxContainer: Bool -> List(Html msg) -> Html msg
flexboxContainer verticalCenter children =
    if verticalCenter then
        div [style "display" "flex", style "align-items" "center", style "height" "100vh"] children
    else
        div [style "display" "flex"] children


counterPanel: Model -> Html msg
counterPanel model =
    div [
        style "text-align" "center",
        style "font-size" "24px",
        style "padding-bottom" "20px"
    ] [text (fromInt model)]
