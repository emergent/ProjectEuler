module Main exposing (..)

import Array exposing (..)
import Browser
import Html exposing (Html, button, div, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Problems.List exposing (..)
import Task



-- MAIN


main =
    Browser.element { init = init, update = update, view = view, subscriptions = \_ -> Sub.none }



-- MODEL


type Status
    = Ready
    | Calculating


type alias Model =
    { status : Status
    , problem : Int
    , answer : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Ready 0 0, Cmd.none )



-- UPDATE


type Msg
    = Calculate Int
    | GotCalc Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Calculate problem ->
            ( { model | status = Calculating, problem = problem }
            , Task.succeed (solve problem) |> Task.perform GotCalc
            )

        GotCalc answer ->
            ( { model | status = Ready, answer = answer }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        (Array.indexedMap
            (\i _ ->
                div []
                    [ button [ onClick (Calculate (i + 1)) ] [ "Problem " ++ String.fromInt (i + 1) |> text ]
                    , span [ class "answer" ]
                        [ if model.problem == i + 1 then
                            case model.status of
                                Ready ->
                                    text (String.fromInt model.answer)

                                Calculating ->
                                    text "Calculating..."

                          else
                            text ""
                        ]
                    ]
            )
            (Array.fromList problems)
            |> Array.toList
        )
