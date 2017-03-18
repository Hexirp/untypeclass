{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Monoidal
  ( Monoidal(Monoidal)
  , sourceMonoidal
  , targetMonoidal
  , extend_functor
  , unit
  , product
  ) where
  import qualified Category.Monoidal as C (Monoidal)
  import Functor (Functor)

  data Monoidal :: (* -> * -> *) -> (* -> * -> *) -> * -> (* -> * -> *) -> (* -> * -> *) -> * -> (* -> *) -> * where
    Monoidal ::
      { sourceMonoidal :: C.Monoidal cat pro i
      , targetMonoidal :: C.Monoidal dat qro j
      , extend_functor :: Functor cat dat f
      , unit :: dat j (f i)
      , product :: (forall a b. qro (f a) (f b) -> f (pro a b))
      } -> Monoidal cat pro i dat qro j f
