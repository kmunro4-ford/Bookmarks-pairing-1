require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @conn = PG.connect(dbname: dbname)
  end

  def self.conn
    @conn
  end

  def self.query(sql)
    @conn.exec(sql)
  end
end
