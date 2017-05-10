{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

-- | Category's module.
module Category
  ( Category
  , toSemigroupoid
  , toIdmorphism
  , fromSemigroupoid
  , Idmorphism
  , Composing(..)
  , composing
  , reComposed
  , append
  , composingIdmorphism
  , composingSemigroupoid
  , composingCategory
  ) where
  import Data.Function (($))
  import Semigroupoid (Semigroupoid)
  
  -- | Composition and identity morphism.
  --
  -- 'Category' inherits 'Semigroupoid' and its laws by 'toSemigroupoid'.
  type Category cat = forall a b. Composing cat a b -> cat a b

  -- | Convert 'Category' to 'Semigroupoid'.
  toSemigroupoid :: Category cat -> Semigroupoid cat
  toSemigroupoid cat lar rar = cat $ Composed lar $ Composed rar $ Id
  
  -- | Convert 'Category' to 'Idmorphism'.
  toIdmorphism :: Category cat -> Idmorphism cat
  toIdmorphism cat = cat Id

  -- | Make 'Category' from 'Idmorphism' and 'Semigroupoid'.
  fromSemigroupoid :: Idmorphism cat -> Semigroupoid cat -> Category cat
  fromSemigroupoid = composing 
  
  -- | Identity morphism.
  type Idmorphism cat = forall a. cat a a

  -- | Composition of morphisms.
  data Composing :: (* -> * -> *) -> * -> * -> * where
    Id :: Composing cat a a
    Composed :: cat b c -> Composing cat a b -> Composing cat a c

  -- | Fold 'Composing'.
  composing
    :: (forall a. r a a)
    -> (forall a b c. cat b c -> r a b -> r a c)
    -> Composing cat a b -> r a b
  composing i _ Id = i
  composing i c (Composed x xs) = x `c` composing i c xs

  -- | Compose a morphism from the right.
  reComposed :: Composing cat b c -> cat a b -> Composing cat a c
  reComposed Id y = Composed y Id
  reComposed (Composed x xs) y = Composed x $ reComposed xs y
  
  -- | Compose two morphisms.
  append :: Composing cat b c -> Composing cat a b -> Composing cat a c
  append Id y = y
  append (Composed x xs) y = Composed x $ append xs y
  
  -- | 'Idmorphism' of 'Composing'
  composingIdmorphism :: Idmorphism (Composing cat)
  composingIdmorphism = Id
  
  -- | 'Semigroupoid' of 'Composing'
  composingSemigroupoid :: Semigroupoid (Composing cat)
  composingSemigroupoid = append
  
  -- | 'Category' of 'Composing'.
  composingCategory :: Category (Composing cat)
  composingCategory = fromSemigroupoid Id append
