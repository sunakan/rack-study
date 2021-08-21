class HelloRackApp
  # callメソッドはenvを受け取り、3つの値(StatusCode, Headers, Body)を配列として返す
  # @params [Hash] env
  # @return [Array]
  def call(env)
    puts '-------------'
    env.keys.sort.each.with_index { |k, i|
      puts "#{(i+1).to_s.rjust(2, '0')}."
      puts "  key: #{k}"
      puts "  value型: #{env[k].class}"
      puts "  value例: #{env[k]}"
      #{env[k].class}]の#{env[k]}"
    }
    puts '-------------'
    status_code      = 200
    response_headers = { "Content-Type" => "text/plain" }
    response_body    = ["Hello Rack!"]
    [status_code, response_headers, response_body]
  end
end

run HelloRackApp.new

################################################################################
# Note(envについて)
# env.class => Hash
################################################################################
# https://github.com/rack/rack/blob/master/SPEC.rdoc#label-The+Environment
#
# 環境変数は、空の場合を除いて、以下の変数を含むように要求されます
# `env.keys.each { |k| puts k }` とかすると、 30個のkeyが並ぶ
#
# 01.
#   key: GATEWAY_INTERFACE
#   value型: String
#   value例: CGI/1.2
# 02.
#   key: HTTP_ACCEPT
#   value型: String
#   value例: */*
# 03.
#   key: HTTP_HOST
#   value型: String
#   value例: localhost:9292
# 04.
#   key: HTTP_USER_AGENT
#   value型: String
#   value例: curl/7.64.1
# 05.
#   key: HTTP_VERSION
#   value型: String
#   value例: HTTP/1.1
# 06.
#   key: PATH_INFO
#   value型: String
#   value例: /
# 07.
#   key: QUERY_STRING
#   value型: String
#   value例:
# 08.
#   key: REMOTE_ADDR
#   value型: String
#   value例: 172.21.0.1
# 09.
#   key: REQUEST_METHOD
#   value型: String
#   value例: GET
# 10.
#   key: REQUEST_PATH
#   value型: String
#   value例: /
# 11.
#   key: REQUEST_URI
#   value型: String
#   value例: /
# 12.
#   key: SCRIPT_NAME
#   value型: String
#   value例:
# 13.
#   key: SERVER_NAME
#   value型: String
#   value例: localhost
#
# SCRIPT_NAMEやPATH_INFOと組み合わせることで、URLを完成させることが可能
# ただし、HTTP_HOSTが存在する場合、リクエストURLの再構築にはSERVER_NAMEよりもHTTP_HOSTを優先して使用するので注意が必要。
# SERVER_NAMEは空の文字列にすることはできない(絶対必要)
#
# 14.
#   key: SERVER_PORT
#   value型: String
#   value例: 9292
#
# オプションの整数で、サーバーが稼働しているポートを指定します。
# サーバーが標準外のポートで動作している場合に指定します。
#
# 15.
#   key: SERVER_PROTOCOL
#   value型: String
#   value例: HTTP/1.1
# 16.
#   key: SERVER_SOFTWARE
#   value型: String
#   value例: puma 5.4.0 Super Flight
# 17.
#   key: puma.config
#   value型: Puma::Configuration
#   value例: #<Puma::Configuration:0x00005622f6883dc0>
# 18.
#   key: puma.request_body_wait
#   value型: Integer
#   value例: 0
# 19.
#   key: puma.socket
#   value型: TCPSocket
#   value例: #<TCPSocket:0x00005622f68a6050>
# 20.
#   key: rack.after_reply
#   value型: Array
#   value例: []
# 21.
#   key: rack.errors
#   value型: Rack::Lint::ErrorWrapper
#   value例: #<Rack::Lint::ErrorWrapper:0x00007f089401b550>
# 22.
#   key: rack.hijack
#   value型: Proc
#   value例: #<Proc:0x00007f089401b960 /usr/local/bundle/gems/rack-2.2.3/lib/rack/lint.rb:567>
# 23.
#   key: rack.hijack?
#   value型: TrueClass
#   value例: true
# 24.
#   key: rack.input
#   value型: Rack::Lint::InputWrapper
#   value例: #<Rack::Lint::InputWrapper:0x00007f089401b640>
# 25.
#   key: rack.multiprocess
#   value型: FalseClass
#   value例: false
# 26.
#   key: rack.multithread
#   value型: TrueClass
#   value例: true
# 27.
#   key: rack.run_once
#   value型: FalseClass
#   value例: false
# 28.
#   key: rack.tempfiles
#   value型: TrueClass
#   value例: true
# 24.
#   key: rack.input
#   value型: Rack::Lint::InputWrapper
#   value例: #<Rack::Lint::InputWrapper:0x00007f089401b640>
# 25.
#   key: rack.multiprocess
#   value型: FalseClass
#   value例: false
# 26.
#   key: rack.multithread
#   value型: TrueClass
#   value例: true
# 27.
#   key: rack.run_once
#   value型: FalseClass
#   value例: false
# 28.
#   key: rack.tempfiles
#   value型: Array
#   value例: []
# 29.
#   key: rack.url_scheme
#   value型: String
#   value例: http
# 30.
#   key: rack.version
#   value型: Array
#   value例: [1, 6]
