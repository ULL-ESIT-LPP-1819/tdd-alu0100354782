RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end

	#it "does something useful" do
    #	expect(true).to eq(true)
	#end


	before :each do
		@etiqueta = InfoNutricional.new("Pan", 70, 20, 260, 90, 50, 6, 8400)
	end

	describe InfoNutricional do
		it "La etiqueta tiene nombre" do
			expect(@etiqueta.nombre_).to eq("Pan")
		end
		
		it "Debe existir la candidad de grasas" do
			expect(@etiqueta.grasas_).to eq(70)
		end

		it "Debe existir la candidad de grasas saturadas" do
			expect(@etiqueta.grasas_saturadas_).to eq(20)
		end

		it "Debe existir la candidad de hidratos de carbono" do
			expect(@etiqueta.hidratos_).to eq(260)
		end

		it "Debe existir la candidad de azúcares" do
			expect(@etiqueta.azucares_).to eq(90)
		end

		it "Debe existir la candidad de proteínas" do
			expect(@etiqueta.proteinas_).to eq(50)
		end

		it "Debe existir la candidad de sal" do
			expect(@etiqueta.sal_).to eq(6)
		end

		it "Existe un método para obtener el nombre" do
			expect(@etiqueta.get_nombre).to eq("Pan")
		end

		it "Existe un método para obtener el valor energético" do
			expect(@etiqueta.get_val_energetico).to eq(8400)
		end

		it "Existe un método para obtener la cantidad de grasas" do
			expect(@etiqueta.get_grasas).to eq(70)
		end

		it "Existe un método para obtener la cantidad de grasas saturadas" do
			expect(@etiqueta.get_grasas_saturadas).to eq(20)
		end

		it "Existe un método par obtener la cantidad de hidratos de carbono" do
			expect(@etiqueta.get_hidratos).to eq(260)
		end

	end

end
