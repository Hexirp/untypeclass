{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category.Monoidal.Monad.Monad where
  import High.Category.Monoidal.Monad (Monad)

  type Hask = (->)

  data Monad :: (* -> *) -> * where
    Monad ::
      { extend_monad :: Monad Hask f
      } -> Monad f
