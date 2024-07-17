defmodule Csv do
  def data do
    [~w(sort_code), ~w(12-34-56), ~w(78-90-12), ~w(34-56-78), ~w(90-12-34)]
  end

  def spreadsheet do
    data = NimbleCSV.Spreadsheet.dump_to_iodata(data())

    File.write!("spreadsheet.csv", data)
  end

  def rfc_4180 do
    data = NimbleCSV.RFC4180.dump_to_iodata(data())

    File.write!("rfc_4180.csv", data)
  end
end
