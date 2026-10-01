module Control.Alternative.Class where

open import Common
open import Control.Choice.Class
open import Control.Applicative.Class

record Alternative (F : Set → Set) : Set₁ where
  field
    {{applicative}} : Applicative F

  field
    choose : F A → F A → F A
    loose  : F A
open Alternative {{...}} public

open import Control.Monad
