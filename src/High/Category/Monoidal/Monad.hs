{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category.Monoidal.Monad where
  import High.Category.Monoidal (Monoidal)
  import NaturalTransformation (NaturalTransformation)

  newtype Compose f g x = Compose { outCompose :: f (g x) }

  data Monad :: (* -> * -> *) -> (* -> *) -> * where
    Monad ::
      { extend_monoidal :: Monoidal (NaturalTransformation cat cat) Compose f
      } -> Monad cat f
