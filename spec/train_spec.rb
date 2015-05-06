require('spec_helper')

describe(Train) do

  describe('#name') do
    it('returns the name') do
      train = Train.new({:name => 'Red Line', :id => nil})
      expect(train.name()).to(eq('Red Line'))
    end
  end

  describe('#id') do
    it('returns the id') do
    train = Train.new({:name => 'Red Line', :id => 1})
    expect(train.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off empty") do
      expect(Train.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a train by its id") do
      test_train = Train.new({:name => "Red Line", :id => nil})
      test_train.save()
      test_train2 = Train.new({:name => "Green Line", :id => nil})
      test_train2.save()
      expect(Train.find(test_train2.id())).to(eq(test_train2))
    end
  end

  describe("#==") do
    it("is the same train if it has the same name and id") do
      train = Train.new({:name => "Red Line", :id => nil})
      train2 = Train.new({:name => "Red Line", :id => nil})
      expect(train).to(eq(train2))
    end
  end

  describe('#update') do
    it('lets you update trains in the database') do
      train = Train.new({:name => "Red Line", :id => nil})
      train.save()
      train.update ({:name => "Green Line"})
      expect(train.name()).to(eq('Green Line'))
     end
   end
end
