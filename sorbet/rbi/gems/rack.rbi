# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rack/all/rack.rbi
#
# rack-3.0.9.1

module Rack
end
module Rack::Auth
end
module Rack::Auth::Digest
end
class Rack::Auth::Digest::Nonce
end
class Rack::Auth::Digest::Params < Hash
end
class Rack::Auth::Digest::Request < Rack::Auth::AbstractRequest
end
class Rack::Auth::Digest::MD5 < Rack::Auth::AbstractHandler
end