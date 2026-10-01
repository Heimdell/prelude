module Control.Choice.Deriving where

open import Common
open import Control.Choice.Class

open import Control.Alternative.Class

instance
  choice←alternative : {{Alternative F}} → Choice F
  choice←alternative .choice = choose

{-# INCOHERENT choice←alternative #-}
