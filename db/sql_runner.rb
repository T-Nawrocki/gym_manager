require "pg"

class SqlRunner

    def self.run(sql, values = [])
        begin
            db = PG.connect({dbname: "gym", host: "localhost"})
            db.prepare("query", sql)
            result = db.exec_prepared("query", values)
        ensure
            db.close if db != nil
        end
        result
    end

    def self.convert_to_sql_array(array)
        "{#{array.join(",")}}"
    end

    def self.convert_to_ruby_array(string)
        string[1...-1].split(",")  # removes braces then splits on ","
    end

end
