defmodule InfoSys.Counter do
  def inc(pid), do: send(pid, :inc) # 非同期、返事を待たない

  def dec(pid), do: send(pid, :dec) # 非同期、返事を待たない

  def val(pid, timeout \\ 5000) do
    ref = make_ref() # グローバルにユニークな値、受付番号みたいなもん
    send(pid, {:val, self(), ref})

    receive do # 同期、返事を待つ
      {^ref, val} -> val # 同じRefが返ってきてるか照会する
    after
        timeout -> exit(:timeout)
    end
  end

  def start_link(initial_val) do
    {:ok, spawn_link(fn -> listen(initial_val) end)}
  end

  defp listen(val) do
    receive do
      :inc ->
        listen(val+1)

      :dec ->
        listen(val-1)

      {:val, sender, ref} ->
        send(sender,{ref,val})
        listen(val)
    end
  end
end
