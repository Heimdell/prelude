
module Common.Definitions where

open import Function using (flip; _∘_; _|>_; id; _$_; const; constᵣ; case_of_) public

open import Data.Unit using (⊤; tt) public
open import Data.Bool using (Bool; true; false; _∧_; _∨_; not; if_then_else_) public
open import Data.Char using (Char) public
open import Data.List using (List; []; _∷_) public
open import Data.Vec using (Vec; []; _∷_; lookup) public
open import Data.Product using (_×_; _,_; proj₁; proj₂) public
open import Data.Sum using (_⊎_; inj₁; inj₂; [_,_]′) public
open import Data.Maybe using (Maybe; just; nothing; maybe) public
open import Relation.Binary.PropositionalEquality using (cong; _≡_; refl; sym) public
open import Data.Nat using (ℕ; suc; zero; _∸_) renaming (_+_ to _+-ℕ_) public
open import Data.Fin using (Fin; suc; zero) public
open import Data.String using (String; uncons; fromList) renaming (length to strlen) public
open import Data.List.Membership.Propositional using (_∈_) public

open import Common.Variables

⊎-elim : (A → C) → (B → C) → A ⊎ B → C
⊎-elim f g = λ where
  (inj₁ a) → f a
  (inj₂ b) → g b

module _ where

  open import Data.List using (_++_; length)
  open import Data.List.Membership.Propositional
  open import Data.List.Relation.Unary.Any

  split-ptr : {Δ Γ : List A} {a : A} → a ∈ (Δ ++ Γ) → a ∈ Γ ⊎ a ∈ Δ
  split-ptr {Δ = []}     ptr        = inj₁ ptr
  split-ptr {Δ = x ∷ Δ} (here refl) = inj₂ (here refl)
  split-ptr {Δ = x ∷ Δ} (there ptr) = [ inj₁ , inj₂ ∘ there ]′ (split-ptr ptr)

  index-of : {A : Set} {n : A} {Δ : List A} → n ∈ Δ → Fin (length Δ)
  index-of (here refl) = zero
  index-of (there ptr) = suc (index-of ptr)

  weaken-ptr : {A : Set} {Δ Γ : List A} {a : A} → a ∈ Γ → a ∈ (Δ ++ Γ)
  weaken-ptr {Δ = []}    ptr = ptr
  weaken-ptr {Δ = x ∷ Δ} ptr = there (weaken-ptr ptr)

  weaken-ptr-r : {A : Set} {Δ Γ : List A} {a : A} → a ∈ Γ → a ∈ (Γ ++ Δ)
  weaken-ptr-r (here  refl) = here   refl
  weaken-ptr-r (there ptr)  = there (weaken-ptr-r ptr)

module _ where

  open import Data.String using (_++_)

  take : ℕ → String → String
  take  zero   str = ""
  take (suc n) str = case uncons str of λ where
    (just (c , s)) → fromList (c ∷ []) ++ take n s
    nothing        → ""
