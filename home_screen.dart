import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Section Philosophie
          _buildPhilosophySection(context),
          // Section Méthode
          _buildMethodSection(context),
          // Section Valeurs
          _buildValuesSection(context),
          // Footer
          _buildFooter(context),
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
      child: Column(
        children: [
          if (isMobile)
            Column(
              children: [
                _buildPhilosophyText(context),
                const SizedBox(height: 40),
                _buildPhilosophyVisual(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildPhilosophyText(context)),
                const SizedBox(width: 60),
                Expanded(child: _buildPhilosophyVisual()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ma Philosophie',
          style: GoogleFonts.roboto(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'On me demande souvent ce que je fais comme travail. Je fais du conseil en innovation, ça veut tout dire et rien à la fois.',
          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: GoogleFonts.roboto(fontSize: 18, color: Colors.black87),
            children: [
              const TextSpan(
                  text: 'Les grands cabinets qui font du conseil en innovation '),
              TextSpan(
                text: 'pondent des PowerPoint',
                style: GoogleFonts.roboto(
                  backgroundColor: const Color(0xFFF39C12),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: '. Moi, j\'ai décidé de '),
              TextSpan(
                text: 'pondre du concret',
                style: GoogleFonts.roboto(
                  backgroundColor: const Color(0xFFF39C12),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' !'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Le sujet de mon client devient mon crédo. C\'est pour cette raison que j\'ai décidé de travailler seul pour rester concentré uniquement sur mon sujet.',
          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        Text(
          'Dans la veine du low tech, ta solution tu trouveras !',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPhilosophyVisual() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF1C40F),
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
                  Icons.wb_incandescent,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'CONCRET',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodSection(BuildContext context) {
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
            'Ma Méthode',
            style: GoogleFonts.roboto(
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
              _buildMethodStep('💡', '1. L\'Idée',
                  'Je pars d\'une idée, souvent la nuit ! L\'inspiration naît de l\'observation et de l\'écoute attentive de vos besoins.'),
              _buildMethodStep('✏️', '2. Le Dessin',
                  'Je la dessine, merci l\'expérience ! Visualiser pour mieux comprendre et communiquer l\'innovation.'),
              _buildMethodStep('🔧', '3. Le Prototype',
                  'Je la prototypage avec mes moyens : imprimantes 3D, bois, métal... Tout pour donner vie aux idées.'),
              _buildMethodStep('⚡', '4. Test & Itération',
                  'Je la bricole, je la maltraite physiquement et je réitère ! Si elle n\'est pas bonne, je le saurai et pourquoi.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMethodStep(String icon, String title, String description) {
    return Container(
      width: 280,
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
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.roboto(fontSize: 14, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildValuesSection(BuildContext context) {
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
            'Nos Valeurs',
            style: GoogleFonts.roboto(
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
              _buildValueCard('Honnêteté',
                  'Une relation transparente et sincère avec nos clients, sans langue de bois ni promesses irréalistes.'),
              _buildValueCard('Transparence',
                  'Toutes nos actions sont menées dans la clarté totale, vous savez toujours où nous en sommes.'),
              _buildValueCard('Excellence',
                  'Nous visons l\'excellence dans chaque projet, sans compromis sur la qualité de nos livrables.'),
              _buildValueCard('Pragmatisme',
                  'Des solutions concrètes et réalisables, adaptées à vos contraintes réelles et votre budget.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard(String title, String description) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xFF3498DB),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3498DB),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.roboto(fontSize: 14, color: Colors.black87),
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
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '📍 Saint-Germain-en-Laye, Île-de-France',
            style: GoogleFonts.roboto(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            '📧 contact@kaiosa.com',
            style: GoogleFonts.roboto(
              color: const Color(0xFF3498DB),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '© 2025 KAIOSA. Tous droits réservés.',
            style: GoogleFonts.roboto(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
