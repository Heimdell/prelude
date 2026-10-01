
module Data.Eq where

open import Common

record Eq (A : Set) : Set where
  field
    _==_ : A → A → Bool
open Eq {{...}} public

module _ where

  open import Data.String.Properties renaming (_==_ to _==-s_)

  instance
    string-is-eq : Eq String
    string-is-eq ._==_ = _==-s_

module _ where

  open import Data.Char.Properties renaming (_==_ to _==-c_)

  instance
    char-is-eq : Eq Char
    char-is-eq ._==_ = _==-c_
