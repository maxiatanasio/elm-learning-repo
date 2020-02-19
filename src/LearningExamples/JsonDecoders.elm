module LearningExamples.JsonDecoders exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Json.Decode exposing (Decoder, decodeString,map4,map2,field, string, int, bool, list, errorToString)

-- Main
main =
    case  decodeString personDecoder "{\"name\":\"Tom\",\"age\":42,\"isStudent\":true,\"friends\":[{\"id\":1,\"name\":\"Maxi\"},{\"id\":2,\"name\":\"Benja\"},{\"id\":3,\"name\":\"Felipe\"}]}"
    of
        Ok person ->
            view person

        Err error ->
            text (errorToString error)

-- Model
type alias Person =
    { name: String
    , age: Int
    , isStudent: Bool
    , friends: List Friend}

type alias Friend =
    { id: Int
    , name: String}

-- View
view: Person -> Html String
view person =
    div [ style "text-align" "center"] [
        h1 [] [text person.name],
        h2 [] [text (String.fromInt person.age)],
        if person.isStudent then
            h2[] [text "Is Student"]
        else
            h2 [] [text "Is not a student"],
        ul [] (List.map friendItem person.friends)
    ]

friendItem: Friend -> Html String
friendItem friend =
    li [] [text friend.name]

-- Decoders
personDecoder: Decoder Person
personDecoder =
    map4 Person
        (field "name" string)
        (field "age" int)
        (field "isStudent" bool)
        (field "friends" (list friendDecoder))

friendDecoder: Decoder Friend
friendDecoder =
    map2 Friend
        (field "id" int)
        (field "name" string)
