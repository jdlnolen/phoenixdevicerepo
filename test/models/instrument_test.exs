defmodule Device.InstrumentTest do
  use Device.ModelCase

  alias Device.Instrument

  @valid_attrs %{name: "some content", value: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Instrument.changeset(%Instrument{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Instrument.changeset(%Instrument{}, @invalid_attrs)
    refute changeset.valid?
  end
end
