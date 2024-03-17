import 'package:flutter/material.dart';

class AnnuairePostiers extends StatelessWidget {
  AnnuairePostiers({Key? key}) : super(key: key);

  // Exemple de données de postiers
  final List<Map<String, dynamic>> postiers = [
    {'nom': 'Flen', 'prenom': 'Ben Foulen', 'telephone': '123'},
    {'nom': 'Doe', 'prenom': 'John', 'telephone': '123456789'},
    {'nom': 'Smith', 'prenom': 'Jane', 'telephone': '987654321'},
    // Ajoutez d'autres données de postiers ici...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Annuaire des Postiers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF171E5A),
          ),
        ),
        backgroundColor: Color(0xFFFBBC08),
      ),
      body: ListView.builder(
        itemCount: postiers.length,
        itemBuilder: (context, index) {
          final postier = postiers[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(
              '${postier['nom']} ${postier['prenom']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Téléphone: ${postier['telephone']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xFFFBBC08), width: 5.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ajouter ce contact à votre téléphone ?', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Action lorsque l'utilisateur clique sur "Oui"
                                // Ajouter le contact à la liste de contacts du téléphone
                                Navigator.of(context).pop();
                              },
                              child: Text('Oui'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Action lorsque l'utilisateur clique sur "Non"
                                Navigator.of(context).pop();
                              },
                              child: Text('Non'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
