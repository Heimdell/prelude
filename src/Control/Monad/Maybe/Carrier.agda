
module Control.Monad.Maybe.Carrier where

open import Common

record MaybeT (M : Set → Set) (A : Set) : Set where
  constructor %MaybeT
  field
    run-maybe : M (Maybe A)
open MaybeT public
