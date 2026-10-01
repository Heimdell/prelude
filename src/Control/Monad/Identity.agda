
module Control.Monad.Identity where

open import Common
open import Control.Monad

record Identity (A : Set) : Set where
  constructor %Identity
  field
    run-identity : A
open Identity public

instance
  identity-is-monad : Monad Identity
  identity-is-monad .return a               = %Identity a
  identity-is-monad .bind (%Identity a) amb = amb a
