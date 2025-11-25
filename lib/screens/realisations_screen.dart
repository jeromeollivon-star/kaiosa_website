import 'package:flutter/material.dart';


class RealisationsScreen extends StatelessWidget {
  const RealisationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildStatsSection(context),
          _buildPortfolioSection(context),
          _buildProcessShowcase(context),
          _buildTestimonialSection(context),
          _buildCTASection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Nos Réalisations',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Du concret, des résultats mesurables',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildStatItem('50+', 'Prototypes créés'),
              _buildStatItem('25+', 'Clients accompagnés'),
              _buildStatItem('100%', 'Solutions testées'),
              _buildStatItem('4 ans', 'D\'expérience terrain'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF27AE60),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection(BuildContext context) {
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
            'Portfolio de Projets',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildProjectCard(
                '🔧',
                'Industrie',
                'Optimisation Ligne de Production',
                'Conception et prototypage d\'un système automatisé pour améliorer l\'efficacité d\'une ligne de production dans l\'industrie automotive.',
                ['Automatisation', 'Impression 3D', 'Métallurgie'],
                '+35% de productivité, -20% de défauts qualité, ROI en 8 mois',
              ),
              _buildProjectCard(
                '🏛️',
                'Collectivités',
                'Mobilier Urbain Innovant',
                'Développement de mobilier urbain modulaire et durable pour une commune de 15 000 habitants, intégrant des solutions low-tech.',
                ['Éco-conception', 'Bois local', 'Modularité'],
                '-40% de coûts vs solutions classiques, 100% matériaux locaux',
              ),
              _buildProjectCard(
                '🚀',
                'Startups',
                'Prototype IoT Connecté',
                'Développement d\'un prototype de capteur IoT pour startup agritech, de la conception électronique au boîtier étanche.',
                ['IoT', 'Électronique', 'Étanchéité'],
                'Prototype validé en 6 semaines, levée de fonds réussie',
              ),
              _buildProjectCard(
                '🎓',
                'Formation',
                'Atelier Innovation Pratique',
                'Formation hands-on sur les méthodes de prototypage rapide pour une école d\'ingénieurs, avec réalisation concrète.',
                ['Pédagogie', 'Prototypage', 'Hands-on'],
                '95% de satisfaction, 3 projets étudiants brevetés',
              ),
              _buildProjectCard(
                '⚡',
                'Industrie',
                'Système d\'Économie d\'Énergie',
                'Conception d\'un dispositif de récupération d\'énergie thermique pour une PME industrielle, approche low-tech.',
                ['Énergie', 'Récupération', 'Low-tech'],
                '-25% de consommation énergétique, amortissement 18 mois',
              ),
              _buildProjectCard(
                '🌱',
                'Collectivités',
                'Solutions Urbaines Durables',
                'Développement de solutions d\'agriculture urbaine modulaires pour une métropole, intégrant récupération d\'eau de pluie.',
                ['Agriculture urbaine', 'Récupération eau', 'Modulaire'],
                '12 installations pilotes, extension à 50 sites prévue',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String icon, String category, String title,
      String description, List<String> tags, String results) {
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
            height: 150,
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
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 72),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1C40F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E8449),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECF0F1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(color: Color(0xFF27AE60), width: 4),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Résultats',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E8449),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        results,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessShowcase(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Notre Processus en Action',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildProcessItem('💡', 'Idées Nocturnes',
                  'Les meilleures innovations naissent souvent la nuit. Nous cultivons cette créativité spontanée et l\'exploitons au maximum.'),
              _buildProcessItem('📝', 'Dessins & Plans',
                  'Chaque idée est immédiatement couchée sur papier puis modélisée en 3D pour visualiser et anticiper les défis techniques.'),
              _buildProcessItem('🔨', 'Fabrication',
                  'Impression 3D, découpe laser, usinage, soudure... Tous les moyens sont bons pour donner vie aux prototypes.'),
              _buildProcessItem('🧪', 'Tests Extrêmes',
                  'Nous maltraitons physiquement nos créations : chocs, températures, surcharge... Si ça casse, on comprend pourquoi.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessItem(String icon, String title, String description) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(10),
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialSection(BuildContext context) {
    return Container(
      color: const Color(0xFF1E8449),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Témoignage Client',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  '"Travailler avec KAIOSA a complètement changé notre vision de l\'innovation. Fini les réunions sans fin et les présentations théoriques. En 3 semaines, nous avions un prototype fonctionnel entre les mains. Cette approche concrète nous a permis d\'économiser 6 mois de développement et d\'éviter de nombreuses erreurs coûteuses."',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Marie Dubois - Directrice R&D, TechInnovate',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF1C40F),
                  ),
                ),
              ],
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
            'Votre Projet Mérite du Concret',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Transformons ensemble vos idées en solutions tangibles et testées. Première consultation gratuite pour évaluer votre projet.',
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
              'Démarrons votre prototype',
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
