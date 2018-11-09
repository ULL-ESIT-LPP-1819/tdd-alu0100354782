RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end

	#it "does something useful" do
    #	expect(true).to eq(true)
	#end


	before :each do
		@etiqueta = InfoNutricional.new("Pan", 70)
	end

	describe InfoNutricional do
		it "La etiqueta tiene nombre" do
			expect(@etiqueta.nombre_).to eq("Pan")
		end
		
		it "Debe existir la candidad de grasas" do
			expect(@etiqueta.grasas_).to eq(70)
		end
	end

end
