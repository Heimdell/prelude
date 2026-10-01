
module Control.Monad.Catch.Class where

open import Common
open import Control.Monad.Class
open import Control.Monad.Transformer.Class

record Catch (T : (Set → Set) → Set → Set) : Set where
  field
    lift-catch :
      {{_     : Monad M}}
      ( catch : {A : Set} → M A → (E → M A) → M A)
      ( tma   : T M A)
      ( e→tma : E → T M A)
              → T M A
open Catch {{...}} public
