
module Control.Monad.Class where

open import Common

record Monad (F : Set → Set) : Set₁ where
  field
    return : A → F A
    bind   : F A → (A → F B) → F B
open Monad {{...}} public

_>>=_ : {{Monad F}} → F A → (A → F B) → F B
_>>=_ = bind

infixl 4 _>>=_
