require('spec_helper')

describe (City) do

  describe("#name") do
    it("returns the city's name") do
      city = City.new({:name => "Portland", :id => nil})
      expect(city.name()).to(eq("Portland"))
    end
  end



end
