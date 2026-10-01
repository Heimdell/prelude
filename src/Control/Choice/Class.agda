module Control.Choice.Class where

open import Common

record Choice (F : Set → Set) : Set₁ where
  field
    choice : F A → F A → F A
open Choice {{...}} public

_<|>_ : {{Choice F}} → F A → F A → F A
_<|>_ = choice
infixl 3 _<|>_
