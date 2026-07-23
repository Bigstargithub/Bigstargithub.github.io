# POSTING_GUIDE.md — 글 작성 가이드

> 이 문서는 사이트에 배포되지 않습니다(`_config.yml`의 `exclude`에 포함).
> 새 글을 쓸 때마다 참고하는 체크리스트입니다.

## 1. 파일 위치 & 이름

`_posts/` 디렉토리에 아래 형식으로 파일 생성:

```
_posts/YYYY-MM-DD-제목-slug.md
```

예: `_posts/2026-07-09-sql-execution-order.md`

- 날짜는 실제 발행일과 맞출 것. 미래 날짜로 저장하면 로컬/배포 빌드 모두에서
  기본적으로 숨겨짐(발행 예약과 동일한 동작).
- slug(파일명 뒷부분)는 영문 소문자 + 하이픈 권장 (URL에 그대로 쓰임).

## 2. Front Matter

```yaml
---
title: "글 제목"
date: 2026-07-09 21:00:00 +0900
categories: [Algorithm]   # Algorithm / AI / Backend / Database 중 하나만
---
```

- `categories`는 **넷 중 하나만** 지정. 카테고리를 늘리거나 2단계 서브카테고리를
  쓰지 않는다(초기 방침 유지).
- `tags`는 쓰지 않는다. 이 사이트는 태그/아카이브 기능을 껐다.
- 특정 글에 소셜 공유용 대표 이미지를 따로 쓰고 싶으면 `image:` 필드 추가 가능
  (없으면 사이트 기본 OG 이미지가 쓰임):
  ```yaml
  image: /assets/img/posts/example.png
  ```

## 3. 본문 작성

- 마크다운(Kramdown) 문법 사용.
- 코드 블록은 반드시 언어를 지정해야 문법 하이라이팅 + 복사 버튼이 동작:
  ````
  ```python
  def solution(a, b):
      return a + b
  ```
  ````
- 제목은 `##`(h2)부터 시작할 것. `#`(h1)은 포스트 제목 전용이라 본문에서 h1을
  쓰면 목차(TOC)가 어색해짐. h2/h3가 있어야 TOC가 자동 생성됨.
- 이미지가 필요하면 `assets/img/posts/` 같은 경로에 넣고 `![](경로)`로 참조.

## 4. 로컬 미리보기

```bash
bundle exec jekyll serve
```

- `http://127.0.0.1:4000` 접속해서 렌더링 확인.
- 오늘 이후 시각으로 예약 발행한 글까지 보고 싶으면 `--future` 옵션 추가:
  ```bash
  bundle exec jekyll serve --future
  ```

## 5. 배포

별도 빌드 명령 없이 `main`에 push하면 GitHub Actions가 자동으로 빌드·배포한다.

```bash
git add _posts/2026-07-09-제목.md
git commit -m "포스트: 제목"
git push origin main
```

push 후 GitHub Actions 탭에서 "Build and Deploy" 워크플로가 성공했는지 확인하면 끝.

## 6. 체크리스트 (발행 전)

- [ ] `categories`가 Algorithm/AI/Backend/Database 중 하나인가
- [ ] 날짜/시간이 맞는가 (`+0900`)
- [ ] 코드 블록에 언어 지정했는가
- [ ] 본문에 h1을 쓰지 않았는가
- [ ] 로컬에서 `jekyll serve`로 렌더링 확인했는가
