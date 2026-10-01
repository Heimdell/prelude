
module Control.Monad.Error.Carrier where

open import Common
open import Control.Monad

record ErrorT (E : Set) (M : Set → Set) (A : Set) : Set where
  constructor %StateT
  field
    run-error : M (A ⊎ E)
open ErrorT public
