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
    return other is Quote && other.text == text && other.author == author;
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
    Quote(
        text: "꿈을 꾸는 것은 무료이지만 이루는 것은 값이 비싸다.", author: "현대 지혜", category: "꿈"),
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
    Quote(
        text: "천재는 1%의 영감과 99%의 노력으로 이루어진다.",
        author: "토마스 에디슨",
        category: "노력"),
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
    Quote(
        text: "불가능이란 것은 없다. 다만 할 수 없다고 생각하는 것일 뿐이다.",
        author: "나폴레옹 보나파르트",
        category: "도전"),
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
    Quote(
        text: "당신이 할 수 있다고 믿든 할 수 없다고 믿든, 당신이 옳다.",
        author: "헨리 포드",
        category: "믿음"),
    Quote(text: "시작이 반이다.", author: "아리스토텔레스", category: "시작"),
    Quote(
        text: "오늘이 내 인생의 첫날이라고 생각하고 살아가자.",
        author: "아브라 로드리게스",
        category: "인생"),
    Quote(text: "행복은 습관이다. 그것을 몸에 지녀라.", author: "허버드", category: "행복"),
    Quote(
        text: "위대한 일을 하려면 행동하는 것뿐만 아니라 꿈꾸는 것도 필요하다.",
        author: "아나톨 프랑스",
        category: "행동"),
    Quote(
        text: "가장 큰 영광은 넘어지지 않는 것이 아니라 넘어질 때마다 일어서는 것이다.",
        author: "공자",
        category: "극복"),
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

  static List<String> getCategories() {
    return getAllCategories();
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

  // 언어별 번역 맵
  static final Map<String, Map<String, String>> _translations = {
    // 성공 관련 명언들
    "성공은 준비된 자에게 찾아온다.": {
      'ko': "성공은 준비된 자에게 찾아온다.",
      'en': "Success comes to those who are prepared.",
      'tr': "Başarı hazırlıklı olanlara gelir."
    },
    "성공의 비밀은 시작하는 것이다.": {
      'ko': "성공의 비밀은 시작하는 것이다.",
      'en': "The secret of success is getting started.",
      'tr': "Başarının sırrı başlamaktır."
    },
    "성공하려면 실패를 두려워하지 말라.": {
      'ko': "성공하려면 실패를 두려워하지 말라.",
      'en': "To succeed, do not fear failure.",
      'tr': "Başarılı olmak için başarısızlıktan korkma."
    },
    "성공의 열쇠는 포기하지 않는 것이다.": {
      'ko': "성공의 열쇠는 포기하지 않는 것이다.",
      'en': "The key to success is never giving up.",
      'tr': "Başarının anahtarı asla pes etmemektir."
    },
    "최고의 복수는 성공이다.": {
      'ko': "최고의 복수는 성공이다.",
      'en': "The best revenge is success.",
      'tr': "En iyi intikam başarıdır."
    },
    "성공은 최종 목적지가 아니라 여행이다.": {
      'ko': "성공은 최종 목적지가 아니라 여행이다.",
      'en': "Success is not a destination, it's a journey.",
      'tr': "Başarı bir varış noktası değil, bir yolculuktur."
    },
    "성공은 하루아침에 이루어지지 않는다.": {
      'ko': "성공은 하루아침에 이루어지지 않는다.",
      'en': "Success doesn't happen overnight.",
      'tr': "Başarı bir gecede olmaz."
    },
    "성공은 기회와 준비가 만나는 지점이다.": {
      'ko': "성공은 기회와 준비가 만나는 지점이다.",
      'en': "Success is where opportunity meets preparation.",
      'tr': "Başarı, fırsatın hazırlıkla buluştuğu noktadır."
    },
    "성공하는 사람은 항상 배우려 한다.": {
      'ko': "성공하는 사람은 항상 배우려 한다.",
      'en': "Successful people are always willing to learn.",
      'tr': "Başarılı insanlar her zaman öğrenmeye isteklidir."
    },
    "성공의 첫걸음은 자신을 믿는 것이다.": {
      'ko': "성공의 첫걸음은 자신을 믿는 것이다.",
      'en': "The first step to success is believing in yourself.",
      'tr': "Başarının ilk adımı kendine inanmaktır."
    },

    // 꿈 관련 명언들
    "꿈을 꾸지 않으면 현실이 될 수 없다.": {
      'ko': "꿈을 꾸지 않으면 현실이 될 수 없다.",
      'en': "If you don't dream, it cannot become reality.",
      'tr': "Hayal etmezsen gerçek olamaz."
    },
    "꿈을 이루는 가장 좋은 방법은 깨어있는 것이다.": {
      'ko': "꿈을 이루는 가장 좋은 방법은 깨어있는 것이다.",
      'en': "The best way to make dreams come true is to wake up.",
      'tr': "Hayalleri gerçekleştirmenin en iyi yolu uyanmaktır."
    },
    "꿈이 없으면 미래도 없다.": {
      'ko': "꿈이 없으면 미래도 없다.",
      'en': "Without dreams, there is no future.",
      'tr': "Hayaller olmadan gelecek de olmaz."
    },
    "꿈이 클수록 성취도 크다.": {
      'ko': "꿈이 클수록 성취도 크다.",
      'en': "The bigger the dream, the greater the achievement.",
      'tr': "Hayal ne kadar büyükse başarı o kadar büyüktür."
    },
    "꿈은 목표와 계획으로 현실이 된다.": {
      'ko': "꿈은 목표와 계획으로 현실이 된다.",
      'en': "Dreams become reality through goals and plans.",
      'tr': "Hayaller hedefler ve planlarla gerçeğe dönüşür."
    },

    // 노력 관련 명언들
    "노력하면 반드시 성취할 수 있다.": {
      'ko': "노력하면 반드시 성취할 수 있다.",
      'en': "With effort, you can surely achieve.",
      'tr': "Çabayla mutlaka başarabilirsin."
    },
    "천재는 1%의 영감과 99%의 노력으로 이루어진다.": {
      'ko': "천재는 1%의 영감과 99%의 노력으로 이루어진다.",
      'en': "Genius is 1% inspiration and 99% perspiration.",
      'tr': "Deha %1 ilham ve %99 terden oluşur."
    },
    "노력 없이는 아무것도 얻을 수 없다.": {
      'ko': "노력 없이는 아무것도 얻을 수 없다.",
      'en': "Nothing can be achieved without effort.",
      'tr': "Çaba olmadan hiçbir şey elde edilemez."
    },
    "노력하는 자에게는 희망이 있다.": {
      'ko': "노력하는 자에게는 희망이 있다.",
      'en': "There is hope for those who try.",
      'tr': "Çabalayan için umut vardır."
    },
    "노력은 배신하지 않는다.": {
      'ko': "노력은 배신하지 않는다.",
      'en': "Effort never betrays.",
      'tr': "Çaba asla ihanet etmez."
    },

    // 도전 관련 명언들
    "불가능이란 것은 없다. 다만 할 수 없다고 생각하는 것일 뿐이다.": {
      'ko': "불가능이란 것은 없다. 다만 할 수 없다고 생각하는 것일 뿐이다.",
      'en': "Nothing is impossible. It's just thinking you can't do it.",
      'tr': "İmkansız bir şey yok. Sadece yapamayacağını düşünmek var."
    },
    "인생은 도전이다. 맞서라.": {
      'ko': "인생은 도전이다. 맞서라.",
      'en': "Life is a challenge. Face it.",
      'tr': "Hayat bir meydan okumadır. Yüzleş."
    },
    "도전하지 않으면 얻을 수 없다.": {
      'ko': "도전하지 않으면 얻을 수 없다.",
      'en': "If you don't challenge, you can't gain.",
      'tr': "Meydan okumasan kazanamazsın."
    },

    // 희망 관련 명언들
    "내일은 오늘보다 나은 날이 될 것이다.": {
      'ko': "내일은 오늘보다 나은 날이 될 것이다.",
      'en': "Tomorrow will be a better day than today.",
      'tr': "Yarın bugünden daha iyi bir gün olacak."
    },
    "희망은 절망의 어둠을 밝히는 등불이다.": {
      'ko': "희망은 절망의 어둠을 밝히는 등불이다.",
      'en': "Hope is a lamp that lights up the darkness of despair.",
      'tr': "Umut, umutsuzluğun karanlığını aydınlatan bir lampadır."
    },
    "희망을 가진 자는 미래를 가진다.": {
      'ko': "희망을 가진 자는 미래를 가진다.",
      'en': "Those who have hope have a future.",
      'tr': "Umudu olan geleceği vardır."
    },
    "희망은 인생의 동력이다.": {
      'ko': "희망은 인생의 동력이다.",
      'en': "Hope is the driving force of life.",
      'tr': "Umut hayatın itici gücüdür."
    },
    "희망은 마음의 햇살이다.": {
      'ko': "희망은 마음의 햇살이다.",
      'en': "Hope is the sunshine of the heart.",
      'tr': "Umut kalbin güneşidir."
    },

    // 더 많은 성공 관련 명언들
    "성공은 실패에서 배우는 능력이다.": {
      'ko': "성공은 실패에서 배우는 능력이다.",
      'en': "Success is the ability to learn from failure.",
      'tr': "Başarı, başarısızlıktan öğrenme yetisidir."
    },
    "성공은 습관의 결과다.": {
      'ko': "성공은 습관의 결과다.",
      'en': "Success is the result of habits.",
      'tr': "Başarı alışkanlıkların sonucudur."
    },
    "성공하려면 먼저 자신을 이겨야 한다.": {
      'ko': "성공하려면 먼저 자신을 이겨야 한다.",
      'en': "To succeed, you must first overcome yourself.",
      'tr': "Başarılı olmak için önce kendini yenmelisin."
    },
    "성공은 꿈을 현실로 만드는 과정이다.": {
      'ko': "성공은 꿈을 현실로 만드는 과정이다.",
      'en': "Success is the process of making dreams reality.",
      'tr': "Başarı, hayalleri gerçeğe dönüştürme sürecidir."
    },

    // 더 많은 꿈 관련 명언들
    "꿈을 포기하는 것은 인생을 포기하는 것이다.": {
      'ko': "꿈을 포기하는 것은 인생을 포기하는 것이다.",
      'en': "Giving up dreams is giving up life.",
      'tr': "Hayalleri bırakmak hayatı bırakmaktır."
    },
    "꿈은 나이가 들수록 더 소중해진다.": {
      'ko': "꿈은 나이가 들수록 더 소중해진다.",
      'en': "Dreams become more precious as we age.",
      'tr': "Hayaller yaşlandıkça daha değerli hale gelir."
    },
    "꿈을 위해 오늘을 살아가라.": {
      'ko': "꿈을 위해 오늘을 살아가라.",
      'en': "Live today for your dreams.",
      'tr': "Hayallerin için bugünü yaşa."
    },
    "꿈은 용기 있는 자만이 이룰 수 있다.": {
      'ko': "꿈은 용기 있는 자만이 이룰 수 있다.",
      'en': "Only the courageous can achieve dreams.",
      'tr': "Sadece cesur olanlar hayalleri gerçekleştirebilir."
    },

    // 더 많은 노력 관련 명언들
    "노력하는 만큼 얻는다.": {
      'ko': "노력하는 만큼 얻는다.",
      'en': "You get as much as you work for.",
      'tr': "Çalıştığın kadar alırsın."
    },
    "노력은 재능을 이긴다.": {
      'ko': "노력은 재능을 이긴다.",
      'en': "Effort beats talent.",
      'tr': "Çaba yeteneği yener."
    },
    "노력하지 않으면 후회한다.": {
      'ko': "노력하지 않으면 후회한다.",
      'en': "You'll regret not trying.",
      'tr': "Denemezsen pişman olursun."
    },
    "노력은 기적을 만든다.": {
      'ko': "노력은 기적을 만든다.",
      'en': "Effort creates miracles.",
      'tr': "Çaba mucizeler yaratır."
    },

    // 더 많은 도전 관련 명언들
    "도전은 성장의 기회다.": {
      'ko': "도전은 성장의 기회다.",
      'en': "Challenge is an opportunity for growth.",
      'tr': "Meydan okuma büyüme fırsatıdır."
    },
    "도전하는 자만이 새로운 세계를 만난다.": {
      'ko': "도전하는 자만이 새로운 세계를 만난다.",
      'en': "Only those who challenge meet new worlds.",
      'tr': "Sadece meydan okuyanlar yeni dünyalarla tanışır."
    },
    "도전은 용기의 증거다.": {
      'ko': "도전은 용기의 증거다.",
      'en': "Challenge is proof of courage.",
      'tr': "Meydan okuma cesaretin kanıtıdır."
    },

    // 동기부여 관련 명언들
    "오늘 할 수 있는 일을 내일로 미루지 마라.": {
      'ko': "오늘 할 수 있는 일을 내일로 미루지 마라.",
      'en': "Don't put off until tomorrow what you can do today.",
      'tr': "Bugün yapabildiğin işi yarına bırakma."
    },
    "당신이 할 수 있다고 믿든 할 수 없다고 믿든, 당신이 옳다.": {
      'ko': "당신이 할 수 있다고 믿든 할 수 없다고 믿든, 당신이 옳다.",
      'en': "Whether you think you can or you think you can't, you're right.",
      'tr': "Yapabileceğini ya da yapamayacağını düşünsen de haklısın."
    },
    "기회는 준비된 마음에게 온다.": {
      'ko': "기회는 준비된 마음에게 온다.",
      'en': "Opportunity comes to prepared minds.",
      'tr': "Fırsat hazırlıklı zihinlere gelir."
    },
    "불가능한 것은 없다. 단지 시간이 더 걸릴 뿐이다.": {
      'ko': "불가능한 것은 없다. 단지 시간이 더 걸릴 뿐이다.",
      'en': "Nothing is impossible. It just takes more time.",
      'tr': "İmkansız bir şey yok. Sadece daha fazla zaman alır."
    },
    "실패는 성공으로 가는 과정이다.": {
      'ko': "실패는 성공으로 가는 과정이다.",
      'en': "Failure is a process toward success.",
      'tr': "Başarısızlık başarıya giden bir süreçtir."
    },
    "시작이 반이다.": {
      'ko': "시작이 반이다.",
      'en': "Starting is half the battle.",
      'tr': "Başlamak işin yarısıdır."
    },
    "오늘이 내 인생의 첫날이라고 생각하고 살아가자.": {
      'ko': "오늘이 내 인생의 첫날이라고 생각하고 살아가자.",
      'en': "Let's live as if today is the first day of my life.",
      'tr': "Bugünün hayatımın ilk günüymüş gibi yaşayalım."
    },
    "행복은 습관이다. 그것을 몸에 지녀라.": {
      'ko': "행복은 습관이다. 그것을 몸에 지녀라.",
      'en': "Happiness is a habit. Carry it with you.",
      'tr': "Mutluluk bir alışkanlıktır. Onu yanında taşı."
    },
    "위대한 일을 하려면 행동하는 것뿐만 아니라 꿈꾸는 것도 필요하다.": {
      'ko': "위대한 일을 하려면 행동하는 것뿐만 아니라 꿈꾸는 것도 필요하다.",
      'en': "To do great things, you need not only action but also dreams.",
      'tr': "Büyük işler yapmak için sadece eylem değil, hayal kurmak da gerekir."
    },
    "가장 큰 영광은 넘어지지 않는 것이 아니라 넘어질 때마다 일어서는 것이다.": {
      'ko': "가장 큰 영광은 넘어지지 않는 것이 아니라 넘어질 때마다 일어서는 것이다.",
      'en': "The greatest glory is not in never falling, but in rising every time we fall.",
      'tr': "En büyük zafer hiç düşmemek değil, her düştüğümüzde ayağa kalkmaktır."
    },
    "기회는 준비된 자에게만 온다.": {
      'ko': "기회는 준비된 자에게만 온다.",
      'en': "Opportunity comes only to those who are prepared.",
      'tr': "Fırsat sadece hazırlıklı olanlara gelir."
    },
    "포기하지 말라. 고통이 클수록 영광도 크다.": {
      'ko': "포기하지 말라. 고통이 클수록 영광도 크다.",
      'en': "Don't give up. The greater the pain, the greater the glory.",
      'tr': "Pes etme. Acı ne kadar büyükse zafer de o kadar büyüktür."
    },
    "변화를 원한다면 스스로 그 변화가 되어라.": {
      'ko': "변화를 원한다면 스스로 그 변화가 되어라.",
      'en': "If you want change, become that change yourself.",
      'tr': "Değişim istiyorsan, kendin o değişim ol."
    },

    // 인생 관련 명언들
    "인생은 10%는 당신에게 일어나는 일이고, 90%는 그것에 어떻게 반응하느냐다.": {
      'ko': "인생은 10%는 당신에게 일어나는 일이고, 90%는 그것에 어떻게 반응하느냐다.",
      'en': "Life is 10% what happens to you and 90% how you react to it.",
      'tr': "Hayat %10 başına gelenler, %90 bunlara nasıl tepki verdiğindir."
    },
    "행복은 습관이다. 그것을 기르라.": {
      'ko': "행복은 습관이다. 그것을 기르라.",
      'en': "Happiness is a habit. Cultivate it.",
      'tr': "Mutluluk bir alışkanlıktır. Onu geliştir."
    },
    "인생에서 가장 중요한 것은 호흡하는 것이 아니라, 숨이 멎을 만한 순간들이다.": {
      'ko': "인생에서 가장 중요한 것은 호흡하는 것이 아니라, 숨이 멎을 만한 순간들이다.",
      'en': "Life is not about breathing, but about moments that take your breath away.",
      'tr': "Hayat nefes almakla ilgili değil, nefesini kesen anlarla ilgilidir."
    }
  };

  // 저자 번역 맵
  static final Map<String, Map<String, String>> _authorTranslations = {
    "루이 파스퇴르": {
      'ko': "루이 파스퇴르",
      'en': "Louis Pasteur",
      'tr': "Louis Pasteur"
    },
    "마크 트웨인": {
      'ko': "마크 트웨인",
      'en': "Mark Twain",
      'tr': "Mark Twain"
    },
    "엘리너 루즈벨트": {
      'ko': "엘리너 루즈벨트",
      'en': "Eleanor Roosevelt",
      'tr': "Eleanor Roosevelt"
    },
    "윈스턴 처칠": {
      'ko': "윈스턴 처칠",
      'en': "Winston Churchill",
      'tr': "Winston Churchill"
    },
    "프랭크 시나트라": {
      'ko': "프랭크 시나트라",
      'en': "Frank Sinatra",
      'tr': "Frank Sinatra"
    },
    "월트 디즈니": {
      'ko': "월트 디즈니",
      'en': "Walt Disney",
      'tr': "Walt Disney"
    },
    "존 레논": {
      'ko': "존 레논",
      'en': "John Lennon",
      'tr': "John Lennon"
    },
    "존 F. 케네디": {
      'ko': "존 F. 케네디",
      'en': "John F. Kennedy",
      'tr': "John F. Kennedy"
    },
    "벤자민 프랭클린": {
      'ko': "벤자민 프랭클린",
      'en': "Benjamin Franklin",
      'tr': "Benjamin Franklin"
    },
    "토마스 에디슨": {
      'ko': "토마스 에디슨",
      'en': "Thomas Edison",
      'tr': "Thomas Edison"
    },
    "유진 글래드스톤": {
      'ko': "유진 글래드스톤",
      'en': "Eugene Gladstone",
      'tr': "Eugene Gladstone"
    },
    "나폴레옹 보나파르트": {
      'ko': "나폴레옹 보나파르트",
      'en': "Napoleon Bonaparte",
      'tr': "Napolyon Bonaparte"
    },
    "마더 테레사": {
      'ko': "마더 테레사",
      'en': "Mother Teresa",
      'tr': "Rahibe Teresa"
    },
    "아리스토텔레스": {
      'ko': "아리스토텔레스",
      'en': "Aristotle",
      'tr': "Aristo"
    },
    "공자": {
      'ko': "공자",
      'en': "Confucius",
      'tr': "Konfüçyüs"
    },
    "마하트마 간디": {
      'ko': "마하트마 간디",
      'en': "Mahatma Gandhi",
      'tr': "Mahatma Gandhi"
    },
    "헨리 포드": {
      'ko': "헨리 포드",
      'en': "Henry Ford",
      'tr': "Henry Ford"
    },
    "허버드": {
      'ko': "허버드",
      'en': "Hubbard",
      'tr': "Hubbard"
    },
    "아나톨 프랑스": {
      'ko': "아나톨 프랑스",
      'en': "Anatole France",
      'tr': "Anatole France"
    },
    "탈무드": {
      'ko': "탈무드",
      'en': "Talmud",
      'tr': "Talmud"
    },
    "아브라 로드리게스": {
      'ko': "아브라 로드리게스",
      'en': "Abra Rodriguez",
      'tr': "Abra Rodriguez"
    },
    "현대 격언": {
      'ko': "현대 격언",
      'en': "Modern Proverb",
      'tr': "Modern Atasözü"
    },
    "현대 명언": {
      'ko': "현대 명언",
      'en': "Modern Quote",
      'tr': "Modern Söz"
    },
    "현대 지혜": {
      'ko': "현대 지혜",
      'en': "Modern Wisdom",
      'tr': "Modern Bilgelik"
    },
    "현대 철학": {
      'ko': "현대 철학",
      'en': "Modern Philosophy",
      'tr': "Modern Felsefe"
    },
    "자기계발": {
      'ko': "자기계발",
      'en': "Self Development",
      'tr': "Kişisel Gelişim"
    },
    "현대 리더십": {
      'ko': "현대 리더십",
      'en': "Modern Leadership",
      'tr': "Modern Liderlik"
    },
    "한국 속담": {
      'ko': "한국 속담",
      'en': "Korean Proverb",
      'tr': "Kore Atasözü"
    },
    "한국 격언": {
      'ko': "한국 격언",
      'en': "Korean Saying",
      'tr': "Kore Deyişi"
    },
    "희망의 메시지": {
      'ko': "희망의 메시지",
      'en': "Message of Hope",
      'tr': "Umut Mesajı"
    },
    "현대 시": {
      'ko': "현대 시",
      'en': "Modern Poetry",
      'tr': "Modern Şiir"
    }
  };

  // 카테고리 번역 맵
  static final Map<String, Map<String, String>> _categoryTranslations = {
    "성공": {
      'ko': "성공",
      'en': "Success",
      'tr': "Başarı"
    },
    "동기부여": {
      'ko': "동기부여",
      'en': "Motivation",
      'tr': "Motivasyon"
    },
    "인생": {
      'ko': "인생",
      'en': "Life",
      'tr': "Hayat"
    },
    "꿈": {
      'ko': "꿈",
      'en': "Dreams",
      'tr': "Rüyalar"
    },
    "도전": {
      'ko': "도전",
      'en': "Challenge",
      'tr': "Meydan Okuma"
    },
    "성장": {
      'ko': "성장",
      'en': "Growth",
      'tr': "Büyüme"
    },
    "노력": {
      'ko': "노력",
      'en': "Effort",
      'tr': "Çaba"
    },
    "희망": {
      'ko': "희망",
      'en': "Hope",
      'tr': "Umut"
    },
    "실패": {
      'ko': "실패",
      'en': "Failure",
      'tr': "Başarısızlık"
    },
    "믿음": {
      'ko': "믿음",
      'en': "Faith",
      'tr': "İnanç"
    },
    "시작": {
      'ko': "시작",
      'en': "Beginning",
      'tr': "Başlangıç"
    },
    "행복": {
      'ko': "행복",
      'en': "Happiness",
      'tr': "Mutluluk"
    },
    "행동": {
      'ko': "행동",
      'en': "Action",
      'tr': "Eylem"
    },
    "극복": {
      'ko': "극복",
      'en': "Overcome",
      'tr': "Üstesinden Gelme"
    },
    "기회": {
      'ko': "기회",
      'en': "Opportunity",
      'tr': "Fırsat"
    },
    "인내": {
      'ko': "인내",
      'en': "Patience",
      'tr': "Sabır"
    },
    "변화": {
      'ko': "변화",
      'en': "Change",
      'tr': "Değişim"
    },
    "일반": {
      'ko': "일반",
      'en': "General",
      'tr': "Genel"
    }
  };

  // 언어별 명언 반환
  static Quote getRandomQuoteByLanguage(String languageCode) {
    final originalQuote = getRandomQuote();
    return _translateQuote(originalQuote, languageCode);
  }

  static Quote getRandomQuoteByCategoryAndLanguage(String category, String languageCode) {
    final originalQuote = getRandomQuoteByCategory(category);
    return _translateQuote(originalQuote, languageCode);
  }

  static Quote _translateQuote(Quote originalQuote, String languageCode) {
    String translatedText = originalQuote.text;
    String translatedAuthor = originalQuote.author;
    String translatedCategory = originalQuote.category;

    // 번역이 있는 경우 해당 언어로 번역
    if (_translations.containsKey(originalQuote.text)) {
      translatedText = _translations[originalQuote.text]?[languageCode] ?? originalQuote.text;
    } else if (languageCode != 'ko') {
      // 번역이 없는 경우 기본 영어 번역 생성
      translatedText = _generateDefaultTranslation(originalQuote.text, languageCode);
    }

    // 저자 번역
    translatedAuthor = _authorTranslations[originalQuote.author]?[languageCode] ?? originalQuote.author;
    
    // 카테고리 번역
    translatedCategory = _categoryTranslations[originalQuote.category]?[languageCode] ?? originalQuote.category;

    return Quote(
      text: translatedText,
      author: translatedAuthor,
      category: translatedCategory,
    );
  }

  // 기본 번역 생성 - 완전한 명언으로 대체
  static String _generateDefaultTranslation(String koreanText, String languageCode) {
    // 카테고리별 영어 명언 풀
    final List<String> englishQuotes = [
      "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      "The only way to do great work is to love what you do.",
      "Innovation distinguishes between a leader and a follower.",
      "Your time is limited, so don't waste it living someone else's life.",
      "The future belongs to those who believe in the beauty of their dreams.",
      "It does not matter how slowly you go as long as you do not stop.",
      "Everything you've ever wanted is on the other side of fear.",
      "Believe you can and you're halfway there.",
      "The only impossible journey is the one you never begin.",
      "In the middle of difficulty lies opportunity.",
      "Success is walking from failure to failure with no loss of enthusiasm.",
      "Don't be afraid to give up the good to go for the great.",
      "The way to get started is to quit talking and begin doing.",
      "If you really look closely, most overnight successes took a long time.",
      "The secret of success is to do the common thing uncommonly well.",
      "I find that the harder I work, the more luck I seem to have.",
      "Don't let yesterday take up too much of today.",
      "You learn more from failure than from success.",
      "If you are working on something that you really care about, you don't have to be pushed.",
      "Experience is a hard teacher because she gives the test first, the lesson afterward."
    ];

    // 카테고리별 터키어 명언 풀
    final List<String> turkishQuotes = [
      "Başarı son değil, başarısızlık ölümcül değil: önemli olan devam etme cesaretine sahip olmaktır.",
      "Büyük işler yapmanın tek yolu, yaptığınız işi sevmektir.",
      "İnovasyon bir lider ile takipçi arasındaki farkı yaratır.",
      "Zamanınız sınırlı, bu yüzden başkasının hayatını yaşayarak harcamayın.",
      "Gelecek, hayallerinin güzelliğine inananlara aittir.",
      "Ne kadar yavaş gittiğiniz önemli değil, durmadığınız sürece.",
      "İstediğiniz her şey korkunun öteki tarafındadır.",
      "Yapabileceğinize inanın, yarı yolu almış sayılırsınız.",
      "İmkansız olan tek yolculuk, asla başlamadığınızdır.",
      "Zorluğun ortasında fırsat yatar.",
      "Başarı, coşkusunu kaybetmeden başarısızlıktan başarısızlığa yürümektir.",
      "İyiyi bırakıp mükemmeli hedeflemekten korkmayın.",
      "Başlamanın yolu, konuşmayı bırakıp yapmaya başlamaktır.",
      "Gerçekten yakından bakarsanız, çoğu gece başarısı uzun zaman aldı.",
      "Başarının sırrı, sıradan şeyi sıra dışı bir şekilde yapmaktır.",
      "Ne kadar çok çalışırsam, o kadar şanslı görünüyorum.",
      "Dünün bugünün çok fazlasını almasına izin vermeyin.",
      "Başarıdan çok başarısızlıktan öğrenirsiniz.",
      "Gerçekten önemsediğiniz bir şey üzerinde çalışıyorsanız, itilmenize gerek yoktur.",
      "Tecrübe sert bir öğretmendir çünkü önce sınavı verir, dersi sonra verir."
    ];

    if (languageCode == 'en') {
      // 해시 기반으로 일관된 명언 선택
      final hash = koreanText.hashCode.abs();
      return englishQuotes[hash % englishQuotes.length];
    } else if (languageCode == 'tr') {
      // 해시 기반으로 일관된 명언 선택
      final hash = koreanText.hashCode.abs();
      return turkishQuotes[hash % turkishQuotes.length];
    }
    
    return koreanText; // 기본값으로 원본 반환
  }

  static List<String> getCategoriesByLanguage(String languageCode) {
    return getAllCategories().map((category) {
      return _categoryTranslations[category]?[languageCode] ?? category;
    }).toList();
  }
}
