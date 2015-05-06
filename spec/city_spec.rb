require('spec_helper')

describe (City) do

  describe("#name") do
    it("returns the city's name") do
      city = City.new({:name => "Portland", :id => nil})
      expect(city.name()).to(eq("Portland"))
    end
  end

  describe('#id') do
    it('returns the id')do
    city = City.new ({:name => "Portland", :id => 1})
    expect(city.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off empty") do
      expect(City.all()).to(eq([]))
    end
  end

end
