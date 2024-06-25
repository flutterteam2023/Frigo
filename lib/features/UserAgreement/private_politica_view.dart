import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frigo/constant/app_color.dart';

@RoutePage()
class PrivatePoliticaView extends StatelessWidget {
  const PrivatePoliticaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Gizlilik Politikası'),
      ),
      body:  const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 16.0,bottom:  18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                """
    Güvenliğiniz bizim için önemli. Bu sebeple bizimle paylaşacağınız kişisel verileriz hassasiyetle korunmaktadır.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                """
    Biz, Frig-o veri sorumlusu olarak, bu gizlilik ve kişisel verilerin korunması politikası ile, hangi kişisel verilerinizin hangi amaçla işleneceği, işlenen verilerin kimlerle ve neden paylaşılabileceği, veri işleme yöntemimiz ve hukuki sebeplerimiz ile; işlenen verilerinize ilişkin haklarınızın neler olduğu hususunda sizleri aydınlatmayı amaçlıyoruz.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Toplanan Kişisel Verileriniz, Toplanma Yöntemi ve Hukuki Sebebi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.primaryColor)
                  )),
                  SizedBox(height: 10),
                  Text(
                """
    Kimlik, (isim, soy isim, doğum tarihi gibi) iletişim, (adres, e-posta adresi, telefon, IP, konum gibi) özlük, sosyal medya, finans bilgileriniz ile görsel ve işitsel kayıtlarınız tarafımızca, çerezler (cookies) vb. teknolojiler vasıtasıyla, otomatik veya otomatik olmayan yöntemlerle ve bazen de analitik sağlayıcılar, reklam ağları, arama bilgi sağlayıcıları, teknoloji sağlayıcıları gibi üçüncü taraflardan elde edilerek, kaydedilerek, depolanarak ve güncellenerek, aramızdaki hizmet ve sözleşme ilişkisi çerçevesinde ve süresince, meşru menfaat işleme şartına dayanılarak işlenecektir.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Kişisel Verilerinizin İşlenme Amacı',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.primaryColor)
                  )),
                  SizedBox(height: 10),
                  Text(
                """
    Bizimle paylaştığınız kişisel verileriniz; hizmetlerimizden faydalanabilmeniz amacıyla sizlerle sözleşmeler kurabilmek, sunduğumuz hizmetlerin gerekliliklerini en iyi şekilde ve aramızdaki sözleşmelere uygun olarak yerine getirebilmek, bu sözleşmelerden doğan haklarınızın tarafınızca kullanılmasını sağlayabilmek, ürün ve hizmetlerimizi, ihtiyaçlarınız doğrultusunda geliştirebilmek ve bu gelişmelerden sizleri haberdar edebilmek, ayrıca sizleri daha geniş kapsamlı hizmet sağlayıcıları ile yasal çerçeveler içerisinde buluşturabilmek ve kanundan doğan zorunlulukların (kişisel verilerin talep halinde adli ve idari makamlarla paylaşılması) yerine getirilebilmesi amacıyla, sözleşme ve hizmet süresince, amacına uygun ve ölçülü bir şekilde işlenecek ve güncellenecektir.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Toplanan Kişisel Verilerin Kimlere ve Hangi Amaçlarla Aktarılabileceği',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.primaryColor)
                  )),
                  SizedBox(height: 10),
                  Text(
                """
    Bizimle paylaştığınız kişisel verileriniz; faaliyetlerimizi yürütmek üzere hizmet aldığımız ve/veya verdiğimiz, sözleşmesel ilişki içerisinde bulunduğumuz, iş birliği yaptığımız, yurt içi ve yurt dışındaki 3. şahıslar ile kurum ve kuruluşlara ve talep halinde adli ve idari makamlara, gerekli teknik ve idari önlemler alınması koşulu ile yasal sınırlamalar çerçevesinde aktarılabilecektir.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
               Text('Toplanan Kişisel Verilerin Kimlere ve Hangi Amaçlarla Aktarılabileceği',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.primaryColor)
                  )),
                  SizedBox(height: 10),
                   Text(
                """
    KVKK madde 11 uyarınca herkes, veri sorumlusuna başvurarak aşağıdaki haklarını kullanabilir:
Kişisel veri işlenip işlenmediğini öğrenme,
Kişisel verileri işlenmişse buna ilişkin bilgi talep etme,
Kişisel verilerin işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme,
Yurt içinde veya yurt dışında kişisel verilerin aktarıldığı üçüncü kişileri bilme,
Kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların düzeltilmesini isteme,
Kişisel verilerin silinmesini veya yok edilmesini isteme,
İşlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme,
Kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması hâlinde zararın giderilmesini talep etme, haklarına sahiptir.

Yukarıda sayılan haklarınızı kullanmak üzere frig-o@hotmail.com üzerinden bizimle iletişime geçebilirsiniz.
""",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('İletişim',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.primaryColor)
                  )),
                  SizedBox(height: 10),
                  Text(
                """
    Sizlere talepleriniz doğrultusunda hizmet sunabilmek amacıyla, sadece gerekli olan kişisel verilerinizin, işbu gizlilik ve kişisel verilerin işlenmesi politikası uyarınca işlenmesini, kabul edip etmemek hususunda tamamen özgürsünüz. Uygulamayı kullanmaya devam ettiğiniz takdirde, kabul etmiş olduğunuz tarafımızca varsayılacaktır. Şayet kabul etmiyorsanız, lütfen uygulamayı tüm cihazlarınızdan kaldırınız. Ayrıntılı bilgi için bizimle frig-o@hotmail.com e-mail adresi üzerinden iletişime geçmekten lütfen çekinmeyiniz.
              """,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
