import 'package:flutter/material.dart';


class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildIntroSection(context),
          _buildServicesSection(context),
          _buildProcessSection(context),
          _buildTestimonialsSection(context),
          _buildCTASection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Innovation Concrète à Votre Service',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B8B2C),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'KAIOSA vous accompagne dans toutes les étapes de votre projet d\'innovation, de l\'idée au prototype fonctionnel. Notre approche unique combine conseil stratégique et réalisation pratique pour des résultats tangibles et mesurables.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: const Color(0xFFECF0F1),
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.center,
        children: [
          _buildServiceCard(
            '🔧',
            'Prototypage Rapide',
            'À partir de 2 500€',
            'Transformation de vos idées en prototypes fonctionnels. De la conception à la fabrication, nous créons des solutions concrètes que vous pouvez toucher, tester et améliorer.',
            [
              'Conception et design sur mesure',
              'Impression 3D et usinage',
              'Travail du bois et du métal',
              'Tests de résistance et validation',
              'Itérations et optimisations',
              'Documentation technique complète',
            ],
          ),
          _buildServiceCard(
            '💡',
            'Conseil en Innovation',
            'À partir de 1 500€',
            'Accompagnement stratégique pour structurer et accélérer vos projets d\'innovation. Une approche pragmatique qui privilégie l\'action et les résultats concrets.',
            [
              'Audit d\'innovation existante',
              'Stratégie d\'innovation produit',
              'Feuille de route technologique',
              'Accompagnement R&D',
              'Veille technologique ciblée',
              'Formation des équipes',
            ],
          ),
          _buildServiceCard(
            '🚀',
            'Accompagnement Projet',
            'Sur devis',
            'Partenariat complet de l\'idée à la mise sur le marché. Un accompagnement sur-mesure qui s\'adapte à vos besoins, votre budget et vos contraintes temporelles.',
            [
              'Définition des spécifications',
              'Gestion de projet complète',
              'Coordination des intervenants',
              'Suivi qualité et délais',
              'Support technique continu',
              'Formation et transfert de compétences',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String icon, String title, String price,
      String description, List<String> features) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                ...features.map((feature) => Padding(
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
                              feature,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF27AE60),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'En savoir plus',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Notre Méthode de Travail',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 50),
          _buildProcessTimeline(),
        ],
      ),
    );
  }

  Widget _buildProcessTimeline() {
    return Column(
      children: [
        _buildProcessStep(1, 'Écoute & Analyse',
            'Nous prenons le temps de comprendre votre besoin, vos contraintes et vos objectifs. Chaque projet est unique et mérite une approche sur-mesure.'),
        _buildProcessStep(2, 'Conception & Design',
            'Transformation de vos idées en solutions concrètes. Dessins techniques, modélisation 3D et choix des matériaux les plus adaptés.'),
        _buildProcessStep(3, 'Prototypage',
            'Fabrication du prototype avec nos outils : impression 3D, usinage, travail du bois et du métal. Du concret entre vos mains !'),
        _buildProcessStep(4, 'Test & Validation',
            'Nous maltraitons physiquement le prototype pour tester sa résistance et valider son fonctionnement dans les conditions réelles.'),
        _buildProcessStep(5, 'Optimisation',
            'Analyse des résultats et amélioration continue. Si ça ne marche pas, nous savons pourquoi et nous recommençons mieux.'),
      ],
    );
  }

  Widget _buildProcessStep(int number, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF27AE60),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E8449),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection(BuildContext context) {
    return Container(
      color: const Color(0xFF1E8449),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Ce Que Disent Nos Clients',
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
              _buildTestimonialCard(
                'Enfin un consultant qui sort des sentiers battus ! Jérôme a transformé notre idée abstraite en prototype fonctionnel en moins de 3 semaines.',
                '- Directeur R&D, PME industrielle',
              ),
              _buildTestimonialCard(
                'L\'approche KAIOSA change tout : pas de PowerPoint inutiles, que du concret et des résultats mesurables. Exactement ce dont nous avions besoin.',
                '- Maire, Collectivité territoriale',
              ),
              _buildTestimonialCard(
                'Un vrai partenaire qui s\'investit à 100% dans nos projets. Son expertise technique et sa capacité d\'écoute font la différence.',
                '- CEO, Startup tech',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String text, String author) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            author,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF1C40F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Prêt à Concrétiser Votre Innovation ?',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Discutons de votre projet sans engagement. Premier échange gratuit pour définir ensemble la meilleure approche.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1C40F),
              foregroundColor: const Color(0xFF2C3E50),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 4,
            ),
            child: Text(
              'Contactez-nous maintenant',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF1E8449),
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
              color: const Color(0xFFF1C40F),
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
