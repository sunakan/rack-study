# Hashはeachメソッドを実装済
# key/valueはString
class MyHeader
  def initialize(bodies)
    @bodies = bodies
  end
  def each
    yield "Content-Type", "text/plain"
    yield "Content-Length", @bodies.join.bytesize.to_s
  end
end

# Arrayはeachメソッドを実装済み
# 中身はString
class MyBody
  def initialize(bodies)
    @bodies = bodies
  end
  def each
   for v in @bodies
     yield v
   end
  end
end

# procはcallで呼び出し可能
app = proc do |env|
  status_code = 200
  bodies      = ["はろーRack", "こんにちは世界"]
  [
    status_code,
    MyHeader.new(bodies),
    MyBody.new(bodies)
  ]
end

run app
