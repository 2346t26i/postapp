import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DemandeConge extends StatefulWidget {
  const DemandeConge({Key? key}) : super(key: key);

  @override
  _DemandeCongeState createState() => _DemandeCongeState();
}

class _DemandeCongeState extends State<DemandeConge> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _matricule;
  String? _motif;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demande de Congé',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF171E5A),
          ),
        ),
        backgroundColor: Color(0xFFFBBC08), // Changement de la couleur de fond de l'appBar en jaune
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Matricule:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF171E5A),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Entrez votre matricule',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre matricule';
                  }
                  return null;
                },
                onSaved: (value) {
                  _matricule = value;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Motif:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20 ,
                  color: Color(0xFF171E5A),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Entrez le motif de votre congé',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le motif de votre congé';
                  }
                  return null;
                },
                onSaved: (value) {
                  _motif = value;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Date de début:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20 ,
                  color: Color(0xFF171E5A),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2030),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _startDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  _startDate == null ? 'Select date' : _startDate!.toString(),
                  style: TextStyle(
                    color: Color(0xFFFBBC08),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF171E5A)), // Utiliser la couleur spécifiée pour le widget "Select date"
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Ajuster la taille du bouton
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Date de fin:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF171E5A),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2030),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _endDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  _endDate == null ? 'Select date' : _endDate!.toString(),
                  style: TextStyle(
                    color: Color(0xFFFBBC08),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF171E5A)), // Utiliser la couleur spécifiée pour le widget "Select date"
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Ajuster la taille du bouton
                  ),
                ),
              ),
              const SizedBox(height: 30),
             Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                   'Envoyer', 
                   style: TextStyle(
                    color: Color(0xFF171E5A),
                   fontWeight: FontWeight.bold,
                   fontSize: 20 
                   
                 ),
                ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFBBC08)), 
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 40),), 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
