$soundcloud = Soundcloud.new(
  client_id: Rails.application.secrets.soundcloud_client_id,
  client_secret: Rails.application.secrets.soundcloud_client_secret
)

tracks_remaining = true
tracks = []
i = 0
while tracks_remaining
  likes = $soundcloud.get("/users/11039549/favorites", :limit => 100, :linked_partitioning => 1, offset: (100 * i)).first.last
  if likes.size > 0
    tracks << likes
    i += 1
  else
    tracks_remaining = false
  end
end
$tracks = tracks.flatten!.select { |t| t.streamable }
