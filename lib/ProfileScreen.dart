import 'package:flutter/material.dart';
import 'package:post_app/annuairepostier.dart';
import 'package:post_app/demandeconge.dart';
import 'package:post_app/situationfamilial.dart';

class BoldText extends StatelessWidget {
  final String text;

  const BoldText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF171E5A),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 100, // Modify the height as needed
            child: DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFF171E5A),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFBBC08),
              ),
            ),
          ),
          ListTile(
            title: const BoldText('Effectuer une demande de Mutation'),
            onTap: () {
              // Actions for Item 1
            },
          ),
          ListTile(
            title: const BoldText("Effectuer une demande de congé"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DemandeConge()),
              );
            },
          ),
          ListTile(
            title: const BoldText("Consulter l'annuaire des postier "),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnnuairePostiers()),
              );
            },
          ),
          ListTile(
            title: const BoldText("Declaration de situation familial "),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DeclarationFamiliale()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logopost1.png',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(20), // Espacement autour du grand cadre
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/iconprofile.png',
                  width: 100, // Ajuster la largeur de l'image selon vos besoins
                  height:
                      100, // Ajuster la hauteur de l'image selon vos besoins
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.all(20), // Espacement autour des cellules
                decoration: BoxDecoration(
                  color: Colors.white, // Fond blanc
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      width: 4,
                      color: const Color(0xFFFBBC08)), // Contour jaune
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Nom :'),
                    _buildRow('Prénom :'),
                    _buildRow('Matricule :'),
                    _buildRow('Date de naissance :'),
                    _buildRow('Numéro de téléphone :'),
                    _buildRow('Solde congé :'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        // Utiliser la largeur totale de l'écran
        color: const Color(0xFFFBBC08), // Fond jaune
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Text(
            '© 2000-2024 La Poste Tunisienne',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
    return scaffold;
  }

  Widget _buildRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10), // Espacement vertical entre les cellules
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
              width: 10), // Espacement horizontal entre le texte et la cellule
          Container(
            width: 130, // Largeur de la cellule
            height: 40, // Hauteur de la cellule
            decoration: BoxDecoration(
              color: Colors.white, // Fond blanc
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1, color: const Color(0xFFFBBC08)), // Bordure jaune
            ),
          ),
        ],
      ),
    );
  }
}
