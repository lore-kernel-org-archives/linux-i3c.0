Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2210E7718B
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oM441m/kkIfY47IFu5POIp/usCrxEaz6JLhPZFoiyJ4=; b=rUHbnr+zKGHDf/
	KIT8a0CTCmmey9rqj3VupTLQFOWGK1/6mkWIRJr14dGMYEfCpg8nngft9O9aZ6CdnMsAb9l33beoL
	3eCrmofdE+gkffEyzZCVCLPub6lBj+ji8W0ulBFuhYeyauILT0gB9/kf+F117Ex8fgUI78tFlaAnl
	S1A5FSHWWNGGmdsik40hwzaeGkMFD/darF6yD3Cjb+GpTHG83j4M8+DFNqdJWH4t5Ks1JWX80hpVu
	K7G7X7HkTt3QzLcb/H7/q+4uddaoetPEBoeBmCvfhksUg8mWWWxuaFrz5ODkliOBA3ODfxJmSxVG9
	oEvLklOkfyJmcJLdBFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqs9-00000003Hlr-2k7J;
	Sun, 29 Dec 2024 10:50:13 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqs6-00000003Hks-3mYp
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:50:12 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b11a110e4eso2371458137.1
        for <linux-i3c@lists.infradead.org>; Sun, 29 Dec 2024 02:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735469408; x=1736074208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ0pwHb7t8cFMA4VKZuPNOPFB/kxFNmjFIAMXrbg0mk=;
        b=n2zVkxCpI3Qawt+H2eUE+IF5YpsiNgltWilgNicHH6tfEZMMCcctjJ7/QjACMvj7xD
         IUNU4SOoB0MaTS1DxUWF/Hx7VH+5ukOpT5lQXuubAzax0/uKVdF3+E98vyncko7xO46r
         qsd9l86BX/G5pIjO7+ZMTzU0sepVIfleptIhwaWec459L9BiUGc0QBD/PWZYWybqZ2J7
         +vjksaw1xSYoQk8nP/8Fy9NbJQeVPp3l34YK5dd3qUTqWe23ZphgK1okHu6XrmFW2uiX
         RaLBGNEZotWndy9iIsEpE1+lRDgNATnJn5T1Bu8ytI6AgVjjBQw4hjYjHkhgQzE8oEQw
         koew==
X-Gm-Message-State: AOJu0YwU19XV1C19B6aZfIlHHrmjrYdDTl3XcLXpAO7zNjaUD48UWeu+
	+oQ/6iF2D5g478iSgqxRQF2O9FTAmlByq4wnfVus0spQBiTdaYUG/f+6mUbR
X-Gm-Gg: ASbGncuLnJxd6rc9jxd7JrP4bHvetKrqG7BfF/dqlnhOwgL1lPm+U3YHoI0Nx9U03sC
	GSU/QuNkK34w9eFlkvE1R4kPkAJGO1Qs5o/fZI4cfhnczLqR82Suy+XORYmvxVOdz3Lu2SiWei7
	cPqHVlwJCyv7BoqVedU73gWsD6VHm7ZouWuRBen+hW2PLdVrVE+FPFlB5iyTI8WR8dg908vNROk
	Ohx3g831gbyDa1EaarxedIIaNC8MP73/dNqQtssn26eHAGk8OmPBCviBOLZPPYPgW+q+LspRi3U
	fnVDepPusk9VEaqu/tyYBF0=
X-Google-Smtp-Source: AGHT+IGuOaBJ+Tf1CP8d9NYkWTwHlQ/JnDScyXiQvoYHiuBHUhWopCH330tADcYKErA1hyvtSlaLow==
X-Received: by 2002:a05:6102:6e88:b0:4b2:ad50:a99c with SMTP id ada2fe7eead31-4b2fc2d6005mr11364765137.2.1735469408365;
        Sun, 29 Dec 2024 02:50:08 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad38ecsm3586287137.29.2024.12.29.02.50.08
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 02:50:08 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-518957b0533so2666165e0c.1
        for <linux-i3c@lists.infradead.org>; Sun, 29 Dec 2024 02:50:08 -0800 (PST)
X-Received: by 2002:a05:6102:41a5:b0:4af:fa1b:d8f9 with SMTP id
 ada2fe7eead31-4b2cc35dd44mr27262082137.7.1735469407868; Sun, 29 Dec 2024
 02:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com> <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Dec 2024 11:49:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
Message-ID: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_025010_947251_E713F829 
X-CRM114-Status: GOOD (  18.84  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgV29sZnJhbSwKCk9uIFN1biwgRGVjIDI5LCAyMDI0IGF0IDExOjEz4oCvQU0gV29sZnJhbSBT
YW5nCjx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gVGhlIGtlcm5l
bCBoYXMgbm93IGEgZ2VuZXJpYyBoZWxwZXIgZm9yIGdldHRpbmcgcGFyaXR5IHdpdGggZWFzaWVy
IHRvCj4gdW5kZXJzdGFuZCBzZW1hbnRpY3MuIE1ha2UgdXNlIG9mIGl0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KClRo
YW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1tYXN0
ZXItY2Rucy5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5jCj4g
QEAgLTg4OSw4ICs4ODksNyBAQCBzdGF0aWMgdTMyIHByZXBhcmVfcnIwX2Rldl9hZGRyZXNzKHUz
MiBhZGRyKQo+ICAgICAgICAgcmV0IHw9IChhZGRyICYgR0VOTUFTSyg5LCA3KSkgPDwgNjsKPgo+
ICAgICAgICAgLyogUlIwWzBdID0gflhPUihhZGRyWzY6MF0pICovCj4gLSAgICAgICBpZiAoISho
d2VpZ2h0OChhZGRyICYgMHg3ZikgJiAxKSkKPiAtICAgICAgICAgICAgICAgcmV0IHw9IDE7Cj4g
KyAgICAgICByZXQgfD0gcGFyaXR5OChhZGRyICYgMHg3ZikgPyAwIDogQklUKDApOwoKUGVyaGFw
cyBrZWVwIHRoZSBpZigpLWNvbnN0cnVjdCwgdG8gYmV0dGVyIG1hdGNoIHRoZSBleGFtcGxlIGlu
IHRoZQpkb2N1bWVudGF0aW9uIGluIDEvNT8KCj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
