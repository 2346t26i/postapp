import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DeclarationFamiliale extends StatefulWidget {
  const DeclarationFamiliale({Key? key}) : super(key: key);

  @override
  _DeclarationFamilialeState createState() => _DeclarationFamilialeState();
}

class _DeclarationFamilialeState extends State<DeclarationFamiliale> {
  final _formKey = GlobalKey<FormState>();
  String? _nom;
  String? _prenom;
  String? _matricule;
  String? _situationFamiliale;
  int? _nombreEnfants;
  PlatformFile? _selectedFile;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission here
    }
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Déclaration Familiale',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF171E5A),
          ),
        ),
        backgroundColor: Color(0xFFFBBC08),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nom = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _prenom = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matricule (5 chiffres)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre matricule';
                  } else if (value.length != 5 || int.tryParse(value) == null) {
                    return 'Veuillez saisir un matricule valide (5 chiffres)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _matricule = value;
                },
              ),
              DropdownButtonFormField<String>(
                value: _situationFamiliale,
                items: ['Célibataire', 'Marié(e)', 'Divorcé(e)', 'Veuf/Veuve']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Situation Familiale'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre situation familiale';
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    _situationFamiliale = value;
                  });
                },
              ),
              DropdownButtonFormField<int>(
                value: _nombreEnfants,
                items: List.generate(11, (index) => index).map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Nombre d\'enfants'),
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez sélectionner le nombre d\'enfants';
                  }
                  return null;
                },
                onChanged: (int? value) {
                  setState(() {
                    _nombreEnfants = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Télécharger un fichier ou une photo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF171E5A),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _selectFile,
                child: const Text(
                  'Télécharger',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFBBC08)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_selectedFile != null)
                Text(
                  'Fichier sélectionné: ${_selectedFile!.name}',
                  style: TextStyle(
                    color: Color(0xFF171E5A),
                  ),
                ),
              const SizedBox(height: 20),
               const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Envoyer',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFBBC08)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    ),
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