module Msg exposing(..)

import Material
import Model.Lights exposing(LightInterface)
import Time exposing (Time)
import Util.ColorPicker exposing (..)
import Dict exposing(Dict)
import Http
import Model.DeviceMetrics exposing(..)

type Msg
  = DeviceEvent String
  | SelectTab Int
  | Tick Time
  | Mdl (Material.Msg Msg)
  | ShowColorPicker String
  | HideColorPicker String
  | LightOn String
  | LightOff String
  | GotColor ColorData
  | DeviceMetricsSucceed DeviceMetrics
  | DeviceMetricsFail Http.Error
