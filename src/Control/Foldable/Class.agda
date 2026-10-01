module Control.Foldable.Class where

open import Common

record Foldable (F : Set → Set) : Set₁ where
  field
    fold-r : (A → B → B) → B → F A → B
open Foldable {{...}} public
