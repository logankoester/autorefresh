require 'pusher'

# Automatically refresh your browser using WebSockets
class AutoRefresh
  @@pusher_key = 'a2024b659f492cab86cc'
  @@pusher_app_id = '3735'
  @@pusher_secret = '3ce64d76b4288e4ba449'

  def self.channel(chan)
    %q{
      <script src="http://js.pusherapp.com/1.6/pusher.js" type="text/javascript"></script>
      <script type="text/javascript">
        var pusher = new Pusher('PUSHER_KEY');
        pusher.subscribe('CHANNEL');
        pusher.bind('refresh', function(data) {
          location.reload(true);
        });
      </script>
    }.gsub(/CHANNEL/, chan).gsub(/PUSHER_KEY/, @@pusher_key)
  end

  def self.refresh(chan)
    Pusher.app_id = @@pusher_app_id
    Pusher.key = @@pusher_key
    Pusher.secret = @@pusher_secret
    Pusher[chan].trigger('refresh', {})
  end
end
