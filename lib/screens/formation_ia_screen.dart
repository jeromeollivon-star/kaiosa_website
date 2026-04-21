import 'package:flutter/material.dart';

class FormationIAScreen extends StatelessWidget {
  const FormationIAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeroSection(context),
          _buildPhilosophySection(context),
          _buildFormatSection(context),
          _buildHubSection(context),
          _buildResultsSection(context),
          _buildTestimonialsSection(context),
          _buildProgramSection(context),
          _buildCTASection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: isMobile ? 20 : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.smart_toy, size: 64, color: Colors.white70),
          const SizedBox(height: 24),
          Text(
            'Formation IA en Entreprise',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '« On ne peut pas être formé à l\'IA.\nOn peut apprendre à la faire fonctionner selon SA propre manière de penser. »',
              style: TextStyle(
                fontSize: isMobile ? 18 : 22,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Pas selon la mienne, pas selon celle du formateur d\'à côté. La vôtre.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophySection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: [
            Text(
              'Mon Approche',
              style: TextStyle(
                fontSize: isMobile ? 32 : 42,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E8449),
              ),
            ),
            const SizedBox(height: 40),
            _buildPhilosophyItem(
              'Je ne suis pas un formateur IA de plus.',
              'Je suis développeur. Je bricole. Je code mes propres outils.',
              Icons.code,
            ),
            const SizedBox(height: 24),
            _buildPhilosophyItem(
              'Mon job en une journée :',
              'Vous donner les clés pour déconstruire ce que je montre et l\'adapter à votre métier.',
              Icons.vpn_key,
            ),
            const SizedBox(height: 24),
            _buildPhilosophyItem(
              'Pas reproduire mon environnement.',
              'Le vôtre.',
              Icons.person_pin,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhilosophyItem(String title, String subtitle, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF27AE60).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF27AE60), size: 28),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormatSection(BuildContext context) {
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
            'Le Format',
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildFormatCard('🕐', '1 journée', 'Présentiel, immersif, intensif.'),
              _buildFormatCard('👥', 'Équipes techniques\nou dirigeants', 'Le contenu s\'adapte à votre niveau et vos enjeux.'),
              _buildFormatCard('🔧', 'Cas concrets', 'Issus de projets réels.\nPas de démos fictives.'),
              _buildFormatCard('🖥️', 'Du vrai matos', 'Câbles, ESP32, code sur terminal noir.\nPas de salle de séminaire.\nPas de slides corporate.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormatCard(String emoji, String title, String description) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHubSection(BuildContext context) {
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
            'Un Environnement de Formation Sur-Mesure',
            style: TextStyle(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'J\'ai passé des mois à construire tout ça. Les outils, le programme, l\'infra réseau, jusqu\'au panneau LED que j\'ai soudé moi-même.',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildHubCard(
                '🖥️',
                'Terminal IA par participant',
                'Chaque poste dispose d\'un terminal Claude Code interactif. Les participants codent en conditions réelles, pas sur des slides.',
              ),
              _buildHubCard(
                '🎙️',
                'Transcription temps réel',
                'Vos questions à l\'oral sont captées, transcrites et analysées par l\'IA en direct. Le programme s\'adapte à ce qui vous intéresse vraiment.',
              ),
              _buildHubCard(
                '📺',
                'Écran synchronisé',
                'La présentation du formateur s\'affiche sur tous les postes en temps réel. Tout le monde suit, personne ne décroche.',
              ),
              _buildHubCard(
                '🗂️',
                'Workspace isolé',
                'Chaque participant a son espace de travail privé avec ses fichiers, son terminal, son historique. Tout est sauvegardé.',
              ),
              _buildHubCard(
                '⚡',
                'Multi-GPU',
                '3 machines en parallèle (GPU NVIDIA + Mac) pour que 9 participants travaillent simultanément sans latence.',
              ),
              _buildHubCard(
                '🔒',
                'Sécurité',
                'Réseau VPN privé, workspaces cloisonnés, pas de données sur le cloud.',
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
              border: Border(
                left: BorderSide(
                  color: const Color(0xFFF39C12),
                  width: 4,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pourquoi ce système ?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF39C12),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'L\'IA ne s\'apprend pas en regardant quelqu\'un faire. Elle s\'apprend en faisant soi-même, avec les bons outils, dans un environnement qui pardonne les erreurs. C\'est exactement ce que ce hub permet.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHubCard(String emoji, String title, String description) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFECF0F1), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsSection(BuildContext context) {
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
            'Le Bilan d\'UNE Journée',
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Première formation — 10 avril 2026',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                _buildResultItem('3', 'applications créées de zéro'),
                _buildResultItem('2', 'environnements IA customisés'),
                _buildResultItem('3', 'assistants Claude déployés en ligne de commande'),
                _buildResultItem('1', 'robot trieur de tomates'),
                _buildResultItem('1', 'algo de trading sur l\'EURUSD'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '(Les deux derniers, je ne les avais pas prévus au programme.)',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(String number, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF27AE60),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF2C3E50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E8449), Color(0xFF27AE60)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Text(
            'Ce Qu\'ils En Disent',
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
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
                'Merci pour tout ce partage de connaissances. Maintenant il faut mettre en pratique !',
                '— Participant, formation du 10 avril',
              ),
              _buildTestimonialCard(
                'Un éveil de haut vol. Une formation rare qui se valorisera bien.',
                '— Participant, formation du 10 avril',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String text, String author) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '❝',
            style: TextStyle(fontSize: 32, color: Color(0xFFF1C40F)),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            author,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1C40F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Text(
            'Le Programme',
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              children: [
                _buildModuleItem(
                  1,
                  'Fondamentaux LLM',
                  'Tokenisation, fenêtre de contexte, mécanisme d\'attention. Comprendre comment l\'IA "pense" pour mieux s\'en servir.',
                ),
                _buildModuleItem(
                  2,
                  'Panorama des Modèles',
                  'État du marché, modèles locaux (Ollama, LMStudio), Claude Code & prompt engineering.',
                ),
                _buildModuleItem(
                  3,
                  'Claude Code en Profondeur',
                  'La boucle agentique, les 5 catégories d\'outils, MCP (Model Context Protocol), système de mémoire.',
                ),
                _buildModuleItem(
                  4,
                  'Cas d\'Usage Réels',
                  'Hotline IA automatisée, marketing IA, apps mobiles avec IA, workflows n8n en production.',
                ),
                _buildModuleItem(
                  5,
                  'Gouvernance & Sécurité',
                  'Optimisation des coûts, comparatif pricing API, métriques ROI, tendances 2026.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleItem(int number, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFF27AE60),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
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
            'Si ça résonne, écrivez-moi.',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E8449),
            ),
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
            child: const Text(
              'Me contacter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            children: [
              _buildTag('#IA'),
              _buildTag('#Formation'),
              _buildTag('#Innovation'),
              _buildTag('#Kaiosa'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF27AE60).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF27AE60),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF1E8449),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'KAIOSA - Formation IA & Innovation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '📍 Saint-Germain-en-Laye, Île-de-France',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            '📧 contact@kaiosa.com',
            style: TextStyle(
              color: Color(0xFFF1C40F),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '© 2026 KAIOSA. Tous droits réservés.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
