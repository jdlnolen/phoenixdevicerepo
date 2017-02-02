defmodule Device.InstrumentView do
  use Device.Web, :view

  def render("index.json", %{instruments: instruments}) do
    %{data: render_many(instruments, Device.InstrumentView, "instrument.json")}
  end

  def render("show.json", %{instrument: instrument}) do
    %{data: render_one(instrument, Device.InstrumentView, "instrument.json")}
  end

  def render("instrument.json", %{instrument: instrument}) do
    %{id: instrument.id,
      name: instrument.name,
      value: instrument.value}
  end
end
