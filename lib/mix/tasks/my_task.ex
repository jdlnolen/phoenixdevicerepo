defmodule Mix.Tasks.Device.MyTask do
  use Timex

  @shortdoc "basic task"

  def cull do
  #IO.puts("hello")
    curmin = rem(Timex.now.minute,10)
    valout = case curmin do
      1 -> 3
      0 -> 3
      1 -> 3
      2 -> 6
      3 -> 4
      4 -> 6
      5 -> 7
      6 -> 8
      7 -> 6
      8 -> 5 
      9 -> 3 
    end
    # IO.puts(Integer.to_string(valout))
    upitem = Device.Instrument |> Device.Repo.get(1)
    changeset = Device.Instrument.changeset(upitem, %{value: valout})
    Device.Repo.update(changeset)
    IO.puts("cull task ran ")
  end
end
