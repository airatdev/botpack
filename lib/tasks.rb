desc 'Start bot'
task :start
  Botpack::Listener.new(ENV["TELEGRAM_TOKEN"], ENV["BOTAN_TOKEN"], Logger.new($stderr)).start
end
