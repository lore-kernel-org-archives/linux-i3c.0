Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16FBFEFB6A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoComTBwkMsExdyhWswSzWTQ5Kg+PckMMK80Mceyr+w=; b=Hu/5KTjvMSeNne
	Rci7xXlSMUKS7pLmlJZm5cZBzGO2FOOSMplUmB3e2Th1veqQZ5vi3JB+dOMMNMvHvmW+kyy3g9erX
	f0MKQ9u/GQJ/iI6xOH3HAUWIfVfJx5Puo8TQ5i8riPxMerXykcNt8eyWZvjV4IALGjRQ1h7PPm6jU
	mJLrXuJLZfd3lLDdO35rI/blRIlYVVmaMIMEjkYtNQEq699pmLtDj7c9UtHIpzNPvBlQnp6hYExH8
	EWEAKja+hqYWjxRNhFD6nayuJDkNjLE/pAxfR0eatCng652Ys09wB7dfdnja/pIvRNc7pHsGOgSUo
	1hpI5g1K1Q9hYXmP5hmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0KB-00000008i2s-1uLh;
	Fri, 27 Feb 2026 16:04:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0K9-00000008i2N-1Ikw
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:04:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so2223372f8f.3
        for <linux-i3c@lists.infradead.org>; Fri, 27 Feb 2026 08:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772208255; x=1772813055; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DRZphY/3exWOzWZdEB1ys0d2atmkXHj+DiQYknH1Jjw=;
        b=C3pUHFgw0A0D2fWW2n0YUowqN/f1CDg6pBiDKHdEMlhIwE2Q8cq6Dcg36F5ZZSHiUl
         sJBpbTHUoH7RjEZc1ukfmHrO+xx1dxdaQrhtE72gzzyuQ2OAfaUb+780tGjW7hkhguQF
         MLeP8CTiACNei5KV13EljyeMGjGIpvqflpPRKn3iNHLFT6XRx/C+0e+fIanPna5j3TsH
         h7yoXcRaCzwUDMRqdUjSGNhqxZny6AGBL3iNt3d2Edu8AXL8Sa2AnUqhMTAvlaGYoS2D
         aRY2wEIRYlP7slQ1MZD/eZnbpwxcyt8CzwY1MtwPVd3dYVpR2cYY5cQKDyUBJhiH8j1l
         6ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772208255; x=1772813055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRZphY/3exWOzWZdEB1ys0d2atmkXHj+DiQYknH1Jjw=;
        b=UJWHk/SKiqzFZ86izNAACGlrMBuy13I2pEU72mltSVxj4W1XAEsx5qcZlPGFUAN8mD
         u9sj2+RHzL17b1JW5GyU5eQK9Sk2Tl3C5wSCTTStsR4HWKW4T5Z4IP5aozdQp4n9lpou
         38UVPprziPgawCJxCxxzaFGa3fESDKgedIPgkxpKRl+xUq7CTtZKQnk/hHMlfnLfXhuI
         im++aBG+VraQS0RrEdCfxpUjdH8LpfubjlCkQEdb6IO8vGbqQFFxeVAKkLHZYJIzcIl2
         iWvOyTzNgb5AVwqhw46dcNibiXnSRuDPeVjgOTyniwPo75JQdDLpiI7+ZMz5wCyx+V4e
         k9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnRg65j5RzBaPraSjsdEcZEA9rSop6teTBRRRbz5QmI9IiMiPtok6oIuqUpuT8Ty7agMQFSGvyKMU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxakCfnqRqaCK65lnIINzr2plGoJtj8z4nto9icVB0Nt3i/I3P2
	uAQxDpORaymRRmGGt9BN0Uu4z6N8YlshXQqu1hXyR1+ER2RAtR5hxfTE
X-Gm-Gg: ATEYQzyi5fDbwhQjzvN60mazQ3tUTtVhu6fs1H1Iq8IKY5Bd7teKhNdIN9lxjtPd0Yy
	wfZBlbZy/Q0pEtbBBQFa4WMCZNEkSa0yw5/+WjzwlqDudUk8UcGM4xQ47mWmfcl2r9Yxhl4bUuK
	CJP/zwxyAGZ167poAxYfF1ccWtw2rvU2NODMp6crQzrEQDpIoFgdY8exsTNXEuGSDcnglZjkmWo
	SXEU3lv8bNGyBtdyQmOReZlhQ443AYJWlDJz8gVJRTtg0silV67YmEezZ4pwCFdxQErmeBdPNbU
	BTSo5nDu8senYs9HVimowdm9n0WwNw8vGzcVCXDC6mL0UjXt8tnebQY9V1r7DBZwm56m+SS5KB3
	6ydkcIy9keBXeDG3WFtduLpVA+g1iZqglcQMs46kT/dx2m8GH/qO5pqMDs8QWXdU0CYD5wjOpWj
	34BHpMzxYfIWQ8E8dRvBDh+RG1GSOFdA0=
