defmodule Device.InstrumentController do
  use Device.Web, :controller

  alias Device.Instrument

  def index(conn, _params) do
    instruments = Repo.all(Instrument)
    render(conn, "index.json", instruments: instruments)
  end

  def create(conn, %{"instrument" => instrument_params}) do
    changeset = Instrument.changeset(%Instrument{}, instrument_params)

    case Repo.insert(changeset) do
      {:ok, instrument} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", instrument_path(conn, :show, instrument))
        |> render("show.json", instrument: instrument)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Device.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    instrument = Repo.get!(Instrument, id)
    render(conn, "show.json", instrument: instrument)
  end

  def update(conn, %{"id" => id, "instrument" => instrument_params}) do
    instrument = Repo.get!(Instrument, id)
    changeset = Instrument.changeset(instrument, instrument_params)

    case Repo.update(changeset) do
      {:ok, instrument} ->
        render(conn, "show.json", instrument: instrument)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Device.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    instrument = Repo.get!(Instrument, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(instrument)

    send_resp(conn, :no_content, "")
  end
end
