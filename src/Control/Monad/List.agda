
module Control.Monad.List where

open import Common

record ListT (M : Set → Set) (A : Set) : Set where
  inductive
  field
    run-list : (A → M B → M B) → M B → M B
open ListT public

open import Control.Monad
open import Control.Monad.Transformer.Class
open import Control.Alternative
open import Control.Choice
open import Control.Applicative

mutual
  instance
    list-t-is-transformer : Transformer ListT
    list-t-is-transformer .lift ma .run-list cons nil = do
      a ← ma
      cons a nil

    list-t-is-monad : {{Monad M}} → Monad (ListT M)
    list-t-is-monad .return = lift ∘ pure
    list-t-is-monad .bind ma amb .run-list cons nil = do
      ma .run-list
        (λ hd tl → amb hd .run-list cons tl)
                   nil

    list-t-is-alternative : {{Monad M}} → Alternative (ListT M)
    list-t-is-alternative .loose        .run-list cons nil = nil
    list-t-is-alternative .choose ma mb .run-list cons nil = do
      ma .run-list cons (mb .run-list cons nil)

observe : {{Applicative M}} → ListT M A → M (List A)
observe ma = do
  ma .run-list
    (λ hd tl → ⦇ ⦇ hd ⦈ ∷ tl ⦈)
               ⦇ [] ⦈

observe-first : {{Applicative M}} → ListT M A → M (Maybe A)
observe-first ma = do
  ma .run-list
    (λ hd tl → ⦇ (just hd) ⦈)
               ⦇ nothing ⦈