X-Received: by 2002:a05:6000:1a8c:b0:437:6e6e:6f95 with SMTP id ffacd0b85a97d-4399de1c60emr5923899f8f.27.1772208248739;
        Fri, 27 Feb 2026 08:04:08 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a0f6sm9109299f8f.22.2026.02.27.08.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:04:08 -0800 (PST)
Message-ID: <0f87effdbe7d8ac352249a6487efb5efa40156ea.camel@gmail.com>
Subject: Re: [PATCH] i3c: dw: Use more common code in
 dw_i3c_master_i2c_xfers()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-i3c@lists.infradead.org, 
 Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li	 <Frank.Li@nxp.com>, Fredrik
 Markstrom <fredrik.markstrom@est.tech>, Ivar Holmqvist
 <ivar.holmqvist@est.tech>, Jorge Marques <jorge.marques@analog.com>,
 Manikanta Guntupalli	 <manikanta.guntupalli@amd.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Zilin Guan <zilin@seu.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, Aniket <aniketmaurya@google.com>, 
 Jianhao Xu <jianhao.xu@seu.edu.cn>
Date: Fri, 27 Feb 2026 16:04:52 +0000
In-Reply-To: <2411a872-5bf5-4353-a754-47fa54d69c46@web.de>
References: <2411a872-5bf5-4353-a754-47fa54d69c46@web.de>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_080417_363154_812F5827 
X-CRM114-Status: GOOD (  14.94  )
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDExOjIwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiBGcm9tOiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4g
RGF0ZTogRnJpLCAyNyBGZWIgMjAyNiAxMDoxNjo1MCArMDEwMAo+IAo+IFVzZSBhbiBhZGRpdGlv
bmFsIGxhYmVsIHNvIHRoYXQgYSBiaXQgb2YgY29tbW9uIGNvZGUgY2FuIGJlIGJldHRlciByZXVz
ZWQKPiBhdCB0aGUgZW5kIG9mIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
Pgo+IC0tLQoKVGhpcyBhY3R1YWxseSBsb29rcyBsaWtlIGEgZml4IHRvIG1lLiBJdCdzIG5vdCBq
dXN0IHJldXNpbmcgY29tbW9uIGNvZGUuCgotIE51bm8gU8OhCgo+IMKgZHJpdmVycy9pM2MvbWFz
dGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDcgKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMKPiBpbmRleCBkODdiZGUzZjc3MDAuLmJlYjQwZDk0N2U2ZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
L2R3LWkzYy1tYXN0ZXIuYwo+IEBAIC0xMTEzLDggKzExMTMsNyBAQCBzdGF0aWMgaW50IGR3X2kz
Y19tYXN0ZXJfaTJjX3hmZXJzKHN0cnVjdCBpMmNfZGV2X2Rlc2MgKmRldiwKPiDCoAkJZGV2X2Vy
cihtYXN0ZXItPmRldiwKPiDCoAkJCSI8JXM+IGNhbm5vdCByZXN1bWUgaTNjIGJ1cyBtYXN0ZXIs
IGVycjogJWRcbiIsCj4gwqAJCQlfX2Z1bmNfXywgcmV0KTsKPiAtCQlkd19pM2NfbWFzdGVyX2Zy
ZWVfeGZlcih4ZmVyKTsKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZnJlZV94ZmVyOwo+IMKg
CX0KPiDCoAo+IMKgCWZvciAoaSA9IDA7IGkgPCBpMmNfbnhmZXJzOyBpKyspIHsKPiBAQCAtMTE0
NCwxMCArMTE0MywxMCBAQCBzdGF0aWMgaW50IGR3X2kzY19tYXN0ZXJfaTJjX3hmZXJzKHN0cnVj
dCBpMmNfZGV2X2Rlc2MgKmRldiwKPiDCoAlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91
dCgmeGZlci0+Y29tcCwgbS0+aTJjLnRpbWVvdXQpKQo+IMKgCQlkd19pM2NfbWFzdGVyX2RlcXVl
dWVfeGZlcihtYXN0ZXIsIHhmZXIpOwo+IMKgCj4gKwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZChtYXN0ZXItPmRldik7Cj4gwqAJcmV0ID0geGZlci0+cmV0Owo+ICtmcmVlX3hmZXI6Cj4gwqAJ
ZHdfaTNjX21hc3Rlcl9mcmVlX3hmZXIoeGZlcik7Cj4gLQo+IC0JcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQobWFzdGVyLT5kZXYpOwo+IMKgCXJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiAtLSAK
PiAyLjUzLjAKPiAKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
