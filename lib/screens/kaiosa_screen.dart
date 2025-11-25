import 'package:flutter/material.dart';


class KaiosaScreen extends StatelessWidget {
  const KaiosaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildRevelationSection(context),
          _buildPhilosophySection(context),
          _buildParallelsSection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildRevelationSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          if (isMobile)
            Column(
              children: [
                _buildKaioVisual(),
                const SizedBox(height: 40),
                _buildRevelationText(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildKaioVisual()),
                const SizedBox(width: 60),
                Expanded(child: _buildRevelationText()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildKaioVisual() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF87CEEB), Color(0xFF4169E1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '👑',
            style: TextStyle(fontSize: 100),
          ),
          const SizedBox(height: 20),
          Text(
            'KAIO-SAMA',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Roi des Kaïos',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevelationText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'La Révélation',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF27AE60),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18, color: Colors.black87),
            children: [
              const TextSpan(text: 'KAIOSA tire son nom de '),
              TextSpan(
                text: 'Kaio-sama',
                style: TextStyle(
                  backgroundColor: const Color(0xFF27AE60),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                  text:
                      ', le personnage mythique de Dragon Ball Z. Aussi appelé le Roi des Kaïos, ce maître légendaire possède une approche unique de l\'entraînement qui résonne parfaitement avec notre philosophie d\'innovation.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Contrairement aux autres maîtres qui se contentent de théorie, Kaio-sama transforme ses élèves en les soumettant à des conditions extrêmes sur sa petite planète où la gravité est décuplée.',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        Text(
          'De la même manière, nous transformons vos idées en les soumettant aux tests les plus rigoureux pour créer des innovations véritablement robustes.',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildPhilosophySection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2C3E50), Color(0xFF3498DB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'La Philosophie Commune',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              '"Il ne suffit pas d\'avoir une idée brillante ou une force brute. Ce qui compte, c\'est la capacité à transformer cette matière première en quelque chose d\'opérationnel, de résistant, qui fonctionne vraiment quand ça compte."',
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                height: 1.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'La philosophie KAIOSA, inspirée de Kaio-sama',
            style: TextStyle(
              fontSize: 20,
              color: const Color(0xFFF39C12),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParallelsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Text(
            'Les Parallèles Frappants',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildParallelCard(
                'Approche Non-Conventionnelle',
                'Kaio-sama',
                'Méthode d\'entraînement unique, loin des écoles traditionnelles',
                'KAIOSA',
                'Innovation concrète vs PowerPoint des grands cabinets',
              ),
              _buildParallelCard(
                'Tests Extrêmes',
                'Kaio-sama',
                'Gravité x10 pour forger des guerriers plus forts',
                'KAIOSA',
                '"Maltraiter" les prototypes pour les rendre résistants',
              ),
              _buildParallelCard(
                'Sagesse Pratique',
                'Kaio-sama',
                'Préfère l\'efficacité à la grandiloquence',
                'KAIOSA',
                'Privilégie le concret aux présentations théoriques',
              ),
              _buildParallelCard(
                'Travail en Solo',
                'Kaio-sama',
                'Seul sur sa petite planète, concentré sur sa mission',
                'KAIOSA',
                'Travail seul pour rester focus sur le projet client',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParallelCard(String title, String leftTitle, String leftDesc,
      String rightTitle, String rightDesc) {
    return Container(
      width: 550,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF27AE60),
            width: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF27AE60),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(color: Color(0xFF2196F3), width: 3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leftTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        leftDesc,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E8),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(color: Color(0xFF27AE60), width: 3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rightTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        rightDesc,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF2C3E50),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          Text(
            'KAIOSA - Conseil en Innovation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '📍 Saint-Germain-en-Laye, Île-de-France',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            '📧 contact@kaiosa.com',
            style: TextStyle(
              color: const Color(0xFF3498DB),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '© 2025 KAIOSA. Tous droits réservés.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
