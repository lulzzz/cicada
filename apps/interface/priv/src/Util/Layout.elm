module Util.Layout exposing(..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Material
import Material.Button as Button
import Material.Options exposing (css)
import Material.Color as Color
import Material.Card as Card
import Material.Icon as Icon
import Material.Typography as Typography
import Material.Grid exposing (grid, cell, size, Device(..))
import Material.Options as Options exposing (Style)
import Material.Elevation as Elevation
import Msg exposing (Msg)

white : Options.Property c m
white =
  Color.text Color.white

card : String -> String -> List (Html a) -> List (Style a) -> Material.Grid.Cell a
card header subhead content styles =
  let
    c = List.concat
      [ [ Options.styled p [ Typography.title, white ] [ text header ]
        , Options.styled p [ Typography.caption, Typography.contrast 0.87, white ] [ text subhead ]
        ]
        , content
      ]
    styles = List.concat
      [ styles
        , [ Material.Grid.size All 4
          , Color.background (Color.color Color.BlueGrey Color.S400)
          , css "height" "300px"
          , css "padding" "13px"
          , css "border-radius" "2px"
          , Elevation.e3
          ]
      ]
  in
    cell styles c
