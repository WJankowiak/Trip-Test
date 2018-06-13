//
//  LectureSwipeController.swift
//  Trip Test
//
//  Created by Wojciech Jankowiak on 19/05/2018.
//  Copyright © 2018 Wojciech Jankowiak. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class LectureSwipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var Lectures:[Lecture] = [
        Lecture (imageName: "Galway", lectureText: "Katedra Wniebowzięcia NMP i św. Mikołaja w Galway (irl. Ard-Eaglais Mhaighdean na Deastógála agus Naomh Nioclás) – główna świątynia diecezji Galway, Kilmacduagh i Kilfenora w Irlandii. Mieści się przy placu Cathedral Square w Galway. Została wybudowana w latach 1958–1965 z wapienia, na miejscu dawnego więzienia miejskiego. Podczas poświęcenia w 1965 dokonanego przez kardynała Richard Cushinga otrzymała wezwanie Wniebowzięcia NMP i św. Mikołaja.\n Pod względem architektonicznym jest budowlą eklektyczną, z przewagą neorenesansu i stylu neoromańskiego zaprojektowaną przez Johna J. Robinsona. Jest wysoka na 44,2 metry. Budowla wzorowana jest na kościele z hiszpańskiego miasta Salamanka."),
        Lecture (imageName:"Sagrada",lectureText:"Sagrada Família (właśc. hiszp. Templo Expiatorio de la Sagrada Familia, katal. Temple Expiatori de la Sagrada Família, (pol.) Świątynia Pokutna Świętej Rodziny) – secesyjny kościół w Barcelonie w Katalonii o statusie bazyliki mniejszej, uważany za główne osiągnięcie projektanta Antoniego Gaudíego.\n W założeniu architekta sama konstrukcja budowli miała przypominać jeden wielki organizm. Budowę świątyni rozpoczęto w 1882 roku. Początkowo jej projekt zlecono innemu architektowi, ale ten wszedł w konflikt ze stowarzyszeniem finansującym budowę świątyni. Wówczas zlecenie na budowę otrzymał Gaudí, który całkowicie zmienił projekt, nadając mu własny styl. Przez następne cztery dekady pracował intensywnie nad konstrukcją, poświęcając jej całkowicie ostatnich 15 lat życia. Podczas prac nieustannie dostosowywał i zmieniał pierwotne założenia. \n Wieże kościoła ukończono w 1920 roku. Sześć lat później architekt zginął, wpadając pod przejeżdżający tramwaj, pozostawiając tylko jedną z trzech zaprojektowanych fasad. Pochowano go w krypcie wewnątrz kościoła.\n Z powodu organicznej formy budowli oraz niepowtarzalności detali architektonicznych (tak jak w naturze żaden z nich nie jest identyczny i musi być osobno rzeźbiony) do dziś nie zdołano jej ukończyć. Projekty świątyni pozostawione przez architekta zostały zniszczone w czasie hiszpańskiej wojny domowej przez katalońskich anarchistów.\n 7 listopada 2010 w niedzielę podczas uroczystej mszy świętej, w której uczestniczyło 62 tys. osób, papież Benedykt XVI konsekrował Świątynię Świętej Rodziny (Sagrada Familia) podnosząc ją do godności bazyliki mniejszej."),
        Lecture (imageName: "Notre", lectureText:"Notre-Dame de Paris – gotycka katedra w Paryżu. Jedna z najbardziej znanych katedr na świecie, między innymi dzięki powieści Dzwonnik z Notre Dame francuskiego pisarza Victora Hugo.\n Jej nazwa tłumaczy się jako Nasza Pani i odnosi się do Matki Boskiej. Wzniesiono ją na wyspie na Sekwanie, zwanej Île de la Cité w 4. okręgu Paryża, na śladach po dwóch kościołach powstałych jeszcze w IX wieku. Jej budowa trwała ponad 180 lat (1163-1345)." ),
        Lecture (imageName: "Firenze", lectureText: "Katedra Santa Maria del Fiore, Duomo – katedra we Florencji, zwana przez Włochów Il Duomo, zbudowana w miejscu wcześniejszego kościoła katedralnego Santa Reparata z IV w.\n Wykonanie tego dzieła Cech Sztuk zlecił Arnolfowi di Cambio w 1294 r. Prace pod jego kierunkiem rozpoczęto 8 września 1296 wznosząc nową świątynię wokół istniejącego kościoła, w którym sprawowano liturgię aż do 1375 r. Wtedy kościół Santa Reparata zburzono. Po śmierci di Cambio (w 1302) pracami kierowali: Giotto di Bondone, Andrea Pisano, Francesco Talenti.\n Po śmierci Arnolfa di Cambio wprowadzono kilka zmian w opracowanym przez niego projekcie konstrukcyjnym. Wiele z nich dotyczyło wschodniej części kościoła, która została ukończona na początku XV wieku. Konkurs na projekt kopuły wygrał Filippo Brunelleschi (według niektórych źródeł rozstrzygnięcie konkursu nastąpiło w 1420 r., ale podawane są także daty 1416-1434 jako czas jej wykonania). Kościół konsekrowano w 1436. W latach 1445-1461 nad sklepieniem zbudowano latarnię zwieńczoną złocistą kulą.\n Najpóźniej została ukończona fasada. W 1578 zburzono nigdy nieukończoną elewację zaprojektowaną przez Arnofla di Cambio i ogłoszono konkurs na projekt nowej fasady. Nie został on rozstrzygnięty. Przez blisko 300 lat organizowano kolejne konkursy i odrzucano napływające rozwiązania. Dopiero w 1871 r. projekt Emilia de Fabris zyskał akceptację. Prace trwały do 1887 i tym samym ukończono budowaną z przerwami przez blisko 600 lat katedrę Santa Maria del Fiore. Jest to kościół o imponujących rozmiarach. Jego wnętrze ma długość 153,0 m, szerokość w korpusie (szerokość naw) – 38,0 m, na wysokości prezbiterium wraz z przyległymi apsydami – 90,0 m."),
        Lecture (imageName: "Hagia", lectureText: "Bazylika Hagia Sophia, Aja Sofia (gr. Ἁγία Σοφία, tur. Ayasofya) – muzeum w Stambule (dawny Konstantynopol). W przeszłości świątynia chrześcijańska, następnie meczet. Budynek uważany za najwspanialszy obiekt architektury i budownictwa całego pierwszego tysiąclecia naszej ery.\n Będąc świątynią chrześcijańską, nosił nazwę Kościoła Mądrości Bożej (zwany czasem również Wielkim Kościołem). Była to najwyższa rangą świątynia w Cesarstwie Bizantyjskim, katedra patriarsza oraz miejsce modłów i koronacji cesarzy. W ciągu wieków niedościgniony wzór świątyni doskonałej i niemal symbol Kościoła bizantyjskiego[2]. Została ufundowana przez Justyniana I Wielkiego, w obecnym kształcie powstała w okresie od 23 lutego 532 do 27 grudnia 537. Po zdobyciu Konstantynopola przez Turków w 1453 zamieniona na meczet (wtedy m.in. dobudowano minarety). Świątynię miał przyćmić wybudowany w XVII wieku Błękitny Meczet. Obecnie muzeum. Nazwa kościoła znaczy dosłownie „Boża Mądrość” i odnosi się do jednego z atrybutów Boga.")]
    var Lectures2:[Lecture] = [
        Lecture (imageName:"Galway",lectureText:"Katedra Wniebowzięcia NMP i św. Mikołaja w Galway (irl. Ard-Eaglais Mhaighdean na Deastógála agus Naomh Nioclás) – główna świątynia diecezji Galway, Kilmacduagh i Kilfenora w Irlandii. Mieści się przy placu Cathedral Square w Galway. Została wybudowana w latach 1958–1965 z wapienia, na miejscu dawnego więzienia miejskiego. Podczas poświęcenia w 1965 dokonanego przez kardynała Richard Cushinga otrzymała wezwanie Wniebowzięcia NMP i św. Mikołaja.\n Pod względem architektonicznym jest budowlą eklektyczną, z przewagą neorenesansu i stylu neoromańskiego zaprojektowaną przez Johna J. Robinsona. Jest wysoka na 44,2 metry. Budowla wzorowana jest na kościele z hiszpańskiego miasta Salamanka."),
        Lecture (imageName: "Sagrada", lectureText:"Wszyscy wiedzą co to Sagrada Familia. Nawet Ci co nigdy nie byli i nigdy nie będą w Barcelonie. Wiadomo, że Gaudi, wiadomo że ‘must see’, plotki krążą że nie warto wchodzić do środka. Te podejrzewam że rozpuszczają tylko Ci, którzy mieli pecha, trafili na gigantyczną kolejkę, nie chciało im się w niej stać, albo po prostu brakło im pieniędzy i dlatego powtarzają takie bzdety.\n Antoni Gaudi zginął na torach potrącony przez tramwaj w 1926 roku. Został pochowany w krypcie wewnątrz Sagrada Familia\n \n Sagrada Familia to najczęściej odwiedzana atrakcja turystyczna w Hiszpanii. Rocznie odwiedza ją ok. 3 milionów turystów.  Jeśli 3 miliony ludzi stwierdza że warto wejść do środka, to niech mi teraz ktoś powie że nie warto!\n Gaudi zaprojektował kościół w taki sposób żeby nie przekraczała wysokości 984 metrów nad poziomem morza. Dlaczego? Bo uważał że nad miastem ma górować naturalnie przez Boga stworzony wytwór, czyli góra Montjuic, która znajduje się właśnie 984 stopy nad poziomem morza.\n Na ukończonym Kościele powinno znajdować się 18 wież: po jednej dla każdego apostoła, 4 ewangelistów, jedna dla Matki Boskiej, i najwyższa w imię Jezusa" ),
        Lecture (imageName: "Notre", lectureText: "Katedra Notre Dame swoją chwałę zawdzięcza nie tylko słynnej powieści Wiktora Hugo. Co roku blisko 12 milionów turystów staje w zachwycie przed tą imponującą bryłą, co czyni z niej najczęściej odwiedzanym zabytkiem we Francji.\n Budowa świątyni godnie reprezentującej Paryż rozpoczęła się w XII w i trwała blisko 200 lat. Jeszcze nie dokończono budowy katedry, a stała się ona centrum najważniejszych wydarzeń w historii Francji. Stąd w średniowieczy wyruszały wyprawy krzyżowe, a kilkaset lat później w 1804 Napoleon Bonaparte koronował się na Cesarza Francuzów. Tutaj również tysiące Francuzów żegnało przywódcę Charles de Gaulle’a.\n Katedrę Marii Panny w Paryżu zdobią dwie masywne wieże. Koronkowa rozeta w kształcie kwadratu symbolizuje wieczność, a otaczające ją koło doczesność. Została ona wykonana z taką starannością, że przez 700 lat nie wypaczył się żaden element! Do katedry wiodą trzy portale misternie zdobione scenami biblijnymi dla niepiśmiennego ludu. Powyżej umieszczono posągi 28 królów. W środku budowli znajduje się wiele witraży i aż 29 kapliczek.\n Zwiedzając katedrę, warto wejść na jej wieżę (wstęp płatny), skąd rozpościera się wspaniały widok na cały Paryż, wyspę La Cite, na której wzniesiono katedrę oraz Sekwanę.\n Dziedziniec przed katedrą od 2006 r nosi nazwę placu Jana Pawła II. Znajduje się na nim niewielka gwiazda z brązu tzw. Point Zero – miejsce, od którego mierzy się odległości do innych miast we Francji."),
        Lecture (imageName: "Firenze", lectureText: "Popularnie zwana przez Włochów Il Duomo (co znaczy Katedra) podobnie jak liczne świątynie tego okresu budowana była przez setki lat. Była też miejscem wielu ważnych wydarzeń w historii miasta, a dziś przyciąga licznych turystów. I chociaż jej fasada budzi liczne kontrowersje to z całą pewnością wizyta we Florencji bez rzucenia okiem na Il Duomo nie będzie pełna.\n Wprawdzie katedra we Florencji istniała już w czasach starożytnych (jednym z biskupów był św. Zenobiusz obecny patron miasta), ale jej rolę pełnił kościół św. Reparaty (zbudowany na ruinach rzymskiej świątyni) lub Battistero. Szybki rozwój miasta i jego udział w walkach o władzę we Włoszech sprawił, że tamtejsza signoria (grupa przedstawicieli najprzedniejszych rodów sprawujących władzę) w 1294 roku postanowiła zbudować kościół godny potężnego miasta. Planowano przebudowę św. Reparaty, ale ostatecznie zdecydowano się na wystawienie zupełnie nowej budowli. Naczelnym architektem mianowano Arnolfa di Cambino. Jego projekt wyróżniał się gigantyczną kopułą, która miała skrywać prezbiterium. Cambino zmarł w trakcie budowy i okazało się, że nikt inny nie potrafi stworzyć tak potężnej kopuły. Dopiero w 1423 roku (czyli ponad 120 lat po śmierci Cambino) tego śmiałego przedsięwzięcia podjął się Filippo Brunelleschi. Nie obyło się zresztą bez problemów, bo z Brunelleschim rywalizował inny znany architekt Lorenzo Ghiberti. Ostatecznie okazało się, że tylko Brunelleschi jest w stanie dokonać tego, co uważano za niemożliwie. Architekt stworzył dwie czasze (zewnętrzną i wewnętrzną), a grubszą z nich umocnił jodełkowym ułożeniem cegieł. Całość gotowa była po 13 latach!"),
        Lecture (imageName: "Hagia", lectureText: "Hagia Sophia, kościół Mądrości Bożej leży we wschodniej części starego miasta Konstantynopola w pobliżu Bosforu.\n Zlecenie budowy wspaniałego kościoła wydał w 532r. wschodniorzymski cesarz Justynian I. Miał to być 'kościół jakiego dotąd jeszcze nie było i nigdy nie będzie' Zaprojektowali i wybudowali go matematyk Anthemios z Tralles oraz budowniczy Izydor z Miletu. Cesarz zlecił dostarczenie najlepszych materiałów ze wszystkich stron swego imperium. Często pochodziły one z rozbieranych dawnych świątyń greckich.\n Hagia Sophia ujmuje przede wszystkim swym wysokim rozległym wnętrzem i światłocieniami. Sprawiają one wrażenie, że kopuła zawieszona jest w powietrzu. Światło wpada z okien bocznych oraz umieszczonych w podstawie kopuły i oświetla wszystkie powierzchnie wnętrza, tworząc przeróżne cienie. Kopuła Hagii Sophii ma średnicę 31 metrów. Nie należy ona do największych w starożytności, ale jest skonstruowana w sposób bardzo śmiały. Jej sklepienie zbudowane jest z lekkich cegieł oraz podzielone przez 40 mocnych ożebrowań ceglanych. Kopuła spoczywa na 4 potężnych filarach, które po bokach są łączone dwukondygnacyjnym rzędem kolumn. Boczne nawy razem z westybulem tworzą krużganek. Westybul ma 60 m. długości i 10 m. szerokości. Wejście do Hagii Sophii znajduje się dziś po stronie zachodniej. Kościół ma ponad 80 m. długości i łącznie z nawami bocznymi 75 m. szerokości. Wnętrze Kościoła Mądrości Bożej otrzymało w czasach bizantyjskich bogaty wystrój mozaikowy, z którego zachowało się niewiele. Postacie na mozaikach były umieszczane na jednolitym złotym tle. Tematem obrazów mozaikowych jest chrześcijańskie posłanie.\n W 1453r. Konstantynopol zdobyli Turcy i przekształcili Hagię Sophię w meczet Ayasofya. Dobudowano wtedy w narożach 4 minarety. Turcy wielokrotnie odnawiali mocno uszkodzoną trzęsieniami ziemi budowlę. Dokonali w jej wnętrzu tylko niewielkich zmian. Na ścianach zawiesili draperie z imieniem Proroka oraz surami Koranu a mozaiki obłożyli gipsem. Bizantyjskie mozaiki odkryto dopiero w XIX w., ale musiano je powtórnie pobielić. Te wspaniałe mozaiki odsłonięto ostatecznie dopiero w latach trzydziestych w XX w. Tymczasem w 1934r. Konstantynopol przemieniono na Stambuł, a prezydent Turcji Kemal Ataturk przekształcił Hagię Sophię w muzeum.")]
    var Correct : [Bool] = [true, true, true, true, true]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Lectures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> CollectionCell {
        let cellIdentifier = "LecturesCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionCell
        if Correct[indexPath.row] {
            cell.image?.image = UIImage(named: Lectures[indexPath.row].imageName)
            cell.text.text = Lectures[indexPath.row].lectureText
        } else {
            cell.image?.image = UIImage(named: Lectures2[indexPath.row].imageName)
            cell.text.text = Lectures2[indexPath.row].lectureText
        }
    
        return cell
    }
    
    override func prepare (for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "showTestSummary" {

            let destinationController = seque.destination as! TestViewController
            print (Correct)
            destinationController.isCorrect = self.Correct
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: collectionView.bounds.width-10, height: collectionView.bounds.height)
        } else {
            return CGSize(width: collectionView.bounds.width-10, height: collectionView.bounds.height)
        }
    }
    
    @IBAction func goToTest(_ sender: Any) {
        let optionMenu = UIAlertController (title: nil, message: "Czy chcesz rozpocząć test?", preferredStyle: .alert)
        let confirm = UIAlertAction(title:"Tak", style: .default, handler: { action in self.performSegue(withIdentifier: "showTestSummary",sender: self)})
        let cancel = UIAlertAction(title: "Nie", style: .default, handler: nil)
        optionMenu.addAction(confirm)
        optionMenu.addAction(cancel)
        present(optionMenu,animated: true,completion: nil)
    }

 

}
