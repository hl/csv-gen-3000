defmodule Csv do
  NimbleCSV.define(Custom, separator: "\t", escape: "\"")

  def data do
    [
      ~w(account_name sort_code),
      ~w(account1 24-08-99),
      ~w(account1 '12-04-20'),
      ~w(account2 "03-09-12"),
      ~w(account3 `14-10-78),
      ~w(account4 '14-10-78),
      ["account5", " 11-12-13"]
    ]
  end

  def spreadsheet do
    data = NimbleCSV.Spreadsheet.dump_to_iodata(data())

    File.write!("spreadsheet.csv", data)
  end

  def rfc_4180 do
    data = NimbleCSV.RFC4180.dump_to_iodata(data())

    File.write!("rfc_4180.csv", data)
  end

  def custom do
    data = Custom.dump_to_iodata(data())

    File.write!("custom.csv", data)
  end
end
