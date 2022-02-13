defmodule Cards do
  @moduledoc """
    It gives functions to creat, handle and deal with deck of cards
  """

  @doc """
    It creates a deck and retruns card comprhended to values
  """
  def create_deck do
    values = ["One", "Two", "Three", "Four", "Five", "Six"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end

  @doc """
    It creates hand depending on the hand_size you pass it
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    It saves deck of cards in a file with the name you passed it
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    It reads the filename you pass it as argument
  """
  def read_file(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "Faled to read that file"
    end
  end

  @doc """
    It creates a hand depending on the handsize you pass it

    ## Examples
        iex> cards = Cards.create_deck
        iex> {hand, _} = Cards.create_hand(1)
        iex> hand
        ["One of Hearts"]
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.deal(hand_size)
  end
end
