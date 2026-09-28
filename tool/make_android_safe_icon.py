#!/usr/bin/env python3
"""Convert a logo PNG/SVG into an Android-safe square PNG (transparent padding).

Pipeline (anti-alias friendly):
  1. Soft black-matte (smoothstep alpha) — avoids jagged hard cutouts
  2. Crop content
  3. Compose on 4x canvas, mild blur, LANCZOS downscale + light unsharp

Android adaptive/splash safe zone ≈ 66% diameter. Default --ratio 0.55.

Usage:
  python3 tool/make_android_safe_icon.py assets/images/logo_splash.svg -o assets/images/logo_splash.png
"""

from __future__ import annotations

import argparse
import base64
import math
import re
import sys
from pathlib import Path

try:
    from PIL import Image, ImageFilter
except ImportError:
    sys.exit('Pillow required: pip install pillow')


def load_image(path: Path) -> Image.Image:
    if path.suffix.lower() == '.svg':
        text = path.read_text(errors='ignore')
        m = re.search(
            r'(?:xlink:)?href="data:image/(?:png|jpeg|jpg);base64,([^"]+)"',
            text,
        )
        if not m:
            sys.exit(f'No embedded raster image in {path}')
        raw = base64.b64decode(m.group(1))
        tmp = Path('/tmp/_vppos_svg_embed.bin')
        tmp.write_bytes(raw)
        return Image.open(tmp).convert('RGBA')
    return Image.open(path).convert('RGBA')


def soft_matte(img: Image.Image, black: int = 6, soft: int = 48) -> Image.Image:
    out = []
    for r, g, b, _a in img.getdata():
        lum = max(r, g, b)
        if lum <= black:
            out.append((0, 0, 0, 0))
        elif lum < soft:
            t = (lum - black) / (soft - black)
            t = t * t * (3 - 2 * t)  # smoothstep
            out.append((r, g, b, int(255 * t)))
        else:
            out.append((r, g, b, 255))
    result = Image.new('RGBA', img.size)
    result.putdata(out)
    return result


def crop_content(img: Image.Image, alpha_min: int = 12) -> Image.Image:
    px = img.load()
    w, h = img.size
    minx, miny, maxx, maxy = w, h, -1, -1
    for y in range(h):
        for x in range(w):
            if px[x, y][3] > alpha_min:
                minx, miny = min(minx, x), min(miny, y)
                maxx, maxy = max(maxx, x), max(maxy, y)
    if maxx < 0:
        sys.exit('No logo content found')
    return img.crop((minx, miny, maxx + 1, maxy + 1))


def fit_android_safe(
    logo: Image.Image,
    out_path: Path,
    circle_ratio: float = 0.55,
    canvas: int = 1024,
) -> None:
    lw, lh = logo.size
    hi = canvas * 4
    scale = (hi * circle_ratio) / math.hypot(lw, lh)
    nw = max(1, int(round(lw * scale)))
    nh = max(1, int(round(lh * scale)))
    resized = logo.resize((nw, nh), Image.Resampling.LANCZOS)

    r, g, b, a = resized.split()
    a = a.filter(ImageFilter.GaussianBlur(radius=1.2))
    rgb = Image.merge('RGB', (r, g, b)).filter(ImageFilter.GaussianBlur(radius=0.6))
    r, g, b = rgb.split()
    resized = Image.merge('RGBA', (r, g, b, a))

    big = Image.new('RGBA', (hi, hi), (0, 0, 0, 0))
    big.paste(resized, ((hi - nw) // 2, (hi - nh) // 2), resized)
    out = big.resize((canvas, canvas), Image.Resampling.LANCZOS)
    out = out.filter(ImageFilter.UnsharpMask(radius=1.2, percent=80, threshold=2))

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out.save(out_path, 'PNG')
    print(f'{out_path}: {nw}x{nh}@4x -> {canvas} (ratio={circle_ratio:.0%})')


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('input', type=Path)
    p.add_argument('-o', '--output', type=Path, default=None)
    p.add_argument('--ratio', type=float, default=0.55)
    p.add_argument('--canvas', type=int, default=1024)
    args = p.parse_args()

    out = args.output or args.input.with_name(f'{args.input.stem}_android.png')
    logo = crop_content(soft_matte(load_image(args.input)))
    fit_android_safe(logo, out, circle_ratio=args.ratio, canvas=args.canvas)


if __name__ == '__main__':
    main()
