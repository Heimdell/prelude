
module Control.Monad.State.Carrier where

open import Common
open import Control.Monad

record StateT (S : Set) (M : Set → Set) (A : Set) : Set where
  constructor %StateT
  field
    run-state : S → M (S × A)
open StateT public
