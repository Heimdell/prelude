module Control.Traversable.Methods where

open import Common

open import Control.Traversable.Class
open import Control.Applicative.Class

for : {{Traversable F}} → {{Applicative M}} → F A → (A → M B) → M (F B)
for = flip traverse
