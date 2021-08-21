# 画像を返すアプリ
class ImageApp
  def call(env)
    path = "./sample-image.jpg"
    file = File.open(path, "rb")
    [
      200,
      { "Content-Type" => "image/jpeg" },
      file,
    ]
  end
end

run ImageApp.new
