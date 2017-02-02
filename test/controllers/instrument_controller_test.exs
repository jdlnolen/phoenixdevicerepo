defmodule Device.InstrumentControllerTest do
  use Device.ConnCase

  alias Device.Instrument
  @valid_attrs %{name: "some content", value: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, instrument_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    instrument = Repo.insert! %Instrument{}
    conn = get conn, instrument_path(conn, :show, instrument)
    assert json_response(conn, 200)["data"] == %{"id" => instrument.id,
      "name" => instrument.name,
      "value" => instrument.value}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, instrument_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, instrument_path(conn, :create), instrument: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Instrument, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, instrument_path(conn, :create), instrument: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    instrument = Repo.insert! %Instrument{}
    conn = put conn, instrument_path(conn, :update, instrument), instrument: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Instrument, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    instrument = Repo.insert! %Instrument{}
    conn = put conn, instrument_path(conn, :update, instrument), instrument: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    instrument = Repo.insert! %Instrument{}
    conn = delete conn, instrument_path(conn, :delete, instrument)
    assert response(conn, 204)
    refute Repo.get(Instrument, instrument.id)
  end
end
