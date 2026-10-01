
module Control.Applicative.Deriving where

open import Common
open import Control.Applicative.Class
open import Control.Monad.Class

instance
  applicative←monad : {{Monad F}} → Applicative F
  applicative←monad .pure   = return
  applicative←monad .ap f x = bind f λ f → bind x λ x → return (f x)

{-# INCOHERENT applicative←monad #-}
