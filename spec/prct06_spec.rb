RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end


	before :each do
		@etiqueta = InfoNutricional.new("Pan")
	end

	describe InfoNutricional do
		it "La etiqueta tiene nombre" do
			expect(@etiqueta.nombre_).to eq("Pan")
		end
	end

end
