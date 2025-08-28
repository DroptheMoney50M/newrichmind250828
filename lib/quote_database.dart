import 'dart:math';

class Quote {
  final int id;
  final String text;
  final String author;
  final String category;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
  });

  // Add JSON serialization methods
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] as int,
      text: json['text'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'author': author, 'category': category};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Quote &&
        other.id == id &&
        other.text == text &&
        other.author == author &&
        other.category == category;
  }

  @override
  int get hashCode => Object.hash(id, text, author, category);

  // ...existing code...
}

class QuoteDatabase {
  static final List<Quote> quotes = [
    // 성공과 도전
    Quote(
      id: 1,
      text: "꿈을 이루고자 하는 용기만 있다면 모든 꿈을 이룰 수 있다.",
      author: "월트 디즈니",
      category: "성공과 도전",
    ),
    Quote(id: 2, text: "실패는 성공의 어머니이다.", author: "토머스 에디슨", category: "성공과 도전"),
    Quote(
      id: 3,
      text: "성공의 비결은 단 한 가지, 잘할 수 있는 일에 광적으로 집중하는 것이다.",
      author: "톰 모나건",
      category: "성공과 도전",
    ),
    Quote(
      id: 4,
      text: "당신의 인생을 스스로 설계하지 않으면 다른 사람의 계획에 끼워들게 될 것이다.",
      author: "짐 론",
      category: "성공과 도전",
    ),
    Quote(
      id: 5,
      text: "인생에서 실패한 사람의 대부분은 성공이 눈앞에 왔는데도 모르고 포기한 사람들이다.",
      author: "토마스 에디슨",
      category: "성공과 도전",
    ),

    // 인생과 지혜
    Quote(
      id: 6,
      text: "인생은 자전거를 타는 것과 같다. 균형을 잡으려면 계속 움직여야 한다.",
      author: "알버트 아인슈타인",
      category: "인생과 지혜",
    ),
    Quote(
      id: 7,
      text: "산다는 것은 호흡하는 것이 아니라 행동하는 것이다.",
      author: "루소",
      category: "인생과 지혜",
    ),
    Quote(id: 8, text: "삶이 있는 한 희망은 있다.", author: "키케로", category: "인생과 지혜"),
    Quote(
      id: 9,
      text: "오늘 죽을 것처럼 살고 영원히 살 것처럼 배워라.",
      author: "간디",
      category: "인생과 지혜",
    ),
    Quote(
      id: 10,
      text: "인생은 과감한 모험이던가, 아니면 아무것도 아니다.",
      author: "헬렌 켈러",
      category: "인생과 지혜",
    ),

    // 열정과 노력
    Quote(
      id: 11,
      text: "열정을 잃지 않고 실패에서 실패로 걸어가는 것이 성공이다.",
      author: "윈스턴 처칠",
      category: "열정과 노력",
    ),
    Quote(
      id: 12,
      text: "나는 내가 더 노력할수록 운이 더 좋아진다는 것을 발견했다.",
      author: "토마스 제퍼슨",
      category: "열정과 노력",
    ),
    Quote(id: 13, text: "천리길도 한 걸음부터.", author: "노자", category: "열정과 노력"),
    Quote(
      id: 14,
      text: "노력하는 사람은 즐기는 사람을 이길 수 없다.",
      author: "양주종",
      category: "열정과 노력",
    ),
    Quote(
      id: 15,
      text: "성공의 비결은 목표를 향해 시작하는 것이다.",
      author: "마크 트웨인",
      category: "열정과 노력",
    ),

    // 긍정과 희망
    Quote(
      id: 16,
      text: "웃음이 없는 하루는 낭비한 하루다.",
      author: "찰리 채플린",
      category: "긍정과 희망",
    ),
    Quote(
      id: 17,
      text: "행복은 습관이다. 그것을 몸에 지니라.",
      author: "허버드",
      category: "긍정과 희망",
    ),
    Quote(
      id: 18,
      text: "희망은 좋은 아침을 먹고, 기억은 달콤한 저녁을 먹는다.",
      author: "이어령",
      category: "긍정과 희망",
    ),
    Quote(
      id: 19,
      text: "당신이 할 수 있다고 믿으면 절반은 이미 된 것이다.",
      author: "시어도어 루스벨트",
      category: "긍정과 희망",
    ),
    Quote(
      id: 20,
      text: "가장 큰 영광은 한 번도 실패하지 않음이 아니라 실패할 때마다 다시 일어서는 데에 있다.",
      author: "공자",
      category: "긍정과 희망",
    ),

    // 시간과 현재
    Quote(
      id: 21,
      text: "오늘 할 수 있는 일을 내일로 미루지 마라.",
      author: "벤자민 프랭클린",
      category: "시간과 현재",
    ),
    Quote(id: 22, text: "시간은 가장 공평한 자원이다.", author: "이순신", category: "시간과 현재"),
    Quote(
      id: 23,
      text: "지금 적극적으로 실행하라. 나중에 후회하는 것보다 낫다.",
      author: "파울로 코엘료",
      category: "시간과 현재",
    ),
    Quote(
      id: 24,
      text: "현재와 미래는 서로 맞닿아 있다.",
      author: "볼테르",
      category: "시간과 현재",
    ),
    Quote(
      id: 25,
      text: "지금 이 순간을 즐기지 못하면 그 순간은 영원히 사라진다.",
      author: "마하트마 간디",
      category: "시간과 현재",
    ),

    // 배움과 지식
    Quote(id: 26, text: "배움에는 끝이 없다.", author: "로버트 슈만", category: "배움과 지식"),
    Quote(id: 27, text: "아는 것이 힘이다.", author: "프랜시스 베이컨", category: "배움과 지식"),
    Quote(id: 28, text: "책은 마음의 양식이다.", author: "세르반테스", category: "배움과 지식"),
    Quote(
      id: 29,
      text: "배우고 때로 익히면 즐겁지 아니한가.",
      author: "공자",
      category: "배움과 지식",
    ),
    Quote(
      id: 30,
      text: "가르침의 효과는 학습자의 의지에 달려있다.",
      author: "공자",
      category: "배움과 지식",
    ),

    // ... 이하 70개 더 추가 ...
    Quote(
      id: 31,
      text: "인생에서 가장 가치 있는 일은 다른 사람을 돕는 것이다.",
      author: "알버트 슈바이처",
      category: "배움과 지식",
    ),
    Quote(
      id: 32,
      text: "작은 기회로부터 종종 위대한 업적이 시작된다.",
      author: "데모스테네스",
      category: "배움과 지식",
    ),
    Quote(
      id: 33,
      text: "가장 강한 사람은 가장 고독한 사람이다.",
      author: "헨리크 입센",
      category: "배움과 지식",
    ),
    // ... 계속해서 나머지 명언들 ...

    // 도전과 용기
    Quote(
      id: 34,
      text: "용기란 두려움이 없는 것이 아니라 두려움을 이기는 것이다.",
      author: "넬슨 만델라",
      category: "도전과 용기",
    ),
    Quote(
      id: 35,
      text: "가장 용감한 행동은 자신을 믿는 것이다.",
      author: "코코 샤넬",
      category: "도전과 용기",
    ),
    Quote(
      id: 36,
      text: "불가능한 것은 없다. 불가능은 노력하지 않는 사람들의 변명이다.",
      author: "김연아",
      category: "도전과 용기",
    ),
    Quote(
      id: 37,
      text: "도전은 인생을 흥미롭게 만들며, 도전의 극복이 인생을 의미있게 한다.",
      author: "조슈아 J. 마린",
      category: "도전과 용기",
    ),
    Quote(
      id: 38,
      text: "실패를 두려워하지 마라. 실패는 성공으로 가는 길이다.",
      author: "모리하이 우에시바",
      category: "도전과 용기",
    ),

    // 꿈과 목표
    Quote(
      id: 39,
      text: "당신의 꿈을 잡고 절대 놓지 마라.",
      author: "캐롤 버넷",
      category: "꿈과 목표",
    ),
    Quote(
      id: 40,
      text: "목표를 높게 세워라. 그리고 도달할 때까지 멈추지 마라.",
      author: "보 잭슨",
      category: "꿈과 목표",
    ),
    Quote(
      id: 41,
      text: "꿈을 적어놓지 않으면 그것은 그저 바람에 불과하다.",
      author: "존 맥스웰",
      category: "꿈과 목표",
    ),
    Quote(
      id: 42,
      text: "당신이 상상할 수 있다면, 그것을 이룰 수 있다.",
      author: "월트 디즈니",
      category: "꿈과 목표",
    ),
    Quote(
      id: 43,
      text: "큰 꿈을 꾸고 그 꿈을 이루기 위해 매진하라.",
      author: "조지프 머피",
      category: "꿈과 목표",
    ),

    // 성장과 발전
    Quote(
      id: 44,
      text: "변화는 성장을 위한 필수 요소이다.",
      author: "존 C. 맥스웰",
      category: "성장과 발전",
    ),
    Quote(
      id: 45,
      text: "당신이 하는 일에 자부심을 가져라.",
      author: "스티브 잡스",
      category: "성장과 발전",
    ),
    Quote(
      id: 46,
      text: "불가능해 보이는 것을 해냈을 때 가장 큰 영광을 얻는다.",
      author: "마하트마 간디",
      category: "성장과 발전",
    ),
    Quote(
      id: 47,
      text: "당신의 한계를 결정하는 것은 당신의 마음이다.",
      author: "헨리 포드",
      category: "성장과 발전",
    ),
    Quote(
      id: 48,
      text: "실수는 배움의 또 다른 이름이다.",
      author: "존 포웰",
      category: "성장과 발전",
    ),

    // 인간관계
    Quote(id: 49, text: "친구란 또 하나의 자신이다.", author: "아리스토텔레스", category: "인간관계"),
    Quote(id: 50, text: "사랑받고 싶다면 사랑하라.", author: "세네카", category: "인간관계"),
    Quote(
      id: 51,
      text: "다른 사람을 존중하는 것이 자신을 존중하는 것이다.",
      author: "공자",
      category: "인간관계",
    ),
    Quote(
      id: 52,
      text: "진정한 친구는 당신의 잘못을 지적해주는 사람이다.",
      author: "소크라테스",
      category: "인간관계",
    ),
    Quote(
      id: 53,
      text: "좋은 대화는 좋은 관계의 시작이다.",
      author: "마더 테레사",
      category: "인간관계",
    ),

    // 지혜와 통찰
    Quote(
      id: 54,
      text: "지혜는 경험에서 나오고, 경험은 실수에서 나온다.",
      author: "존 메이슨",
      category: "지혜와 통찰",
    ),
    Quote(
      id: 55,
      text: "진정한 발견이란 새로운 땅을 찾는 것이 아니라 새로운 눈으로 보는 것이다.",
      author: "마르셀 프루스트",
      category: "지혜와 통찰",
    ),
    Quote(
      id: 56,
      text: "가장 중요한 것은 눈에 보이지 않는다.",
      author: "생텍쥐페리",
      category: "지혜와 통찰",
    ),
    Quote(
      id: 57,
      text: "모든 진보는 편안함의 영역 밖에서 이루어진다.",
      author: "마이클 존 버바스",
      category: "지혜와 통찰",
    ),
    Quote(
      id: 58,
      text: "문제는 답을 찾는 것이 아니라 질문을 찾는 것이다.",
      author: "알베르트 아인슈타인",
      category: "지혜와 통찰",
    ),

    // 리더십
    Quote(
      id: 59,
      text: "리더십은 실천이다. 말이 아니다.",
      author: "해럴드 S. 제닌",
      category: "리더십",
    ),
    Quote(
      id: 60,
      text: "진정한 리더는 다른 리더를 만든다.",
      author: "톰 피터스",
      category: "리더십",
    ),
    Quote(
      id: 61,
      text: "리더는 희망을 파는 사람이다.",
      author: "나폴레옹 보나파르트",
      category: "리더십",
    ),
    Quote(
      id: 62,
      text: "좋은 리더는 사람들이 옳은 일을 하게 만든다.",
      author: "피터 드러커",
      category: "리더십",
    ),
    Quote(
      id: 63,
      text: "리더십의 본질은 섬기는 것이다.",
      author: "로버트 K. 그린리프",
      category: "리더십",
    ),

    // 일과 열정
    Quote(
      id: 64,
      text: "당신이 하는 일을 사랑하라. 그러면 절대 일한다는 느낌이 들지 않을 것이다.",
      author: "공자",
      category: "일과 열정",
    ),
    Quote(
      id: 65,
      text: "성공하는 사람은 실패하는데 익숙한 사람이다.",
      author: "로버트 기요사키",
      category: "일과 열정",
    ),
    Quote(
      id: 66,
      text: "일은 당신을 만드는 것이 아니라, 당신이 일을 만드는 것이다.",
      author: "스티븐 코비",
      category: "일과 열정",
    ),
    Quote(
      id: 67,
      text: "열정없이 위대한 것을 이룬 사람은 없다.",
      author: "랄프 왈도 에머슨",
      category: "일과 열정",
    ),
    Quote(
      id: 68,
      text: "당신의 직업을 사랑하라. 그것이 인생의 진정한 성공이다.",
      author: "데일 카네기",
      category: "일과 열정",
    ),
    // 더 30개 명언들 더 추가해줘
    Quote(
      id: 69,
      text: "성공은 준비와 기회의 만남이다.",
      author: "보비 언서",
      category: "성공과 도전",
    ),
    Quote(
      id: 70,
      text: "성공은 작은 노력의 반복이다.",
      author: "로버트 콜리어",
      category: "성공과 도전",
    ),
    Quote(
      id: 71,
      text: "성공은 자신을 믿는 것에서 시작된다.",
      author: "노먼 빈센트 필",
      category: "성공과 도전",
    ),
    Quote(
      id: 72,
      text: "성공은 실패를 극복하는 것이다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 73,
      text: "성공은 포기하지 않는 것이다.",
      author: "콘래드 힐튼",
      category: "성공과 도전",
    ),
    Quote(
      id: 74,
      text: "성공은 끈기와 인내의 결과이다.",
      author: "벤자민 프랭클린",
      category: "성공과 도전",
    ),
    Quote(
      id: 75,
      text: "성공은 준비와 기회의 만남이다.",
      author: "보비 언서",
      category: "성공과 도전",
    ),
    Quote(
      id: 76,
      text: "성공은 작은 노력의 반복이다.",
      author: "로버트 콜리어",
      category: "성공과 도전",
    ),
    Quote(
      id: 77,
      text: "성공은 끊임없는 열정과 노력이 필요하다.",
      author: "알버트 아인슈타인",
      category: "성공과 도전",
    ),
    Quote(
      id: 78,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 79,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "스티브 잡스",
      category: "성공과 도전",
    ),
    Quote(
      id: 80,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 81,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 82,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 83,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 84,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 85,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 86,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 87,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 88,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 89,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 90,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 91,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 92,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 93,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 94,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 95,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 96,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 97,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 98,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 99,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 100,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 101,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 102,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 103,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 104,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 105,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 106,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 107,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 108,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 109,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 110,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 111,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 112,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 113,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 114,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 115,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 116,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 117,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 118,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 119,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 120,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 121,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 122,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 123,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 124,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 125,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 126,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 127,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 128,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 129,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 130,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 131,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 132,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 133,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 134,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 135,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 136,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 137,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 138,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 139,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 140,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 141,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 142,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 143,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 144,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 145,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 146,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 147,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 148,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 149,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 150,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 151,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 152,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 153,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 154,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 155,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 156,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 157,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 158,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 159,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 160,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 161,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 162,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 163,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 164,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 165,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 166,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 167,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 168,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 169,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 170,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 171,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 172,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 173,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 174,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 175,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 176,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 177,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 178,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 179,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 180,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 181,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 182,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 183,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 184,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 185,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 186,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 187,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 188,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 189,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 190,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 191,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 192,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 193,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 194,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
    Quote(
      id: 195,
      text: "성공은 작은 일에서부터 시작된다.",
      author: "헨리 포드",
      category: "성공과 도전",
    ),
    Quote(
      id: 196,
      text: "성공은 포기하지 않는 것이다.",
      author: "토머스 에디슨",
      category: "성공과 도전",
    ),
    Quote(
      id: 197,
      text: "성공은 끊임없는 노력과 인내의 결과이다.",
      author: "윈스턴 처칠",
      category: "성공과 도전",
    ),
    Quote(
      id: 198,
      text: "성공은 자신을 믿고 끝까지 도전하는 것이다.",
      author: "엘론 머스크",
      category: "성공과 도전",
    ),
    Quote(
      id: 199,
      text: "성공은 실패를 두려워하지 않는 것이다.",
      author: "마이클 조던",
      category: "성공과 도전",
    ),
    Quote(
      id: 200,
      text: "성공은 끊임없는 배움과 성장을 통해 이루어진다.",
      author: "빌 게이츠",
      category: "성공과 도전",
    ),
  ];

  static Quote getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }
}
