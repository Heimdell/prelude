
module Control.Monad.State.Instances where

open import Common
open import Control.Monad
open import Control.Monad.State.Carrier
open import Control.Monad.Transformer.Class
open import Control.Applicative

instance
  state-is-transformer : Transformer (StateT B)
  state-is-transformer .lift ma .run-state state = ⦇ ⦇ state ⦈ , ma ⦈

  state-is-monad : {{Monad M}} → Monad (StateT B M)
  state-is-monad .return = lift ∘ pure
  state-is-monad .bind ma amb .run-state state = do
    state′ , a ← ma .run-state state
    amb a .run-state state′

open import Control.Alternative
open import Control.Choice

instance
  state-is-alternative : {{Alternative M}} → {{Monad M}} → Alternative (StateT B M)
  state-is-alternative .choose ma mb .run-state state = ma .run-state state <|> mb .run-state state
  state-is-alternative .loose                         = lift loose

open import Control.Monad.Catch.Class

instance
  state-catch : Catch (StateT A)
  state-catch .lift-catch catch ma k .run-state state = do
    catch (ma .run-state state) λ where
      e → k e .run-state state
