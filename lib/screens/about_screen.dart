import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildIntroSection(context),
          _buildExpertiseSection(context),
          _buildApproachSection(context),
          _buildDifferentiatorsSection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
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
                _buildProfileImage(),
                const SizedBox(height: 40),
                _buildIntroText(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfileImage(),
                const SizedBox(width: 60),
                Expanded(child: _buildIntroText()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xFF27AE60),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 120,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jérôme Ollivon',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18, color: Colors.black87),
            children: [
              const TextSpan(
                  text: 'Fondateur de KAIOSA depuis 2021, je suis '),
              TextSpan(
                text: 'consultant en innovation',
                style: TextStyle(
                  backgroundColor: const Color(0xFFF39C12),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                  text:
                      ' avec une approche résolument différente des grands cabinets traditionnels.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Ma mission ? Transformer vos idées en solutions concrètes et fonctionnelles, sans PowerPoint inutiles, mais avec de vrais prototypes, de vrais tests, et de vraies innovations qui marchent.',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18, color: Colors.black87),
            children: [
              const TextSpan(
                  text:
                      'Basé à Saint-Germain-en-Laye, j\'accompagne les entreprises, collectivités et organismes qui veulent innover autrement, avec une approche '),
              TextSpan(
                text: 'low-tech et pragmatique',
                style: TextStyle(
                  backgroundColor: const Color(0xFFF39C12),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpertiseSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: const Color(0xFFECF0F1),
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Text(
            'Domaines d\'Expertise',
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
              _buildExpertiseCard(
                '🔧',
                'Prototypage & Fabrication',
                [
                  'Conception et prototypage rapide',
                  'Impression 3D et usinage',
                  'Travail du bois et du métal',
                  'Tests de résistance et validation',
                  'Optimisation des designs',
                ],
              ),
              _buildExpertiseCard(
                '💡',
                'Conseil en Innovation',
                [
                  'Audit d\'innovation existante',
                  'Stratégie d\'innovation produit',
                  'Accompagnement R&D',
                  'Veille technologique',
                  'Management de l\'innovation',
                ],
              ),
              _buildExpertiseCard(
                '🎯',
                'Secteurs d\'Intervention',
                [
                  'Industrie & Manufacturing',
                  'Collectivités territoriales',
                  'Startups & PME innovantes',
                  'Organismes de formation',
                  'Entreprises en transformation',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseCard(
      String icon, String title, List<String> items) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
            icon,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3498DB),
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '✓ ',
                      style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildApproachSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Mon Approche Unique',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                left: BorderSide(color: Color(0xFF3498DB), width: 4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🗃️ Du Concret, Pas du PowerPoint',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Contrairement aux grands cabinets qui produisent des présentations, je crée des prototypes fonctionnels. Chaque innovation est testée, maltraitée, améliorée jusqu\'à ce qu\'elle fonctionne parfaitement.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 24),
                Text(
                  '🎯 Focus Total sur Votre Projet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Le sujet de mon client devient mon crédo. Je travaille seul pour rester concentré uniquement sur votre problématique, sans perturbations mercantiles ou managériales.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 24),
                Text(
                  '🔄 Méthode Itérative',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Je procède par cycles courts : idée → dessin → prototype → test → amélioration. Si ça ne marche pas, je sais pourquoi et je recommence mieux.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                left: BorderSide(color: Color(0xFF3498DB), width: 4),
              ),
            ),
            child: Text(
              '"Mon métier, c\'est d\'innover, de faire que ce qui ne doit pas fonctionner finisse par fonctionner. Et tout cela sans monter une usine à gaz, mais en le faisant le plus simplement possible."',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifferentiatorsSection(BuildContext context) {
    return Container(
      color: const Color(0xFF2C3E50),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Ce Qui Nous Différencie',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildDiffItem('🛠️', 'Approche Hands-On',
                  'Je mets littéralement les mains dans le cambouis. Bleu de travail, outils, matériaux : l\'innovation se vit sur le terrain.'),
              _buildDiffItem('🎯', 'Sans Parasitage',
                  'Travail en solo pour une concentration totale sur votre projet, sans distractions commerciales ou hiérarchiques.'),
              _buildDiffItem('⚡', 'Résultats Tangibles',
                  'Pas de livrables théoriques : vous repartez avec des prototypes fonctionnels et des solutions testées.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiffItem(String icon, String title, String description) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF39C12),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.center,
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
