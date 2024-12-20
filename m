Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1484E77188
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgjgO/hBF1XGTPm7iiRB22mt/onI4tbAmTIhGM8pvL8=; b=3Lb967jw5fSiaz
	w9vUN8pdt5YqdRPQ0tWZz22kfAH7Tw+JS/rgUIZ2SDsNHlZKzb3Ufwn5kaJzcQ63LM3RDZ8vQem5j
	L3C9+u54wREoYZfIwCsEfoWoYQjNE3vECT+r82AL/6200PIoq8cghf92HUM4Bk4G63aBYeUA6dtCV
	eWc4OZB/R5ZEtGFIgnpm6PW8B3O7xnHMe4erigykRpZyMw1u947mWXEz+lrOZI5HqBuhwlPpKRuCm
	UMzPUfFh5aGARgRGfvAq25ReK43Kezza4QhP0Uhhzq9Of7o08CPHFrNYgl3ErPJE3+Wpnd2RIAvuq
	EkgXGY2cOu3uNwQ2gecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYex-00000004K7E-2JxW;
	Fri, 20 Dec 2024 08:46:59 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYev-00000004K6Q-0kje
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 08:46:58 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-518ae5060d4so504825e0c.0
        for <linux-i3c@lists.infradead.org>; Fri, 20 Dec 2024 00:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684414; x=1735289214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMGgWsa7y60D5IAlpUC633KRtr5EIYgMuwLWC1uedY8=;
        b=ezvot/k83iOZ17Yiajk+lrPvQwa7x30dFTQxA/HO/UKa+2AnVLd/wPZuAaKYYlAbQg
         LOg4Zav0bkpuKoA8hg0PbIKyF1iI/FZZeEPMoyDwRzebeWx4Tmki/4OtAFFLZnxW7S6R
         hxdCkOEZQcTa+VgrQjNsZhFt0O3C+Mao+Td/8U9IuzyI5Pv3SVHNWjJDlne6I7znn50V
         Uf2dfGc/vW9Ff1boyYRpcprc8TpvieMQ8MZr82s0w/WhyV9+RyV9yFh908lw3oTwvLPI
         z9dncZh6d5xltwP/zwJdzA9N6FcntZOhvpCS16zClqwy5tZIBUe3rTWeX89f50WvXWwR
         us7w==
X-Forwarded-Encrypted: i=1; AJvYcCV5WEYBLXzbYGPENvWbnOc7bz/MDCKVfJEkWL/7E326dEqRPDVuPTHGvnsrKZUp2qEWw9ecRsgWPu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlplQVk/vveeUeO7oNukgzze62mSnU7gfzVDnTz4kLZijQ7xLy
	LItuParedx8zuNrkJgzfdXtbFrPm0dMxws0KqEhX1XRBMyqCfpq4rYCAPraF
X-Gm-Gg: ASbGncsJwCZ2VKndoudQXPgjFLs1mPeruY0iNIVFxfVc7dZqYaoH+6ssTZI5t09FmYm
	C26uyy6HUWajtsF07VZ75H3ap2NYIXgl/C3tUKdywdflADzDUmbGNH7oGBGy3F8EurZxKFekI+d
	xXVyY6ACTbkXPzgEYLbZl3lktZXRS7YPAbwTOOJnp4eokUDxLw2NLOxPMMlzlYNa51XglLOzvsa
	+tIrEIXd1esNK8HQtTHeDEQJ1yR5GGGJn4/HvM79MKMyz6Y8oj5u9UkjOSt7dnqnCezC2UrZVkg
	sg0jJELbI9tr5BrW7MU=
X-Google-Smtp-Source: AGHT+IF+VzKryE/0XzsnlXkoo8yeKnkdrhAZvhgYkAeqY50X0Z/ypW6BDhR8mM2ucRzS5oEmnJIuwA==
X-Received: by 2002:a05:6122:1999:b0:518:8bfe:d5f0 with SMTP id 71dfb90a1353d-51b75ac4537mr1729540e0c.0.1734684414161;
        Fri, 20 Dec 2024 00:46:54 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d08df2sm321662e0c.47.2024.12.20.00.46.53
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:46:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so309432241.2
        for <linux-i3c@lists.infradead.org>; Fri, 20 Dec 2024 00:46:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNsMaoljYbsySPd5I74epWjjZnh8bZllP41RChpj0vTKvamGBWPosqJkVPnbv/gRRnMOQpU5p5nX4=@lists.infradead.org
X-Received: by 2002:a05:6102:3707:b0:4af:f6ab:9f9c with SMTP id
 ada2fe7eead31-4b2cc487ca5mr1654888137.23.1734684413478; Fri, 20 Dec 2024
 00:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 09:46:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE7g7p_ysL6MjJqFxMdM9eY-cuOhXb9mAqDaJp-FOOdQ@mail.gmail.com>
Message-ID: <CAMuHMdVE7g7p_ysL6MjJqFxMdM9eY-cuOhXb9mAqDaJp-FOOdQ@mail.gmail.com>
Subject: Re: [PATCH] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_004657_220088_9B344423 
X-CRM114-Status: GOOD (  12.64  )
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

T24gVGh1LCBEZWMgMTksIDIwMjQgYXQgMTE6MDTigK9QTSBXb2xmcmFtIFNhbmcKPHdzYStyZW5l
c2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiBBIHR5cG8gbWVudGlvbmVkIEkzQyB3
aGVuIGl0IHNob3VsZCBoYXZlIGJlZW4gSTJDLgo+Cj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBT
YW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KClJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
