
class NewsListModel {
  List<ArticleModel>? articles = [];
  int? count;

  NewsListModel({this.articles,this.count});

  factory NewsListModel.fromJSON(Map<String, dynamic> json){
    print("articles: "+ json["articles"].length.toString());
    List<ArticleModel> arts = [];
    json["articles"].forEach((e) {
      arts.add(ArticleModel.fromJSON(e));
    });
    return NewsListModel(
      articles: arts,
      count: json["totalResults"]
    );
  }
}

class ArticleModel {
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  String? sourceName;
  String? title;
  String? url;
  String? urlToImage;

  ArticleModel({
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.sourceName,
    this.title,
    this.url,
    this.urlToImage
});

  factory ArticleModel.fromJSON(Map<String, dynamic> json) {
    return ArticleModel(
    author: json["author"],
    content: json["content"],
      description: json["description"],
      title: json["title"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      sourceName: json["source"]["name"]
    );
  }

}


Map<String,Object> newsMap = {
  "articles": [
    {
      "author": null,
      "content": "Congress president Sonia Gandhi today led the Opposition charge over the passage. PTI\r\nNew Delhi: Congress president Sonia Gandhi today led the Opposition charge in Parliament over a passage in a que… [+2638 chars]",
      "description": "Congress president Sonia Gandhi today led the Opposition charge in Parliament over a passage in a question paper for Class 10 students of Central Board of Secondary Education (CBSE), which has drawn criticism for its misogynistic undertones.",
      "publishedAt": "2021-12-13T07:55:29Z",
      "source": {
        "id": null,
        "name": "NDTV News"
      },
      "title": "\"Blatantly Misogynist\" CBSE Exam Question Provokes Opposition Walkout - NDTV",
      "url": "https://www.ndtv.com/india-news/blatantly-misogynist-cbse-exam-question-provokes-opposition-walkout-in-parliament-2648546",
      "urlToImage": "https://c.ndtvimg.com/2021-12/95173qr8_sonia-gandhi_625x300_13_December_21.jpg"
    },
    {
      "author": "GK Web Desk",
      "content": "\"SrinagarEncounterUpdate: 02 unidentified terrorists killed. Search going on. Further details shall follow, \" a police spokesman said.",
      "description": null,
      "publishedAt": "2021-12-13T07:50:35Z",
      "source": {
        "id": null,
        "name": "Greater Kashmir"
      },
      "title": "Two militants killed in Rangreth gunfight, say police - Greater Kashmir",
      "url": "https://www.greaterkashmir.com/srinagar/two-militants-killed-in-rangreth-gunfight-say-police",
      "urlToImage": "https://gumlet.assettype.com/greaterkashmir%2F2021-12%2F953537f2-61f4-4fcf-b0e3-6b6ec7e75eab%2FIMG_20211213_WA0010.jpg?rect=0%2C97%2C1600%2C840&w=1200&auto=format%2Ccompress&ogImage=true"
    },
    {
      "author": null,
      "content": "<ul><li>The OnePlus Nord 2 CEs specs may have just leaked.</li><li>Expect a Mediatek Dimensity 900 chipset and faster wired charging.</li></ul>\r\nThe OnePlus Nord CE launched earlier this year, essent… [+1868 chars]",
      "description": "The OnePlus Nord 2 CE specs may have just leaked, and it looks like we've only got a couple of upgrades in tow.",
      "publishedAt": "2021-12-13T07:21:59Z",
      "source": {
        "id": null,
        "name": "Android Authority"
      },
      "title": "The OnePlus Nord 2 CE specs may have just leaked - Android Authority",
      "url": "https://www.androidauthority.com/oneplus-nord-2-ce-3074603/",
      "urlToImage": "https://cdn57.androidauthority.net/wp-content/uploads/2021/06/OnePlus-Nord-CE-showing-back-placed-on-box.jpg"
    },
    {
      "author": "News18",
      "content": "Garena Free Fire is an adventure-driven shooter battle royale game that garnered immense popularity amid the Indian government’s ban on PUBG Mobile India. Now, Free Fire is among the leading mobile g… [+2068 chars]",
      "description": "Free Fire players are always eagerly awaiting the availability of a fresh batch of redemption codes. These codes enable players to earn a wide range of in-game goodies.",
      "publishedAt": "2021-12-13T07:16:23Z",
      "source": {
        "id": null,
        "name": "News18"
      },
      "title": "Garena Free Fire Redeem Codes December 13: Free Diamonds, Character - How to Redeem Today's Codes - News18",
      "url": "https://www.news18.com/news/tech/garena-free-fire-redeem-codes-december-13-free-diamonds-character-how-to-redeem-todays-codes-4549061.html",
      "urlToImage": "https://images.news18.com/ibnlive/uploads/2021/09/garena-free-fire-163298883216x9.jpg"
    },
    {
      "author": "Buzz Staff",
      "content": "In August 2012, NASA already successfully landed a rover on Mars called Curiosity. Curiositys success motivated NASA to launch another rover on Mars, despite the budget cuts and the uncertainty surro… [+2449 chars]",
      "description": "Perseverance will soon be celebrating its one-year anniversary on Mars. Therefore, let’s take a glimpse on its journey so far, which amounts to Sol 285, or roughly 291 days on the red and rough surface.",
      "publishedAt": "2021-12-13T07:11:19Z",
      "source": {
        "id": null,
        "name": "News18"
      },
      "title": "NASA's Perseverance Rover's Journey From Earth to New Home on Mars in 2021 - News18",
      "url": "https://www.news18.com/news/buzz/nasas-perseverance-rovers-journey-from-earth-to-a-home-on-mars-in-2021-4536296.html",
      "urlToImage": "https://images.news18.com/ibnlive/uploads/2021/11/nasa-perseverance-rover-163586876616x9.jpg"
    },
    {
      "author": "NDTV Sports Desk",
      "content": "Max Verstappen won his maiden F1 world championship title in the most dramatic of circumstances after emerging victorious at the Abu Dhabi Grand Prix on Sunday. Mercedes' Lewis Hamilton looked set to… [+3589 chars]",
      "description": "Twitter blew up after Max Verstappen's dramatic win at the Abu Dhabi Grand Prix that saw him clinch his maiden F1 world championship title.",
      "publishedAt": "2021-12-13T07:10:45Z",
      "source": {
        "id": null,
        "name": "NDTV News"
      },
      "title": "Best Memes On Twitter After Max Verstappen's Controversial F1 World Title Triumph - NDTV Sports",
      "url": "https://sports.ndtv.com/formula-1/best-memes-on-twitter-after-max-verstappens-controversial-f1-world-title-triumph-2648480",
      "urlToImage": "https://c.ndtvimg.com/2021-12/hjaha2ag_max-verstappen-afp_625x300_13_December_21.jpg?im=FeatureCrop,algorithm=dnn,width=1200,height=675"
    },
    {
      "author": null,
      "content": null,
      "description": "The telescope will blast off on an Ariane 5 rocket from Europe's Spaceport in French Guiana on December 22.",
      "publishedAt": "2021-12-13T06:47:53Z",
      "source": {
        "id": null,
        "name": "India Today"
      },
      "title": "James Webb Space Telescope launches this month, here's the science behind it - India Today",
      "url": "https://www.indiatoday.in/science/story/james-webb-telescope-launch-science-birth-of-galaxy-stars-black-hole-nasa-esa-1887153-2021-12-13",
      "urlToImage": "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202112/James_Webb_Telescope-647x363.jpeg?J1euSvDXt1dYfSkvxPjDsKZAsKq5gxAl"
    },
    {
      "author": null,
      "content": null,
      "description": "Apple is said to be on time with its production plans for the iPhone SE 2022 and if new reports are to be believed, the new generation of the device will mark its debut by the first quarter of 2022. Here is what we expect the smartphone to come with as and wh…",
      "publishedAt": "2021-12-13T06:45:01Z",
      "source": {
        "id": null,
        "name": "India Today"
      },
      "title": "Apple iPhone SE 3 may launch by March next year, here is what we know so far - India Today",
      "url": "https://www.indiatoday.in/technology/news/story/apple-iphone-se-3-may-launch-by-march-next-year-here-is-what-we-know-so-far-1887152-2021-12-13",
      "urlToImage": "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202112/iPhone_SE_2020-647x363.jpeg?_aa7ErgBsEu45ffs7KfyooaEOeaVBhQr"
    },
    {
      "author": "PTI",
      "content": "Goals &amp; excitement Working with Rahul Dravid @imVkohli's legacy as India's white-ball captain #TeamIndia's n https://t.co/jA23vx6Jcy\r\n— BCCI (@BCCI) 1639368001000",
      "description": "Cricket News: Virat Kohli led India from the front for five years as the team's limited-overs captain, said his successor Rohit Sharma, insisting that he enjoyed \"e",
      "publishedAt": "2021-12-13T06:19:00Z",
      "source": {
        "id": "the-times-of-india",
        "name": "The Times of India"
      },
      "title": "Virat Kohli led from the front for five years, enjoyed each and every moment under him: Rohit Sharma - Times of India",
      "url": "https://timesofindia.indiatimes.com/sports/cricket/news/virat-kohli-has-put-team-india-in-the-situation-where-there-is-no-looking-back-rohit-sharma/articleshow/88249893.cms",
      "urlToImage": "https://static.toiimg.com/thumb/msid-88250164,width-1070,height-580,imgsize-48998,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg"
    },
    {
      "author": null,
      "content": "Alibaba in recent months has taken a hard line against information leaks associated with the case.\r\nAlibaba Group Holding Ltd. has fired a woman who accused a manager of sexual assault, a surprise mo… [+4273 chars]",
      "description": "Alibaba Group Holding Ltd. has fired a woman who accused a manager of sexual assault, a surprise move that came just months after China's e-commerce leader admitted bungling its initial response to the allegation.",
      "publishedAt": "2021-12-13T06:16:48Z",
      "source": {
        "id": null,
        "name": "NDTV News"
      },
      "title": "Alibaba Fires Woman Who Accused Boss of Rape In #MeToo Setback - NDTV",
      "url": "https://www.ndtv.com/world-news/alibaba-fires-woman-who-accused-boss-of-rape-in-metoo-setback-2648398",
      "urlToImage": "https://c.ndtvimg.com/2021-12/m16kacf_alibababloomberg-_625x300_13_December_21.jpg"
    },
    {
      "author": "IE Online",
      "content": null,
      "description": "CTET Admit Card 2021 Released @ctet.nic.in- CBSE to begin CTET 2021 exam from Dec 16 to Jan 13, Photo, signature correction facility opens @ ctet.nic.in",
      "publishedAt": "2021-12-13T06:13:39Z",
      "source": {
        "id": null,
        "name": "The Indian Express"
      },
      "title": "CTET 2021 admit card released: How to download - The Indian Express",
      "url": "https://indianexpress.com/photos/education-gallery/ctet-2021-admit-card-released-how-to-download-ctet-nic-in-7669928/",
      "urlToImage": "https://images.indianexpress.com/2021/12/Screenshot-2021-12-13-at-11.18.13-AM-1.png"
    },
    {
      "author": "Al Jazeera",
      "content": "Harnaaz Sandhu of India has been crowned the 70th Miss Universe, topping a field of some 80 contestants in a pageant that was touched by politics and the pandemic.\r\nThe previously reigning Miss Unive… [+4710 chars]",
      "description": "Sandhu, a 21-year-old model, tops a field of some 80 contestants in a pageant that was touched by politics and pandemic.",
      "publishedAt": "2021-12-13T06:01:19Z",
      "source": {
        "id": "al-jazeera-english",
        "name": "Al Jazeera English"
      },
      "title": "India’s Harnaaz Sandhu wins Miss Universe contest held in Israel - Al Jazeera English",
      "url": "https://www.aljazeera.com/news/2021/12/13/india-harnaaz-sandhu-miss-universe-pageant-israel",
      "urlToImage": "https://www.aljazeera.com/wp-content/uploads/2021/12/AP21347132643243.jpg?resize=1200%2C630"
    },
    {
      "author": null,
      "content": null,
      "description": null,
      "publishedAt": "2021-12-13T05:41:21Z",
      "source": {
        "id": "google-news",
        "name": "Google News"
      },
      "title": "Share Market LIVE: Sensex down from highs, still in green, Nifty below 17,600, resistance near 17,650 - The Financial Express",
      "url": "https://news.google.com/__i/rss/rd/articles/CBMivgFodHRwczovL3d3dy5maW5hbmNpYWxleHByZXNzLmNvbS9tYXJrZXQvc2hhcmUtbWFya2V0LXRvZGF5LWxpdmUtdXBkYXRlcy1zZW5zZXgtbmlmdHktcnVwZWUtdnMtZG9sbGFyLXRlZ2EtaW5kdXN0cmllcy1zaGFyZS1saXN0aW5nLW1ldHJvLWJyYW5kcy1pcG8tbWVkcGx1cy1oZWFsdGgtZGVjZW1iZXItMTMtbW9uZGF5LzIzODczMTEv0gEA?oc=5",
      "urlToImage": null
    },
    {
      "author": "HT Entertainment Desk",
      "content": "Actor Katrina Kaif on Monday shared new pictures from her wedding day giving a glimpse inside the celebrations. Taking to Instagram, Katrina dropped the photos in which she walked under a flower-ador… [+2040 chars]",
      "description": "Katrina Kaif has given her fans a glimpse inside her wedding day. Last week Katrina and Vicky tied the knot in Rajasthan. See their pictures here. | Bollywood",
      "publishedAt": "2021-12-13T05:34:13Z",
      "source": {
        "id": null,
        "name": "Hindustan Times"
      },
      "title": "Katrina Kaif walks towards Vicky Kaushal under floral canopy held by sisters. See pics from moments before varmala - Hindustan Times",
      "url": "https://www.hindustantimes.com/entertainment/bollywood/katrina-kaif-walks-towards-vicky-kaushal-under-floral-canopy-held-by-sisters-see-pics-from-moments-before-varmala-101639372271474.html",
      "urlToImage": "https://images.hindustantimes.com/img/2021/12/13/1600x900/katrina_kaif_1639372827245_1639372840816.PNG"
    },
    {
      "author": null,
      "content": "Mahatma Gandhi was a Hindu and Nathuram Godse was a Hindutvawadi, Rahul Gandhi told a gathering in Jaipur during the national rally organised to protest against the price rise and inflatio.Congress l… [+2836 chars]",
      "description": "Congress leader Rahul Gandhi on Sunday, December 12, said India is a ‘country of Hindus and not Hindutvawadis,’ and that Hindutvawadis need to be ousted from power. Addressing a rally in Jaipur that was also attended by party president Sonia Gandhi and genera…",
      "publishedAt": "2021-12-13T05:31:37Z",
      "source": {
        "id": null,
        "name": "The News Minute"
      },
      "title": "‘Oust Hindutvawadis from power, India needs rule of Hindus’: Rahul Gandhi - The News Minute",
      "url": "https://www.thenewsminute.com/article/oust-hindutvawadis-power-india-needs-rule-hindus-rahul-gandhi-158653",
      "urlToImage": "https://www.thenewsminute.com/sites/default/files/RahulGandhi_131221_1200x800_PTI.jpg"
    },
    {
      "author": "TIMESOFINDIA.COM",
      "content": null,
      "description": "Infinix is all set to launch its two new smartphones in India today. The HongKong-based smartphone maker will launch the all new Infinix Note 11 and I",
      "publishedAt": "2021-12-13T05:07:00Z",
      "source": {
        "id": "the-times-of-india",
        "name": "The Times of India"
      },
      "title": "Infinix Note 11, Note 11S smartphones to launch in India today - Times of India",
      "url": "https://timesofindia.indiatimes.com/gadgets-news/infinix-note-11-note-11s-smartphones-to-launch-in-india-today/articleshow/88250036.cms",
      "urlToImage": "https://static.toiimg.com/thumb/msid-88250015,width-1070,height-580,imgsize-17402,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg"
    },
    {
      "author": null,
      "content": null,
      "description": null,
      "publishedAt": "2021-12-13T05:00:00Z",
      "source": {
        "id": "google-news",
        "name": "Google News"
      },
      "title": "Parliament Live Updates | Sonia speaks about 'misogynistic' questions in CBSE exam paper - The Hindu",
      "url": "https://news.google.com/__i/rss/rd/articles/CBMiYmh0dHBzOi8vd3d3LnRoZWhpbmR1LmNvbS9uZXdzL25hdGlvbmFsL3BhcmxpYW1lbnQtcHJvY2VlZGluZ3MtbGl2ZS1kZWNlbWJlci0xMy9hcnRpY2xlMzc5NDI0MTYuZWNl0gFnaHR0cHM6Ly93d3cudGhlaGluZHUuY29tL25ld3MvbmF0aW9uYWwvcGFybGlhbWVudC1wcm9jZWVkaW5ncy1saXZlLWRlY2VtYmVyLTEzL2FydGljbGUzNzk0MjQxNi5lY2UvYW1wLw?oc=5",
      "urlToImage": null
    },
    {
      "author": null,
      "content": "Minda Industries share price touched a 52-week high of Rs 1,019, scaling over 7 percent in early trade on December 13, after the company signed a deal with FRIWO AG Germany to manufacture and supply … [+2191 chars]",
      "description": "Minda Industries also approved the expansion of its two-wheeler alloy wheel capacity by 2.0 million wheels per annum at its existing Supa Plant in Maharashtra.",
      "publishedAt": "2021-12-13T04:39:46Z",
      "source": {
        "id": null,
        "name": "Moneycontrol"
      },
      "title": "Minda Industries shares scale 52-week high on German deal, capacity addition - Moneycontrol.com",
      "url": "https://www.moneycontrol.com/news/business/stocks/minda-industries-shares-scale-52-week-high-on-german-deal-capacity-addition-7818031.html",
      "urlToImage": "https://images.moneycontrol.com/static-mcnews/2021/08/wheels_rim-wheel_steel-strips-wheel-770x433.jpg"
    },
    {
      "author": "PTI",
      "content": "India's coronavirus tally rose to 3,46,97,860 with 7,350 people testing positive for the infection in a day, while the number of active cases declined to 91,456, the lowest in 561 days, the Union Hea… [+1508 chars]",
      "description": "A decline of 825 cases has been recorded in the active COVID-19 case count in a span of 24 hours. The daily positivity rate was recorded at 0.86%. It has been less than 2% for the last 70 days. The weekly positivity rate was recorded at 0.69%. It has been bel…",
      "publishedAt": "2021-12-13T04:38:00Z",
      "source": {
        "id": "the-times-of-india",
        "name": "The Times of India"
      },
      "title": "India sees 7,350 new COVID-19 cases, 202 deaths in last 24hrs; lowest in 561 days - Economic Times",
      "url": "https://economictimes.indiatimes.com/news/india/india-sees-7350-new-covid-19-cases-202-deaths-in-last-24hrs-lowest-in-561-days/articleshow/88249525.cms",
      "urlToImage": "https://img.etimg.com/thumb/msid-88249553,width-1070,height-580,imgsize-109362,overlay-economictimes/photo.jpg"
    },
    {
      "author": null,
      "content": "Tega Industries had a bumper debut on the bourses on December 13 with a massive 67.77 percent premium on listing. The opening price on the BSE was Rs 753 against an issue price of Rs 453 per share, w… [+2316 chars]",
      "description": "Tega Industries | The listing was on expected lines given the strong IPO subscription, better financial growth, return ratios and high repeat business. A positive market sentiment also supported the listing",
      "publishedAt": "2021-12-13T04:30:21Z",
      "source": {
        "id": null,
        "name": "Moneycontrol"
      },
      "title": "Tega Industries sees bumper listing, debuts with 67.7% premium - Moneycontrol.com",
      "url": "https://www.moneycontrol.com/news/business/ipo/tega-industries-sees-bumper-listing-debuts-with-67-7-premium-7817411.html",
      "urlToImage": "https://images.moneycontrol.com/static-mcnews/2020/01/Sensex_BSE_NSE_Stock-market_bull_bear_Gold-5-770x433.png"
    }
  ],
  "status": "ok",
  "totalResults": 38
};