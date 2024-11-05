extends Node

export var preguntasRespuestas = {
	0: {
		"id": 0,
		"pregunta": "¿Qué tipo de ciberataque es el phishing?",
		"opciones": [
			"Malware",
			"DDoS",
			"Ingeniería social",
			"Man In The Middle"
		],
		"correcta": 2
	},
	
	1: {
		"id": 1,
		"pregunta": "¿Qué tipo de ciberataque es un troyano?",
		"opciones": [
			"Inyección de código",
			"Tailgating",
			"DDoS",
			"Malware"
		],
		"correcta": 3
	},
	
	2: {
		"id": 2,
		"pregunta": "¿Qué es la ciberseguridad?",
		"opciones": [
			"La seguridad informática",
			"Requisitos para un ciber",
			"Un lenguaje de programación",
			"Un tipo de virus"
		],
		"correcta": 0
	},
	
	3: {
		"id": 3,
		"pregunta": "¿Para qué nos sirve la ciberseguridad?",
		"opciones": [
			"Protege nuestra información",
			"Valora nuestra información",
			"Evita el robo de información",
			"Todas las anteriores"
		],
		"correcta": 3
	},
		
	4: {
		"id": 4,
		"pregunta": "¿Con qué deben empezar los links para comprobar que son páginas seguras?",
		"opciones": [
			"www.",
			"https://",
			"file://",
			"http://"
		],
		"correcta": 1
	},
		
	5: {
		"id": 5,
		"pregunta": "¿Cuál es la función de las VPN?",
		"opciones": [
			"Encriptar contraseñas",
			"Prevenir ciberdelitos",
			"Redirigir nuestra señal",
			"Todas las anteriores"
		],
		"correcta": 2
	},
		
	6: {
		"id": 6,
		"pregunta": "¿Cuál de estos NO es un malware?",
		"opciones": [
			"Abandonware",
			"Ransomware",
			"Spyware",
			"Troyano"
		],
		"correcta": 0
	},
	
	7: {
		"id": 7,
		"pregunta": "Según el número de objetivos, ¿En qué se dividen los ciberataques?",
		"opciones": [
			"Único y múltiple",
			"Dirigido y no dirigido",
			"Esencial y no esencial",
			"Few y many"
		],
		"correcta": 1
	},

	8: {
		"id": 8,
		"pregunta": "¿Quiénes son contratados para verificar y mejorar la seguridad de los sistemas de las empresas?",
		"opciones": [
			"Hackers de sombrero negro",
			"Ingenieros de sistemas",
			"Hackers de sombrero blanco",
			"Programadores"
		],
		"correcta": 2
	},
		
	9: {
		"id": 9,
		"pregunta": "¿Cuál de estos no es una parte de un virus?",
		"opciones": [
			"Mecanismo de infección",
			"Almacenador",
			"Disparador",
			"Carga"
		],
		"correcta": 1
	},
	
	10: {
		"id": 10,
		"pregunta": "¿En qué año se sancionó la Ley 25.326? Más conocida como Ley de Protección de Datos Personales",
		"opciones": [
			"2001",
			"2000",
			"2002",
			"2003"
		],
		"correcta": 1
	},

	11: {
		"id": 11,
		"pregunta": "¿Qué es un hacker ético?",
		"opciones": [
			"Un hacker que roba información",
			"Un desarrollador de software",
			"Un experto en redes",
			"Profesional en ciberseguridad"
		],
		"correcta": 3
	},
	
	12: {
		"id": 12,
		"pregunta": "¿Qué caracteriza a un virus informático?",
		"opciones": [
			"Su capacidad de replicarse",
			"Su capacidad de borrar malware",
			"Su función de cifrar archivos ",
			"Su ayuda al dispositivo"
		],
		"correcta": 0
	},
	
	13: {
		"id": 13,
		"pregunta": "¿Cuál es la manera recomendada de almacenar contraseñas?",
		"opciones": [
			"En un archivo de texto",
			"En un gestor de contraseñas",
			"En una hoja de papel",
			"En WhatsApp"
		],
		"correcta": 1
	},
	
	14: {
		"id": 14,
		"pregunta": "¿Qué significan las siglas en inglés de VPN?",
		"opciones": [
			"Virtual Private Notification",
			"Virtual Popular Network",
			"Virtual Private Network",
			"Viral Private Network"
		],
		"correcta": 2
	},
	
	15: {
		"id": 15,
		"pregunta": "¿En qué año fue sancionada la ley 26.388 para los delitos informáticos?",
		"opciones": [
			"2008",
			"2009",
			"2010",
			"2011"
		],
		"correcta": 0
	},
	
	16: {
		"id": 16,
		"pregunta": "¿Cuál de estas es una MALA práctica a la hora de crear una contraseña?",
		"opciones": [
			"Hacerla mayor a 15 caracteres",
			"Usar letras, números, símbolos",
			"Utilizar datos personales",
			"Hacerla distinta a las demás"
		],
		"correcta": 2
	},
		
	17: {
		"id": 17,
		"pregunta": "¿Cuál de estas es una MALA práctica de seguridad?",
		"opciones": [
			"Activar el 2FA",
			"Tener software actualizado",
			"Educarte sobre phishing",
			"Repetir la misma contraseña"
		],
		"correcta": 3
	},
		
	18: {
		"id": 18,
		"pregunta": "PREGUNTA REGALO. ELIGE LA PRIMERA OPCIÓN.",
		"opciones": [
			"Correcta",
			"Incorrecta",
			"Incorrecta",
			"Incorrecta"
		],
		"correcta": 0
	},
		
	19: {
		"id": 19,
		"pregunta": "¿Qué tipo de ciberataque es la estafa de Mercado Pago falso?",
		"opciones": [
			"Malware",
			"Ingeniería social",
			"DDoS",
			"Inyección de código"
		],
		"correcta": 1
	},
		
	20: {
		"id": 20,
		"pregunta": "¿Qué tipos de ciberataques se realizan con el lenguaje SQL?",
		"opciones": [
			"DDoS",
			"Malware",
			"Ingeniería social",
			"Inyección de código"
		],
		"correcta": 3
	},
			
	21: {
		"id": 21,
		"pregunta": "¿De la unión de qué palabras proviene el término malware?",
		"opciones": [
			"Malicious y software",
			"Maleficent y software",
			"Malicious y hardware",
			"Malevolent software"
		],
		"correcta": 0
	},
			
	22: {
		"id": 22,
		"pregunta": "¿Qué es un ciberataque?",
		"opciones": [
			"Un ataque militar cibernético",
			"Acceso a datos sin permiso",
			"Ataque a hardware",
			"Hacer cyberbulying"
		],
		"correcta": 1
	},
			
	23: {
		"id": 23,
		"pregunta": "¿Qué tipo de ciberataque se realiza mediante el uso de bots?",
		"opciones": [
			"Malware",
			"Inyección de código",
			"Denegación de servicio",
			"Ingeniería social"
		],
		"correcta": 2
	},
			
	24: {
		"id": 24,
		"pregunta": "Los hackers éticos son también conocidos como...",
		"opciones": [
			"Hackers de sombrero negro",
			"Hackers caritativos",
			"Hackers legales",
			"Hackers de sombrero blanco"
		],
		"correcta": 3
	},
	
	25: {
		"id": 25,
		"pregunta": "¿Qué significa DoS en Español?",
		"opciones": [
			"Denegación de Servicio",
			"Destrucción de Servicio",
			"Disminución de Servicio",
			"Desarmado de Serviico"
		],
		"correcta": 0
	},
}
