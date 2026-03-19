# Design System

Tai lieu nay la design guide de cac frontend khac (React, Vue, Angular, mobile web, static site) co the tai hien dung giao dien Chanh Dao.

## 1) Muc tieu giao dien

- Truyen tai cam giac thanh tinh, am ap, de tiep can.
- Uu tien kha nang doc cho noi dung dai (bai hoc, lo trinh, mo ta khoa hoc).
- Dieu huong ro rang, han che qua tai thi giac.
- Nhat quan tren desktop, tablet, mobile.

## 2) Design principles

- Calm first: nen sang am, nhan vang triet ly, khong dung mau gay gat.
- Content first: tieu de, doan van, khoang trang du rong cho noi dung hoc tap.
- Soft depth: dung border + shadow nhe thay vi hieu ung nang.
- Motion with purpose: animation ngan, ro y nghia, khong lam nguoi dung mat tap trung.

## 3) Core tokens

Dong bo voi `tailwind.config.ts` va `app/assets/css/main.css`.

### 3.1 Colors

- Brand:
	- `brand.primary` = `#D4AF37`
	- `brand.accent` = `#B8860B`
	- `brand.gold-light` = `#E8C547`
- Surface:
	- `surface.bg` = `#FCF8ED`
	- `surface.bg-alt` = `#F5EDD6`
	- `surface.card` = `rgba(212, 175, 55, 0.06)`
	- `surface.card-hover` = `rgba(212, 175, 55, 0.12)`
- Text:
	- `text.primary` = `#3E2F1B`
	- `text.secondary` = `#6B5B3E`
	- `text.muted` = `#8B7B5E`
	- `text.light` = `#A89672`
- Semantic:
	- `success` = `#4CAF50`
	- `failure` = `#f44336`
	- `wisdom` = `#9C27B0`
	- `growth` = `#2196F3`
	- `premium` = `#D4AF37`
	- `lock` = `#9E9E9E`

### 3.2 Typography

- Serif (heading, key value): `Lora`, fallback `Crimson Text`, `Playfair Display`, `Georgia`, `serif`.
- Sans (body, nav, ui): `Inter`, fallback `Roboto`, `Lexend`, system sans.
- Body size mac dinh: `18px`.
- Do uu tien:
	- Heading: serif + contrast cao voi nen.
	- Body: sans + line-height rong de doc lau.

### 3.3 Spacing and shape

- Max width content: `1200px`
- Max width narrow: `800px`
- Section x-padding: `20px`
- Section y-padding: `80px`
- Hero top spacing: `140px`
- Radius:
	- `pill` = `50px`
	- `card` = `16px`

### 3.4 Shadows

- `shadow.brand` = `0 4px 15px rgba(212, 175, 55, 0.2)`
- `shadow.brand-lg` = `0 6px 25px rgba(212, 175, 55, 0.35)`
- `shadow.card` = `0 2px 12px rgba(62, 47, 27, 0.08)`
- `shadow.dropdown` = `0 12px 32px rgba(62, 47, 27, 0.15)`

## 4) Shared components

### 4.1 Buttons

- Primary:
	- Gradient nen `brand.primary -> brand.accent`
	- Chu trang
	- Hover: nhe len (`translateY -2px`) + shadow dam hon
- Secondary:
	- Nen trong suot + border `brand.accent`
	- Hover: fill mau `brand.accent`, chu trang
- Outline:
	- Border nhe theo `brand.primary`
	- Hover: nen vang rat nhe

### 4.2 Card

- Nen trang, border vang nhe, bo goc `16px`, `shadow.card`.
- Hover: border dam them, doi shadow sang `shadow.brand`.
- Tranh shadow den dam hoac blur lon.

### 4.3 Badge

- Kieu uppercase nho, tracking rong, bo tronc.
- Mau semantic theo cap do noi dung (beginner/intermediate/advanced/free).

### 4.4 Progress bar

- Track: vang rat nhe.
- Fill: gradient vang.
- Transition width `~600ms` de tao cam giac tien trinh mem.

## 5) Layout and responsive

- Mobile-first.
- Breakpoint de tham chieu:
	- `<640px`: bo cuc 1 cot, CTA xep doc khi can.
	- `>=640px`: co the 2 cot cho card.
	- `>=1024px`: nav desktop day du, card 3 cot.
- Header sticky/fixed duoc phep, nhung phai co nen mo de giu kha nang doc.
- Section dung `max-width` + center, khong full-width voi noi dung dai.

## 6) Content readability rules

- Doan van dai dung line-height `>= 1.7`.
- Heading levels ro rang, khong nhay cap (`h1 -> h3` khi bo qua `h2`).
- Noi dung rendered (markdown/html) can style rieng cho:
	- `h2`, `h3`
	- list, blockquote, code inline, table, hr
- Blockquote dung vien trai vang + nen vang rat nhe.

## 7) Accessibility minimum

- Dam bao contrast:
	- Text chinh tren nen sang dat muc de doc ro.
	- Link/CTA trang thai hover khac biet ro rang.
- Muc tieu bam toi thieu: `44x44px` cho nut quan trong tren mobile.
- Co visible focus state cho keyboard navigation.
- Icon khong duoc la kenh truyen tai thong tin duy nhat; can label text khi can.

## 8) Motion guideline

- Duration:
	- Quick interaction: `150-220ms`
	- Section/menu transition: `250-320ms`
- Easing uu tien: ease-out.
- Tranh animation lien tuc gay mat tap trung.

## 9) Porting to other frontend stacks

Khi dung stack khac Tailwind, map token sang CSS variables truoc, sau do map vao theme system cua stack do.

Vi du token layer:

```css
:root {
	--cd-brand-primary: #D4AF37;
	--cd-brand-accent: #B8860B;
	--cd-surface-bg: #FCF8ED;
	--cd-surface-bg-alt: #F5EDD6;
	--cd-text-primary: #3E2F1B;
	--cd-text-secondary: #6B5B3E;
	--cd-radius-pill: 50px;
	--cd-radius-card: 16px;
}
```

Thu tu uu tien khi port:

1. Colors + typography
2. Spacing + radius + shadows
3. Button/card states
4. Responsive behavior
5. Content rendering styles

## 10) QA checklist for parity

- Visual parity:
	- Hero gradient text, CTA styles, nav states trung voi ban goc.
	- Card hover va button hover dung transition mong muon.
- Responsive parity:
	- Header, mobile menu, card grid dung hanh vi tai cac breakpoint chinh.
- Readability parity:
	- Bai viet dai, list, quote, table de doc tren mobile.
- Accessibility parity:
	- Keyboard focus, contrast, hit target.

Neu can mo rong design system, uu tien them token truoc khi them component moi de giu tinh nhat quan va de maintain.
