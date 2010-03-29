class Model
  HOST = "http://127.0.0.1"
  PORT = "5984"  
  @@db = ""
  def self.find(id)
    return @@db.get(id)
  end
  def save(params)
    @@db.save_doc(params)
  end
end