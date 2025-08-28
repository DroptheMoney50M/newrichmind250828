import 'dart:math';

class Quote {
  final String text;
  final String author;
  final String category;

  Quote({
    required this.text, 
    required this.author,
    this.category = '일반',
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Quote &&
        other.text == text &&
        other.author == author;
  }

  @override
  int get hashCode => text.hashCode ^ author.hashCode;
}

class QuoteDatabase {
  static final List<Quote> _quotes = [
    // 성공 카테고리 (50개)
    Quote(text: "성공은 준비된 자에게 찾아온다.", author: "루이 파스퇴르", category: "성공"),
    Quote(text: "성공의 비밀은 시작하는 것이다.", author: "마크 트웨인", category: "성공"),
    Quote(text: "성공은 최종 목적지가 아니라 여행이다.", author: "아서 애시", category: "성공"),
    Quote(text: "성공하려면 실패를 두려워하지 말라.", author: "엘리너 루즈벨트", category: "성공"),
    Quote(text: "성공의 열쇠는 포기하지 않는 것이다.", author: "윈스턴 처칠", category: "성공"),
    Quote(text: "최고의 복수는 성공이다.", author: "프랭크 시나트라", category: "성공"),
    Quote(text: "성공은 하루아침에 이루어지지 않는다.", author: "현대 격언", category: "성공"),
    Quote(text: "성공은 기회와 준비가 만나는 지점이다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공하는 사람은 항상 배우려 한다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공의 첫걸음은 자신을 믿는 것이다.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 실패에서 배우는 능력이다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 습관의 결과다.", author: "아리스토텔레스", category: "성공"),
    Quote(text: "성공하려면 먼저 자신을 이겨야 한다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공은 꿈을 현실로 만드는 과정이다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공의 문은 밀면 열린다.", author: "한국 격언", category: "성공"),
    Quote(text: "성공은 인내하는 자의 몫이다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공하려면 평범함을 거부하라.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 매일의 작은 승리들로 이루어진다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공의 비결은 일관성에 있다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 남을 도우면서 얻어진다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공은 열정과 끈기의 만남이다.", author: "현대 격언", category: "성공"),
    Quote(text: "성공하려면 두려움을 친구로 만들어라.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 다른 사람을 행복하게 만드는 것이다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공의 크기는 꿈의 크기에 비례한다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 감사하는 마음에서 시작된다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공하려면 자신만의 길을 가라.", author: "현대 격언", category: "성공"),
    Quote(text: "성공은 실행력에서 나온다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공의 적은 완벽주의다.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 변화를 두려워하지 않는 자의 것이다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공하려면 목표를 명확히 하라.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 팀워크의 결과다.", author: "현대 리더십", category: "성공"),
    Quote(text: "성공의 원동력은 진정성이다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공하려면 실패를 받아들여라.", author: "현대 격언", category: "성공"),
    Quote(text: "성공은 집중력의 산물이다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공의 척도는 행복이다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공하려면 남과 비교하지 말라.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 매일 조금씩 발전하는 것이다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공의 기반은 신뢰다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공하려면 긍정적으로 생각하라.", author: "현대 격언", category: "성공"),
    Quote(text: "성공은 시간과 노력의 투자다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공의 열매는 달콤하다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공하려면 현재에 집중하라.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 용기 있는 자의 특권이다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공의 첫 번째 조건은 건강이다.", author: "현대 격언", category: "성공"),
    Quote(text: "성공하려면 학습을 멈추지 말라.", author: "현대 명언", category: "성공"),
    Quote(text: "성공은 좋은 습관의 결과다.", author: "현대 지혜", category: "성공"),
    Quote(text: "성공의 비밀은 단순함에 있다.", author: "현대 명언", category: "성공"),
    Quote(text: "성공하려면 자신의 가치를 알라.", author: "자기계발", category: "성공"),
    Quote(text: "성공은 협력의 힘이다.", author: "현대 철학", category: "성공"),
    Quote(text: "성공의 기쁨은 과정에 있다.", author: "현대 격언", category: "성공"),

    // 꿈 카테고리 (50개)
    Quote(text: "꿈을 꾸지 않으면 현실이 될 수 없다.", author: "월트 디즈니", category: "꿈"),
    Quote(text: "꿈을 이루는 가장 좋은 방법은 깨어있는 것이다.", author: "존 레논", category: "꿈"),
    Quote(text: "꿈을 꾸는 자에게는 현실이 된다.", author: "월트 디즈니", category: "꿈"),
    Quote(text: "꿈이 없으면 미래도 없다.", author: "존 F. 케네디", category: "꿈"),
    Quote(text: "꿈이 클수록 성취도 크다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 목표와 계획으로 현실이 된다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈을 포기하는 것은 인생을 포기하는 것이다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 나이가 들수록 더 소중해진다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈을 위해 오늘을 살아가라.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈은 용기 있는 자만이 이룰 수 있다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 꾸는 것은 무료이지만 이루는 것은 값이 비싸다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈은 희망의 씨앗이다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 이루려면 먼저 꿈을 믿어야 한다.", author: "자기계발", category: "꿈"),
    Quote(text: "꿈은 인생의 나침반이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈을 향한 첫걸음이 가장 중요하다.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈은 현실을 바꾸는 힘이다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 포기하지 않는 자에게 기적이 일어난다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈은 마음의 언어다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 이루는 과정이 인생이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈은 행동으로 증명된다.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈을 품은 자는 절대 외롭지 않다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 미래를 창조하는 도구다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈을 위해 희생할 준비가 되어야 한다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 인생의 동력이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈을 이루려면 현실을 직시하라.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈은 불가능을 가능하게 만든다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 꾸는 것은 인간의 특권이다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈은 시간과 공간을 초월한다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 이루려면 포기하지 말라.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈은 마음의 자유다.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈을 가진 자는 이미 성공한 것이다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 현실보다 강하다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈을 위해 오늘을 투자하라.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 인생의 별이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈을 이루는 길에는 장애물이 있다.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈은 희망을 현실로 바꾼다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 품고 살면 매일이 새롭다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈은 마음의 예술이다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 이루려면 계획이 필요하다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈은 삶의 의미를 준다.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈을 가진 자는 절대 늙지 않는다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 인생의 보물이다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈을 이루려면 자신을 믿어야 한다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈은 마음의 힘이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈을 위해 도전하라.", author: "현대 격언", category: "꿈"),
    Quote(text: "꿈은 인생의 등대다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 품으면 기적이 일어난다.", author: "현대 지혜", category: "꿈"),
    Quote(text: "꿈은 현실을 뛰어넘는다.", author: "현대 명언", category: "꿈"),
    Quote(text: "꿈을 이루는 것이 인생의 목적이다.", author: "현대 철학", category: "꿈"),
    Quote(text: "꿈은 마음의 날개다.", author: "현대 격언", category: "꿈"),

    // 노력 카테고리 (50개)
    Quote(text: "노력하면 반드시 성취할 수 있다.", author: "벤자민 프랭클린", category: "노력"),
    Quote(text: "천재는 1%의 영감과 99%의 노력으로 이루어진다.", author: "토마스 에디슨", category: "노력"),
    Quote(text: "노력 없이는 아무것도 얻을 수 없다.", author: "유진 글래드스톤", category: "노력"),
    Quote(text: "노력하는 자에게는 희망이 있다.", author: "한국 속담", category: "노력"),
    Quote(text: "노력은 배신하지 않는다.", author: "한국 격언", category: "노력"),
    Quote(text: "노력하는 만큼 얻는다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 재능을 이긴다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력하지 않으면 후회한다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 기적을 만든다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력하는 자에게 운이 따른다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력은 성공의 어머니다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하면 불가능도 가능하다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력은 꿈을 현실로 만든다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 것 자체가 승리다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력은 시간을 이긴다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력하면 길이 보인다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 인생의 투자다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력하지 않으면 변화도 없다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 신념의 증거다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력하는 자만이 진정한 승자다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력은 자신감을 만든다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하면 우주도 돕는다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력은 한계를 뛰어넘는다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 마음이 가장 아름답다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력은 미래를 바꾼다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력하지 않으면 후회가 남는다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 희망을 키운다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력하는 자에게 기회가 온다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 성품을 만든다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력하면 반드시 열매를 맺는다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력은 인생의 보람이다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 과정이 행복이다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력은 운명을 바꾼다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 자는 절대 외롭지 않다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력은 인생의 의미다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력하면 세상이 달라 보인다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 마음의 힘이다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력하는 자에게 축복이 따른다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 성장의 원동력이다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력하면 불가능은 없다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력은 인생의 스승이다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 마음에 감동한다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력은 시간을 가치 있게 만든다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력하는 자에게 존경을 표한다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력은 인생의 보상이다.", author: "현대 격언", category: "노력"),
    Quote(text: "노력하면 마음이 편해진다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 자존감을 높인다.", author: "현대 지혜", category: "노력"),
    Quote(text: "노력하는 것이 인간의 본능이다.", author: "현대 명언", category: "노력"),
    Quote(text: "노력은 희망의 근원이다.", author: "현대 철학", category: "노력"),
    Quote(text: "노력하면 인생이 달라진다.", author: "현대 격언", category: "노력"),

    // 희망 카테고리 (50개)
    Quote(text: "내일은 오늘보다 나은 날이 될 것이다.", author: "희망의 메시지", category: "희망"),
    Quote(text: "희망은 절망의 어둠을 밝히는 등불이다.", author: "현대 시", category: "희망"),
    Quote(text: "희망을 가진 자는 미래를 가진다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 인생의 동력이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 마음의 햇살이다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 잃지 않는 자가 승리한다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 절망을 이기는 힘이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망은 꿈을 현실로 만든다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 품으면 기적이 일어난다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 인생의 나침반이다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가진 자는 절대 포기하지 않는다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 불꽃이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 잃으면 모든 것을 잃는다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 삶의 의미를 준다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 어둠 속의 별이다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가지면 인생이 달라진다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 약이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 품으면 힘이 솟는다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 미래의 선물이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 절망보다 강하다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가진 자는 행복하다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 보석이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 잃지 말고 앞으로 나아가라.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 인생의 등대다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 꿈의 시작이다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가지면 용기가 생긴다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 날개다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 품으면 세상이 아름답다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 삶의 원동력이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 절망을 이기는 무기다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가진 자는 젊다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 사랑이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 잃지 않으면 길이 보인다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 인생의 축복이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 미래를 밝힌다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가지면 모든 것이 가능하다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 평화다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 품으면 인생이 의미 있다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 삶의 보물이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 절망의 치료제다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가진 자는 강하다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 자유다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 잃지 않으면 반드시 이룬다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 인생의 선물이다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망은 꿈을 키운다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망을 가지면 하루하루가 즐겁다.", author: "현대 철학", category: "희망"),
    Quote(text: "희망은 마음의 힘이다.", author: "현대 격언", category: "희망"),
    Quote(text: "희망을 품으면 기적을 만난다.", author: "현대 명언", category: "희망"),
    Quote(text: "희망은 삶의 이유다.", author: "현대 지혜", category: "희망"),
    Quote(text: "희망을 가진 자는 승리한다.", author: "현대 철학", category: "희망"),

    // 도전 카테고리 (50개)
    Quote(text: "불가능이란 것은 없다. 다만 할 수 없다고 생각하는 것일 뿐이다.", author: "나폴레옹 보나파르트", category: "도전"),
    Quote(text: "인생은 도전이다. 맞서라.", author: "마더 테레사", category: "도전"),
    Quote(text: "도전하지 않으면 얻을 수 없다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전은 성장의 기회다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하는 자만이 새로운 세계를 만난다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전은 용기의 증거다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전하지 않으면 후회한다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 꿈을 현실로 만든다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전하는 마음이 젊음이다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 인생의 스파이스다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전하면 불가능도 가능하다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전은 성공의 시작이다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하는 자에게 기회가 온다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전은 한계를 뛰어넘는다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하지 않으면 성장도 없다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전은 마음의 모험이다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전하면 세상이 달라 보인다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 자신감을 만든다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전하는 것 자체가 승리다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 미래를 바꾼다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전하면 새로운 자신을 발견한다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전은 용기를 기른다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하는 자는 절대 늙지 않는다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전은 인생의 보람이다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하지 않으면 변화도 없다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전은 마음의 자유다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전하면 운명을 바꿀 수 있다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 희망을 키운다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전하는 자에게 존경을 표한다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 삶의 의미를 준다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전하면 기적이 일어난다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전은 성품을 만든다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하는 마음에 감동한다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전은 인생의 축복이다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하지 않으면 꿈도 없다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전은 마음의 힘이다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전하면 자존감이 높아진다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 미래의 투자다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전하는 자는 행복하다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 삶의 원동력이다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전하면 길이 열린다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전은 용기의 결과다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하는 것이 인간의 본능이다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전은 인생의 보상이다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전하지 않으면 발전도 없다.", author: "현대 철학", category: "도전"),
    Quote(text: "도전은 마음의 날개다.", author: "현대 격언", category: "도전"),
    Quote(text: "도전하면 새로운 가능성을 발견한다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 희망의 근원이다.", author: "현대 지혜", category: "도전"),
    Quote(text: "도전하는 자에게 축복이 따른다.", author: "현대 명언", category: "도전"),
    Quote(text: "도전은 인생의 선물이다.", author: "현대 철학", category: "도전"),

    // 기타 카테고리들
    Quote(text: "실패는 성공으로 가는 과정이다.", author: "토마스 에디슨", category: "실패"),
    Quote(text: "당신이 할 수 있다고 믿든 할 수 없다고 믿든, 당신이 옳다.", author: "헨리 포드", category: "믿음"),
    Quote(text: "시작이 반이다.", author: "아리스토텔레스", category: "시작"),
    Quote(text: "오늘이 내 인생의 첫날이라고 생각하고 살아가자.", author: "아브라 로드리게스", category: "인생"),
    Quote(text: "행복은 습관이다. 그것을 몸에 지녀라.", author: "허버드", category: "행복"),
    Quote(text: "위대한 일을 하려면 행동하는 것뿐만 아니라 꿈꾸는 것도 필요하다.", author: "아나톨 프랑스", category: "행동"),
    Quote(text: "가장 큰 영광은 넘어지지 않는 것이 아니라 넘어질 때마다 일어서는 것이다.", author: "공자", category: "극복"),
    Quote(text: "기회는 준비된 자에게만 온다.", author: "루이 파스퇴르", category: "기회"),
    Quote(text: "포기하지 말라. 고통이 클수록 영광도 크다.", author: "탈무드", category: "인내"),
    Quote(text: "변화를 원한다면 스스로 그 변화가 되어라.", author: "마하트마 간디", category: "변화"),
  ];

  static Quote getRandomQuote() {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }

  static List<Quote> getAllQuotes() {
    return List.from(_quotes);
  }

  static List<Quote> getQuotesByCategory(String category) {
    return _quotes.where((quote) => quote.category == category).toList();
  }

  static List<String> getAllCategories() {
    return _quotes.map((quote) => quote.category).toSet().toList()..sort();
  }

  static Quote getRandomQuoteByCategory(String category) {
    final categoryQuotes = getQuotesByCategory(category);
    if (categoryQuotes.isEmpty) return getRandomQuote();
    final random = Random();
    return categoryQuotes[random.nextInt(categoryQuotes.length)];
  }

  static int get totalQuotes => _quotes.length;

  static int getQuoteCountByCategory(String category) {
    return getQuotesByCategory(category).length;
  }
}
