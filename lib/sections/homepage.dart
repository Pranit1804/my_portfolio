import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/sections/contact_section.dart';
import 'package:my_portfolio/sections/experience_section.dart';
import 'package:my_portfolio/sections/hero_section.dart';
import 'package:my_portfolio/sections/project_section.dart';
import 'package:my_portfolio/widgets/nav_bar.dart';
import 'package:my_portfolio/widgets/section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.jetBrainsMonoTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        textTheme: textTheme,
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF0A0A0A),
          surface: Color(0xFF0E0E0E),
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: BouncingScrollWrapper.builder(context, child!),
            breakpoints: const [
              Breakpoint(start: 0, end: 600, name: MOBILE),
              Breakpoint(start: 601, end: 1024, name: TABLET),
              Breakpoint(start: 1025, end: 1920, name: DESKTOP),
            ],
          ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollCtrl = ScrollController();
  final _expKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _jumpTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0,
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        onExperience: () => _jumpTo(_expKey),
        onProjects: () => _jumpTo(_projectsKey),
        onContact: () => _jumpTo(_contactKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollCtrl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              child: HeroSection(onViewProjects: () => _jumpTo(_projectsKey)),
            ),
            // Section(key: _aboutKey, child: const AboutSection()),
            Section(key: _expKey, child: const ExperienceSection()),
            Section(key: _projectsKey, child: const ProjectsSection()),
            Section(
              key: _contactKey,
              paddingV: 56,
              child: const ContactSection(),
            ),
            const SizedBox(height: 24),
            // MaxWidth(child: Separator(text: '©')),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
