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
			expect(@lista.extract).to be_a(InfoNutricional)
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
		@ana = Paciente.new("Ana", "Hernández", true, true, Antropometria.new(35, 50.24, 1.55, 0, 48.95, 60.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,8.7,8.2], [7,7,5], [10,8.9,9,4], [10,10.5], [6,7]))	
		@maria = Paciente.new("María", "Suárez", true, true, Antropometria.new(28, 70.24, 1.79, 0, 65.35, 75.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,7.7,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
		@manuel = Paciente.new("Manuel", "Glez", true, true, Antropometria.new(50, 80.44, 1.59, 1, 68.35, 80.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [7,8.3,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
		@jose = Paciente.new("José", "Hernández", true, true, Antropometria.new(43, 85.44, 1.89, 1, 70.35, 72.5, [5.8, 6, 5.2], [5,5,7], [20,18,21], [12,10,11.4], [6.1,7.1,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
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
			expect(@lpacientes.extract.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.antropometria.imc < 29.9).to eq(false)
			expect(@lpacientes.extract.antropometria.imc < 29.9).to eq(true)
			expect(@lpacientes.extract.antropometria.imc < 29.9).to eq(true)			
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

	context "# Comparando pacientes" do
		it "operador >" do		
			expect(@maria).to be >  @ana
		end

		it "operador <" do		
			expect(@maria).to be <  @jose
		end

		it "operador <=" do		
			expect(@maria).to be <=  @manuel
		end

		it "operador >=" do		
			expect(@belen).to be <=  @ana
		end

		it "operador >=" do		
			expect(@maria).to be <=  @jose
		end

		it "operador ==" do
			expect(@manuel == @manuel).to eq(true)
		end

		it "operador ===" do
			expect(@ana === @ana).to eq(true)
		end

		it "operador !=" do
			expect(@jose != @belen).to eq(true)
		end	
	end

	context "# Enumerar listas de etiquetas de información nutricional" do
		it "método collect" do
			expect(@lista.collect{|x| x.nombre_}).to eq(["Tableta de chocolate", "Yogur", "Mantequilla", "Mermelada", "Pan", "Pan"])
		end

		it "método select" do
			# expect(@lista.select{|x| x.get_val_energetico_kcal > 2000}).to eq([2165.0, 2035.0, 2085.0])			
		end
		  
		it "método max" do
			expect(@lista.max.get_val_energetico_kcal).to eq(2165.0)
		end

		it "método min" do
			expect(@lista.min.get_val_energetico_kcal).to eq(118.9)
		end

		it "método sort" do
			# expect(@lista.sort.get_val_energetico_kcal).to eq([118.9, 705.0, 1320.0, 2035.0, 2085.0, 2165.0])
		end
		   
	end

	context "# Enumerar listas de pacientes" do
		it "método collect" do
			expect(@lpacientes.collect{|x| x.nombre}).to eq(["Ana", "María", "Manuel", "José", "Belén"])
		end

		it "método select" do
			# expect(@lpacientes.select{|imc| imc>29.9}).to eq([31.82])
		end
		  
		it "método max" do
			expect(@lpacientes.max.antropometria.imc).to eq(31.82)
		end

		it "método min" do
			expect(@lpacientes.min.antropometria.imc).to eq(20.36)
		end

		it "método sort" do
			# expect(@lpacientes.sort).to eq([20.36, 20.91, 21.92, 23.92, 31.82])
		end
		   
	end

	context "# Menús dietéticos" do
		before :each do
			@ana = Paciente.new("Ana", "Hernández", true, true, Antropometria.new(35, 50.24, 1.55, 0, 48.95, 60.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,8.7,8.2], [7,7,5], [10,8.9,9,4], [10,10.5], [6,7]))	
			@maria = Paciente.new("María", "Suárez", true, true, Antropometria.new(28, 70.24, 1.79, 0, 65.35, 75.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,7.7,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@manuel = Paciente.new("Manuel", "Glez", true, true, Antropometria.new(50, 80.44, 1.59, 1, 68.35, 80.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [7,8.3,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@jose = Paciente.new("José", "Hernández", true, true, Antropometria.new(43, 85.44, 1.89, 1, 70.35, 72.5, [5.8, 6, 5.2], [5,5,7], [20,18,21], [12,10,11.4], [6.1,7.1,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@belen = Paciente.new("Belén", "Márquez", true, true, Antropometria.new(31, 60.24, 1.72, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	

			@ana.actividad_fisica = 0.0
			@maria.actividad_fisica = 0.12
			@manuel.actividad_fisica = 0.27
			@jose.actividad_fisica = 0.54
			@belen.actividad_fisica = 0.54

			@arrayPacientes = [@ana, @maria, @manuel, @jose, @belen]

			@macedonia = InfoNutricional.new("macedonia", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)	
			@potaje = InfoNutricional.new("potaje", 35, 0.1, 28, 9, 30, 1, 1,5,1,2,8,5,3)
			@solomillo = InfoNutricional.new("solomillo", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@lasagna = InfoNutricional.new("lasagna", 60, 0.1, 30, 9, 5, 1, 1,5,1,2,8,5,3)
			@sopa = InfoNutricional.new("sopa", 0.5, 0.1, 2, 9, 15, 1, 1,5,1,2,8,5,3)
			@cocido = InfoNutricional.new("cocido", 45, 0.1, 2, 20, 5, 1, 1,5,1,2,8,5,3)
			@ensalada = InfoNutricional.new("ensalada", 15, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@merluza = InfoNutricional.new("merluza", 55, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@arroz = InfoNutricional.new("arroz", 20, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@flan = InfoNutricional.new("flan", 15, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@garbanzas = InfoNutricional.new("garbanzas", 50, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@pollo = InfoNutricional.new("pollo", 50, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@yogur = InfoNutricional.new("Yogur", 25, 20, 150, 90, 50, 6, 10,5,10,20,10,5,3)
			@paella = InfoNutricional.new("paella", 100, 20, 160, 90, 50, 6, 10,5,10,20,10,5,3)
			@cereales = InfoNutricional.new("Mermelada", 70, 20, 260, 70, 30, 6, 10,5,10,20,10,5,3)
			@pan = InfoNutricional.new("Pan", 1, 20, 60, 100, 50, 2, 10,5,10,20,7,5,1)
			@manzana = InfoNutricional.new("manzana", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)		

			@menu1 = [@lasagna, @merluza, @arroz, @flan]
			@menu2 = [@potaje, @arroz, @lasagna, @garbanzas, @solomillo, @pollo, @ensalada, @macedonia, @flan, @manzana]
			@menu3 = [@garbanzas, @merluza, @arroz, @macedonia, @yogur, @cereales]
			@menu4 = [@sopa, @cocido, @garbanzas, @flan, @pan, @solomillo, @pollo, @ensalada, @merluza, @yogur, @paella]

			@menus = @menu1.zip(@menu2,@menu3,@menu4)
		end

		it "Calculando peso teórico ideal" do						
			expect(@arrayPacientes.collect {|x| ((x.antropometria.talla*100 - 150) * 0.75 + 50)}).to eq([53.75, 71.75, 56.75, 79.25, 66.5])
		end

		it "Probando cálculo de gasto energético basal (mujeres)" do
			expect(@ana.gasto_energetico_basal).to eq(176.09)
			expect(@belen.gasto_energetico_basal).to eq(297.15)
		end

		it "Probando cálculo de gasto energético basal (hombres)" do
			expect(@jose.gasto_energetico_basal).to eq(656.21)
			expect(@manuel.gasto_energetico_basal).to eq(569.34)
		end

		it "Probando cálculo de efecto termógeno" do
			expect(@maria.efecto_termogeno).to eq(4125.9)
			expect(@manuel.efecto_termogeno).to eq(5693.4)
		end

		it "Probando cálculo de gasto actividad física" do
			expect(@maria.gasto_actividad_fisica).to eq(49.51)
			expect(@jose.gasto_actividad_fisica).to eq(354.35)
		end

		it "Probando cálculo de gasto energético total" do
			expect(@belen.gasto_energetico_total).to eq(3429.11)
			expect(@manuel.gasto_energetico_total).to eq(6416.46)
		end

		it "Comprobando pacientes que casan con un menú" do		
			expect(@arrayPacientes.select{|x| @menu1.collect{|i| i.get_val_energetico_kcal}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@ana])
			expect(@arrayPacientes.select{|x| @menu2.collect{|i| i.get_val_energetico_kcal}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@belen])
			expect(@arrayPacientes.select{|x| @menu3.collect{|i| i.get_val_energetico_kcal}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@maria])
			expect(@arrayPacientes.select{|x| @menu4.collect{|i| i.get_val_energetico_kcal}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@jose])			
		end

	end

	context "# Práctica de laboratorio #11" do

		before :each do
			@macedonia = InfoNutricional.new("macedonia", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)	
			@potaje = InfoNutricional.new("potaje", 35, 0.1, 28, 9, 30, 1, 1,5,1,2,8,5,3)
			@solomillo = InfoNutricional.new("solomillo", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@lasagna = InfoNutricional.new("lasagna", 60, 0.1, 30, 9, 5, 1, 1,5,1,2,8,5,3)
			@sopa = InfoNutricional.new("sopa", 0.5, 0.1, 2, 9, 15, 1, 1,5,1,2,8,5,3)
			@cocido = InfoNutricional.new("cocido", 45, 0.1, 2, 20, 5, 1, 1,5,1,2,8,5,3)
			@ensalada = InfoNutricional.new("ensalada", 15, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@merluza = InfoNutricional.new("merluza", 55, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@arroz = InfoNutricional.new("arroz", 20, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@flan = InfoNutricional.new("flan", 15, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@garbanzas = InfoNutricional.new("garbanzas", 50, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@pollo = InfoNutricional.new("pollo", 50, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)
			@yogur = InfoNutricional.new("Yogur", 25, 20, 150, 90, 50, 6, 10,5,10,20,10,5,3)
			@paella = InfoNutricional.new("paella", 100, 20, 160, 90, 50, 6, 10,5,10,20,10,5,3)
			@cereales = InfoNutricional.new("Mermelada", 70, 20, 260, 70, 30, 6, 10,5,10,20,10,5,3)
			@pan = InfoNutricional.new("Pan", 1, 20, 60, 100, 50, 2, 10,5,10,20,7,5,1)
			@manzana = InfoNutricional.new("manzana", 0.5, 0.1, 2, 9, 5, 1, 1,5,1,2,8,5,3)		

			@menu1 = [@lasagna, @merluza, @arroz, @flan]
			@menu2 = [@potaje, @arroz, @lasagna, @garbanzas, @solomillo, @pollo, @ensalada, @macedonia, @flan, @manzana]
			@menu3 = [@garbanzas, @merluza, @arroz, @macedonia, @yogur, @cereales]
			@menu4 = [@sopa, @cocido, @garbanzas, @flan, @pan, @solomillo, @pollo, @ensalada, @merluza, @yogur, @paella]
			@menu5 = [@solomillo, @lasagna, @merluza, @arroz, @yogur, @manzana]
			@menu6 = [@sopa, @arroz, @garbanzas, @solomillo, @pollo, @ensalada, @macedonia, @flan, @manzana]
			@menu7 = [@garbanzas, @merluza, @arroz, @macedonia, @yogur, @cereales]
			@menu8 = [@potaje, @garbanzas, @flan, @pan, @solomillo, @pollo, @ensalada, @merluza, @yogur, @paella]
			@menu9 = [@garbanzas, @pan, @arroz, @macedonia, @yogur]
			@menu10 = [@cocido, @garbanzas, @pan, @solomillo, @pollo, @ensalada, @merluza, @yogur, @paella]

			# array con 10 menús
			@menus = [@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10]

			@ana = Paciente.new("Ana", "Hernández", true, true, Antropometria.new(35, 50.24, 1.55, 0, 48.95, 60.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,8.7,8.2], [7,7,5], [10,8.9,9,4], [10,10.5], [6,7]))	
			@maria = Paciente.new("María", "Suárez", true, true, Antropometria.new(28, 70.24, 1.79, 0, 65.35, 75.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [6,7.7,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@manuel = Paciente.new("Manuel", "Díaz", true, true, Antropometria.new(50, 80.44, 1.59, 1, 68.35, 80.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [7,8.3,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@jose = Paciente.new("José", "Hernández", true, true, Antropometria.new(43, 85.44, 1.89, 1, 70.35, 72.5, [5.8, 6, 5.2], [5,5,7], [20,18,21], [12,10,11.4], [6.1,7.1,5.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@belen = Paciente.new("Belén", "Márquez", true, true, Antropometria.new(31, 60.24, 1.72, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@sergio = Paciente.new("Sergio", "Reyes", true, true, Antropometria.new(36, 80.24, 1.90, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@antonio = Paciente.new("Antonio", "Rodríguez", true, true, Antropometria.new(25, 70.24, 1.70, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@esteban = Paciente.new("Estaban", "Márquez", true, true, Antropometria.new(21, 85.10, 1.82, 0, 70.35, 81.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@elena = Paciente.new("Elena", "González", true, true, Antropometria.new(27, 55, 1.60, 0, 60.35, 91.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	
			@marta = Paciente.new("Marta", "García", true, true, Antropometria.new(19, 60.24, 1.70, 0, 60.35, 91.5, [5.8, 6, 6.2], [5,5,7], [20,18,21], [12,10,11.4], [8,8.7,9.2], [9,7,8], [10,8.9,9,4], [10,10.5], [6,7]))	

			# lista con 10 individuos
			@individuos = List.new(nil, nil)
			@individuos.insert(@ana)
			@individuos.insert(@maria)
			@individuos.insert(@manuel)
			@individuos.insert(@jose)
			@individuos.insert(@belen)
			@individuos.insert(@sergio)
			@individuos.insert(@antonio)
			@individuos.insert(@esteban)
			@individuos.insert(@elena)
			@individuos.insert(@marta)						
		end

		it "Obtener nuevo array de menús ordenado con for por valor energético" do						
				
			# puts "\n\tArray de menus sin ordenar:"
			# for i in 0..@menus.size-1
            # 	puts "\t  #{@menus[i].collect{|etiqueta| etiqueta.get_val_energetico_kcal}.reduce(:+)}"
			# end

			menus_ordenados = @menus
            
                
			swapped = true
			n = menus_ordenados.size-1
			while swapped do
				swapped = false
				for i in 0..n-1
					if menus_ordenados[i].collect{|etiqueta| etiqueta.get_val_energetico_kcal}.reduce(:+) > menus_ordenados[i+1].collect{|etiqueta| etiqueta.get_val_energetico_kcal}.reduce(:+)
						menus_ordenados[i], menus_ordenados[i + 1] = menus_ordenados[i + 1], menus_ordenados[i]
						swapped = true
					end
				end
			end
				
						
			
            # puts "\n\tArray de menus ordenado con for:"
            # for i in 0..@each.size-1
            # 	puts "\t  #{@each[i].collect{|etiqueta| etiqueta.get_val_energetico_kcal}.reduce(:+)}"
			# end
			
		end

		it "Obtener nueva lista de individuos ordenados con for por gasto energético total" do
			individuos_ordenados = @individuos

			i = 0
			pos = 0

			while i < individuos_ordenados.size-1 do
				menor = individuos_ordenados[i]
				pos = i
				j = 1+i
				while j < individuos_ordenados.size do
					if individuos_ordenados[j] < menor
						menor = individuos_ordenados[j]
						pos = j
					end
					j += 1
				end
				individuos_ordenados[pos] = individuos_ordenados[i]
				individuos_ordenados[i] = menor
				i += 1
			end			

		end

		it "Obtener nuevo array de menús ordenado con each por valor energético" do
		end
		
		it "Obtener nueva lista de individuos ordenados con each por gasto energético total" do
		end

		it "Obtener nuevo array de menús ordenado con sort por valor energético" do
		end
		
		it "Obtener nueva lista de individuos ordenados con sort por gasto energético total" do
		end
	end

end
