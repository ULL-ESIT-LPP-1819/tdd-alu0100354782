RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end

	#it "does something useful" do
    #	expect(true).to eq(true)
	#end


	before :each do
		@etiqueta = InfoNutricional.new("Pan", 70, 20, 260, 90, 50, 6, 10,5,10,20,10,5,3)
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

		it "Existe un método para obtener el valor energético en kJ" do
			expect(@etiqueta.get_val_energetico_kj).to eq(9085)
		end

		it "Existe un método para obtener el valor energético en kcal" do
			expect(@etiqueta.get_val_energetico_kcal).to eq(2165)
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
		
		it "Existe un método para obtener la cantidad de azúcares" do
			expect(@etiqueta.get_azucares).to eq(90)
		end

		it "Existe un método para obtener la cantidad de proteínas" do
			expect(@etiqueta.get_proteinas).to eq(50)
		end

		it "Existe un método para obtener la cantidad de sal" do
			expect(@etiqueta.get_sal).to eq(6)
		end

		it "Existe un método para obtener la ingesta de referencia" do
			expect(@etiqueta.ingesta_referencia(@etiqueta.proteinas_)).to eq(8)
		end

		it "Existe un método para obtener la etiqueta formateada" do
			expect(@etiqueta.to_s).to be_a(String)
		end
	end

	before :each do
		@chocolate = InfoNutricional.new("Tableta de chocolate", 70, 20, 260, 90, 50, 6, 10,5,10,20,10,5,3)
		@yogur = InfoNutricional.new("Yogur", 25, 20, 150, 90, 50, 6, 10,5,10,20,10,5,3)
		@mantequilla = InfoNutricional.new("Mantequilla", 100, 20, 160, 90, 50, 6, 10,5,10,20,10,5,3)
		@mermelada = InfoNutricional.new("Mermelada", 70, 20, 260, 70, 30, 6, 10,5,10,20,10,5,3)
		@pan = InfoNutricional.new("Pan", 0, 20, 60, 100, 50, 2, 10,5,10,20,7,5,1)
		@manzana = InfoNutricional.new("Pan", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)		

		@lista = List.new(nil, nil)

		@lista.insert(@chocolate)
        @lista.insert(@yogur)
		@lista.insert(@mantequilla)
		@lista.insert(@mermelada)
		@lista.insert(@pan)
		@lista.insert(@manzana)		
	end

	describe List do
		it "Existe lista vacía" do
			expect(@lista.empty?).to be false
		end

		it "Existe un método insertar en la lista" do
			expect(@lista.insert(@yogur)).to be_a(Node)
		end

		it "Existe un método para extraer de la lista" do
			expect(@lista.insert(@yogur)).to be_a(Node)
			expect(@lista.extract).to be_a(Node)
		end

		it "Clasificar etiquetas según los gramos de sal" do
			expect(@chocolate.sal_ < 6).to eq(false)
			expect(@yogur.sal_ < 6).to eq(false)
			expect(@mantequilla.sal_ < 6).to eq(false)
			expect(@mermelada.sal_ < 6).to eq(false)
			expect(@pan.sal_ < 6).to eq(true)
			expect(@manzana.sal_ < 6).to eq(true)
		end

		it "Existe un método to_s para la lista" do
			expect(@lista.to_s).to be_a(String)
		end

	end	

	before :each do
		@juan = Persona.new("Juan", "Díaz")
		@pedro = Paciente.new("Pedro", "Hernández", true, true, Antropometria.new(25, 70.24, 1.79, 1, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))		
	end

	describe Persona do
		it "Comprobar objeto de tipo Persona" do
			expect(@juan).to be_a(Persona)
		end
		it "Comprobando objeto de tipo Persona" do			
			expect(@juan.class.name).to eql("Persona")
		end
	end

	describe Paciente do
		it "Comprobar objeto de tipo Persona" do
			expect(@pedro).to be_a(Paciente)
		end

		it "Paciente es tipo Persona" do
			expect(@pedro.is_a?(Persona)).to eq(true)
		end

		it "Paciente tiene datos antropométricos" do
			expect(@pedro.antropometria).to be_a(Antropometria)
		end
	end	

	context "# Pruebas de herencia" do
		
		it "Paciente hereda de Persona" do
			expect(Paciente.superclass.name).to eq("Persona")
		end

		it "Comprobando jerarquía" do
			expect(@juan).to be_a_kind_of(Persona)
			expect(@juan).not_to be_a_kind_of(Paciente)			
			expect(@juan).to be_a_kind_of(Object)
			expect(@juan).to be_a_kind_of(BasicObject)

			expect(@pedro).to be_a_kind_of(Persona)
			expect(@pedro).to be_a_kind_of(Paciente)
			expect(@pedro).to be_a_kind_of(Object)
			expect(@pedro).to be_a_kind_of(BasicObject)
		end		
	end

	before :each do
		@ana = Paciente.new("Ana", "Hernández", true, true, Antropometria.new(35, 50.24, 1.55, 0, 48.95, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,8.7,8.2], [7,7,5], [10,8.9,9,4], [10,10.5], [6,7]))	
		@maria = Paciente.new("María", "Suárez", true, true, Antropometria.new(28, 70.24, 1.79, 0, 65.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,7.7,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
		@manuel = Paciente.new("Manuel", "Glez", true, true, Antropometria.new(50, 80.44, 1.59, 1, 68.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [7,8.3,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
		@jose = Paciente.new("José", "Hernández", true, true, Antropometria.new(43, 85.44, 1.89, 1, 70.35, 81.5, [5.8, 6, 5.2], [5,5,7], [20,18,21], [12,10,11.4], [6.1,7.1,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
		@belen = Paciente.new("Belén", "Márquez", true, true, Antropometria.new(31, 60.24, 1.72, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	

		@lpacientes = List.new(nil, nil)

		@lpacientes.insert(@ana)
        @lpacientes.insert(@maria)
		@lpacientes.insert(@manuel)
		@lpacientes.insert(@jose)
		@lpacientes.insert(@belen)
	end

	context "# Clasificación según ı́ndice de masa corporal" do

		it "Comprobando IMC < 29.9" do			
			expect(@lpacientes.extract.value.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.value.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.value.antropometria.imc < 29.9).to eq(false)
			expect(@lpacientes.extract.value.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.value.antropometria.imc < 29.9).to eq(true)			
		end

		it "Mostrando pacientes con IMC > 29.9" do
			expect(@lpacientes.to_s).to be_a(String)
		end
		
	end	

	context "# Comparando etiquetas" do
		it "operador >" do		
			expect(@pan).to be >  @manzana
		end

		it "operador <" do		
			expect(@mantequilla).to be <  @chocolate
		end

		it "operador <=" do		
			expect(@yogur).to be <=  @chocolate
		end

		it "operador >=" do		
			expect(@manzana).to be <=  @mermelada
		end

		it "operador >=" do		
			expect(@manzana).to be <=  @mermelada
		end

		it "operador ==" do
			expect(@chocolate == @chocolate).to eq(true)
		end

		it "operador ===" do
			expect(@chocolate === @chocolate).to eq(true)
		end

		it "operador !=" do
			expect(@chocolate != @manzana).to eq(true)
		end
		
	end

end
