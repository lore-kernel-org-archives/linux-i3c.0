Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D5E77188
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2025 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNl85FBjna0CmFy928bfLEF7AfEDXTkV5+KMFWjuEzQ=; b=ramtsVydBBcWkN
	dLj/kiS2ao289qioOFxTHYGKWhpXqXWb7otfR/HkQCOkvnlmuXvvqnCtKuhsGeQtwfDyrBpEWzd5O
	+URt0NFbwpiT0TSVCepgm4YXjnf7f8IEZusR/5pNQ19OEgBCRFq3RaaadJYAOU3BEL3YS+G2vvYOE
	+YKcl+hwUE8/gKKbl2wI038cTOBj4x/EgJrMQYlstW0MQCozLEsvYseM9BG/K0DFGVjvX35uC58N1
	OITm3ExyIo26C2IDyPirXxUuAQQyYnEhYPX5rEJpi6Wxj89czR+4XmgZu0xcbaR0579eIKhorWJOA
	qA5GmTZNs58Pv5u9S0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHVS-0000000A2cX-2fT9;
	Thu, 02 Jan 2025 09:28:42 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHVP-0000000A2br-2EPy
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 09:28:40 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51873e55d27so6275838e0c.1
        for <linux-i3c@lists.infradead.org>; Thu, 02 Jan 2025 01:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810117; x=1736414917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy4MplfV+og+W/GGufNnlxz4RMQ0TqsPXU7LAAw3hCo=;
        b=UxphKIeDFW8zpF05yww36tGPnywZivvnBzi6vhfZ4S6TsXfSfmwqE9S8pJPXaKNGBf
         bf70iGYdO09JYSwiNks4Lde0wSLvlbd/CZAxb1dL5TEq8in8OcJeRgCMoLpn7+W41Qev
         rJYyqYL2gv2q9/78uG7aGWmZ8El4C+mMx/WTsoeWXXuc3K501zUEN3wyDOdQW1e/9B72
         IAWfC++Jz7MOoVndD1MjoI7Wtchl1XRXMuHChz7av6yjWmFjOHcksCm8wSdwlponAo4u
         fOc56NZg1CSBOzv0mMU/h5IuEsMeqY4DnpsLuyNBNurolWWrKJn3LAaR0T48xuX8KEJ7
         3wIw==
X-Gm-Message-State: AOJu0YwSUOBboI2Mlou9wNsPSXdLIrE+7xijA0SadbKZhVSwXefq0+QO
	Qsjo0SM16KnoM2h6yIrkF4yZglKDsZK0p6CIK5+UENvCVCzm7rd29turKr1T
X-Gm-Gg: ASbGncuYBQl31U9SuIbPt27FOyLdLgTcpTfN5hOpiHERBMLdTjuK1PQuqdH/9hXSeOY
	hvkUOYxfkRk8jufY+kTwhO0MpoysO2jDAWSqK4877h365sG4eJoZPTdMR4pJ4I4TLACrMRdfgsc
	1z24OXT+LyIprwWdpexz2Il1wgqUeVv4RLZEVhIHBUvHccvuYqsPedHOpf3tk3CDGvCTEfYROBZ
	rf8pfY0gpZJCp0PwZNc9qcdfBVz6iz3/nV1B29hQoQVVgQ9bD5pW4bhJuvjbuUWr7tHJ13tdA/G
	JNRS11Ng2uA8oXIkapg=
X-Google-Smtp-Source: AGHT+IELt13uYPhg/aftTEeFuEx9O8ttmH4uxMA1bB045NPcDihMdOWyBICwjbAn6LfOaBIzNVaU5Q==
X-Received: by 2002:a05:6122:320d:b0:517:e7b7:d04b with SMTP id 71dfb90a1353d-51b64c0534bmr39477038e0c.5.1735810114390;
        Thu, 02 Jan 2025 01:28:34 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d0a99esm3026602e0c.48.2025.01.02.01.28.33
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:28:34 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff04f17c7so6992242137.0
        for <linux-i3c@lists.infradead.org>; Thu, 02 Jan 2025 01:28:33 -0800 (PST)
X-Received: by 2002:a67:ebd5:0:b0:4b2:bc6b:c73c with SMTP id
 ada2fe7eead31-4b2bc6bc807mr30504193137.6.1735810113772; Thu, 02 Jan 2025
 01:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com> <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
In-Reply-To: <Z3ZWt0Whyppr6GKX@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 10:28:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
Message-ID: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_012839_566052_BE839B97 
X-CRM114-Status: GOOD (  18.29  )
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

SGkgV29sZnJhbSwKCk9uIFRodSwgSmFuIDIsIDIwMjUgYXQgMTA6MDTigK9BTSBXb2xmcmFtIFNh
bmcKPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiA+ID4gICAgICAg
ICAvKiBSUjBbMF0gPSB+WE9SKGFkZHJbNjowXSkgKi8KPiA+ID4gLSAgICAgICBpZiAoIShod2Vp
Z2h0OChhZGRyICYgMHg3ZikgJiAxKSkKPiA+ID4gLSAgICAgICAgICAgICAgIHJldCB8PSAxOwo+
ID4gPiArICAgICAgIHJldCB8PSBwYXJpdHk4KGFkZHIgJiAweDdmKSA/IDAgOiBCSVQoMCk7Cj4g
Pgo+ID4gUGVyaGFwcyBrZWVwIHRoZSBpZigpLWNvbnN0cnVjdCwgdG8gYmV0dGVyIG1hdGNoIHRo
ZSBleGFtcGxlIGluIHRoZQo+ID4gZG9jdW1lbnRhdGlvbiBpbiAxLzU/Cj4KPiBDYW4gZG8sIGRv
bid0IGNhcmUgc3VwZXIgbXVjaC4gSSBjaG9zZSB0aGlzIGNvbnN0cnVjdCBiZWNhdXNlIHRoZSBv
dGhlcgo+IGRyaXZlcnMgaW4gSTNDIHVzZSB0aGUgYWJvdmUgcGF0dGVybi4gWW91IHN0aWxsIGxp
a2UgdGhlIGlmKCkgYmV0dGVyPwoKTGV0J3MgYWRkIG1vcmUgYmlrZS1zaGVkZGluZyBpbiAyMDI1
IDstKQoKVGhlcmUncyBhbHNvIGEgZ2VuZXJhbCBkaXNsaWtlIGZvciB0aGUgdGVybmFyeSBvcGVy
YXRvciAoQlRXLCBJIGRvCmFncmVlIGl0IGhhcyBpdHMgdXNlcyksIGVzcGVjaWFsbHkgaWYgb25l
IG9mIHRoZSBwYXRocyBpcyBhIG5vLW9wLApsaWtlIE9SaW5nIHdpdGggemVyby4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
