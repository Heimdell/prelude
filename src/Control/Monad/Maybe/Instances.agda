
module Control.Monad.Maybe.Instances where

open import Common

open import Control.Monad
open import Control.Applicative
open import Control.Alternative
open import Control.Monad.Transformer.Class
open import Control.Monad.Catch.Class
open import Control.Monad.Maybe.Carrier

instance
  maybe-t-is-transformer : Transformer MaybeT
  maybe-t-is-transformer .lift ma .run-maybe = ⦇ just ma ⦈

  maybe-t-is-monad : {{Monad M}} → Monad (MaybeT M)
  maybe-t-is-monad .return a    .run-maybe = pure (just a)
  maybe-t-is-monad .bind ma amb .run-maybe = do
    ma .run-maybe >>= λ where
      nothing  → pure nothing
      (just a) → amb a .run-maybe

  maybe-t-is-alternative : {{Monad M}} → Alternative (MaybeT M)
  maybe-t-is-alternative .loose        .run-maybe = pure nothing
  maybe-t-is-alternative .choose ma mb .run-maybe = do
    ma .run-maybe >>= λ where
      nothing  → mb .run-maybe
      (just a) → pure (just a)

  maybe-t-is-catch : Catch MaybeT
  maybe-t-is-catch .lift-catch catch ma e→mb .run-maybe = do
    catch (ma .run-maybe) (run-maybe ∘ e→mb)
