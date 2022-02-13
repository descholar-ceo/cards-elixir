defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "deck of cards" do
    {created_hand, _} = Cards.create_hand(1)
    assert created_hand == ["One of Hearts"]
  end
end
