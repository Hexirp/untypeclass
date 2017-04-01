{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Bifunctor where
  data Bifunctor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    Bifunctor ::
      { bimap :: (forall f g h i. cat1 f g -> cat2 h i -> dat (pro f g) (pro h i))
      } -> Bifunctor cat1 cat2 dat pro