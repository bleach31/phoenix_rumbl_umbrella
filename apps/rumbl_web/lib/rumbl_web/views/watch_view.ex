#---
# Excerpted from "Programming Phoenix 1.4",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix14 for more book information.
#---
defmodule RumblWeb.WatchView do
  use RumblWeb, :view

  def player_id(video) do
    ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}
    |> Regex.named_captures(video.url)
    |> get_in(["id"])
    # こうでいいじゃん
    # pattern = ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}
    # hoge = Regex.named_captures(pattern,video.url);
    # hoge["id"]
  end
end
