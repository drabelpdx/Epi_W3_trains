class Train

attr_reader(:name, :id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains =[]
    returned_trains.each() do |train|
      name = train.fetch('name')
      id = train.fetch('id').to_i()
      trains.push(Train.new({:name => name, :id => id}))
     end
    trains
   end

   define_method(:save) do
     result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
     @id = result.first().fetch('id').to_i()
   end

   define_singleton_method(:find) do |id|
     @id = id
     result = DB.exec("SELECT * FROM trains WHERE id = #{@id};")
     @name = result.first().fetch('name')
     Train.new({:name => @name, :id => @id})
   end

   define_method(:==) do |another_train|
     self.name().==(another_train.name()).&(self.id().==(another_train.id()))
    end

    define_method(:update) do |attributes|
      @name = attributes.fetch(:name, @name)
      @id = self.id()
      DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
    end

    define_method(:delete) do
      DB.exec("DELETE FROM trains WHERE id = #{self.id()};")
    end
end
