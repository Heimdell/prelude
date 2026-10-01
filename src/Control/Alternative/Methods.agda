
module Control.Alternative.Methods where

open import Common

open import Control.Applicative
open import Control.Choice
open import Control.Foldable

open import Control.Alternative.Class
open import Control.Alternative.Instances

asum : {{Foldable F}} → {{Alternative M}} → F A → M A
asum = fold-r (choose ∘ pure) loose

backtrack : {{Foldable F}} → {{Alternative M}} → (A → M B) → F A → M B
backtrack f = fold-r (_<|>_ ∘ f) loose

guard : {{Alternative F}} → Bool → F ⊤
guard = λ where
  false → loose
  true  → pure _

{-# TERMINATING #-}
many some : {{Alternative F}} → F A → F (List A)
many a = ⦇ id (some a) | [] ⦈
some a = ⦇ a ∷ many a ⦈

sep-by¹ sep-by : {{Alternative F}} → F A → F B → F (List A)
sep-by¹ a sep = ⦇ a ∷ many (sep *> a) ⦈
sep-by  a sep = ⦇ a ∷ many (sep *> a) | [] ⦈
