
module Control.Monad.Transformer.Class where

open import Common
open import Control.Monad

record Transformer (T : (Set → Set) → Set → Set) : Set₁ where
  field
    lift : {{Monad M}} → M A → T M A
open Transformer {{...}} public
