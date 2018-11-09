RSpec.describe Prct06 do
  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

  describe InfoNutricional do
	before :each do
	  @info = InfoNutricional.new("nombre")
	end
  end

end
