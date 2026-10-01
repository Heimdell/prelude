
module Control.Monad.State.Methods where

open import Common
open import Control.Applicative
open import Control.Monad
open import Control.Monad.State.Carrier

get : {{Monad M}}     → StateT A M A
put : {{Monad M}} → A → StateT A M ⊤

get       .run-state state = pure (state , state)
put state .run-state _     = pure (state , _)
