class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Acompanhe seu trabalho e obtenha o resultado",
    image: "assets/images/image1.png",
    desc: "Lembre-se de manter um registro de suas realizações profissionais.",
  ),
  OnboardingContents(
    title: "Mantenha-se organizado com a equipe",
    image: "assets/images/image2.png",
    desc:
        "Mas compreender as contribuições que nossos colegas fazem para nossas equipes e empresas.",
  ),
  OnboardingContents(
    title: "Seja notificado quando o trabalho acontecer",
    image: "assets/images/image3.png",
    desc:
        "Assuma o controle das notificações, colabore ao vivo ou em seu próprio tempo.",
  ),
];
