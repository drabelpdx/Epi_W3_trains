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
end
