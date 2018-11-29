defmodule Timedctl.CLI do
  @moduledoc """
  Documentation for Timedctl.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Timedctl.main(['hi','--screaming'])
      "hi!!!!!"
      iex> Timedctl.main(['hi','--upcase'])
      "HI"
      iex> Timedctl.main(['hi','--screaming', '--upcase'])
      "HI!!!!!"
      iex> Timedctl.main(['hi','--separator', 'el'])
      "heli"

  """
  def main(args) do
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(
        switches: [
          upcase: :boolean,
          screaming: :boolean,
          separator: :string,
          help: :boolean
        ]
      )

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    opts
    |> Enum.reduce(word, fn option, word ->
      case option do
        {:upcase, true} ->
          String.upcase(word)

        {:screaming, true} ->
          word <> "!!!!!"

        {:separator, sep_string} ->
          word
          |> String.split("", trim: true)
          |> Enum.join(sep_string)

        {:help, true} ->
          """
          Help:

            --upcase    :switch   - Print all in uppercase
            --screaming :switch   - Scream everything
            --separator :string - Seperate each character by :string

            --help      :switch        - Show this help
          """

        _ ->
          word
      end
    end)
  end
end
