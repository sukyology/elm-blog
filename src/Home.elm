module Home exposing (main)


import Html exposing (..)
import Html.Attributes exposing (..)

view model = div [class "contents"] [
    h1 [] [text "HOME"]
    , div [id "thumbnails"] []
    ]

--starting function always have to be named main
main = view "no model yet"