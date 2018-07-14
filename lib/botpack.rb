require "botpack/version"

require "unicode"
require "dotenv/load"
require "telegram/bot"

require_relative "core_ext/class"
require_relative "core_ext/string"

require_relative "botpack/answer"
require_relative "botpack/listener"
require_relative "botpack/responder"
require_relative "botpack/tracker"

require_relative "botpack/botan"
require_relative "botpack/botan/api"

module Botpack
end
