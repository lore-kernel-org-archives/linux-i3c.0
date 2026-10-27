Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF0C606A31B
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+YjVgak;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UuR7/ceK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ew+M81A7s2ZG7qmvCkoEcR2/mTCTJMu8RPvy0KJh4hE=; b=4+YjVgak24b/44T8PEiQmupT22
	8CIZUxiRBhuseNIDE9YC40uRrRL0gQJO1tevAmP1GAI30GhKkGz2GXvN/AblVDqquo3bnubyAVzuG
	hRCYd23ajs9CQd3YxeEunRR7u/bqk6wNZGBhMLZvdmfOnPwf5QnsIJJx/e4+vLd4CBdSYDfeduYRc
	EAkfpfffvHpYo2ZbhRVNAEa39RXL1/IHQ5bfD34YSIOyCxnQEQ800XJI4wUeTm5zvvSSMc4y5wQ2Q
	47+9NOiJK59KCs/4ryV1s7TF0t3I+DWNjsiZChtmdNjBrw+KeexTn07AmIX0vYRinF1vaWHeZTvWf
	kkM/1sNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdDq-000000048RP-2T5w;
	Tue, 27 Oct 2026 09:11:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdDn-000000048Oy-1BhJ;
	Tue, 27 Oct 2026 09:11:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE9BCC5846F;
	Tue, 27 Oct 2026 09:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E838603BD;
	Tue, 27 Oct 2026 09:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C36211032904F;
	Tue, 27 Oct 2026 10:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793092309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=T79Dr75s1wvEXUoDZaE7cn4PwcHACPes5COGJi8oy7U=;
	b=UuR7/ceKR3WvRHfZBPIedxhdV4OfAZXNIaXp3g8W7wt1efy1uoDsg0DMZTk5cRNDiNtala
	Omvkg8mIONIePJs1AXs12/YATeNT0fD5h/EXQZicnjbXevpQ2CpHVhz/8haGqX0ZlIo+JA
	EG6OC5DHxEGXP9hOB3ylx3BkmW4u5czjzb4XHEq4dL9KXjgmT9wjq8veuW4iAgbI/Q6kOE
	Tq92N6JhK2VGV1QVFyN8UjliNVqXShOUtGsP3SZLgsFopKDji/FB71MDawONogQloIyLEt
	h9rUVj8ZpDSYFZlyEq+sOxwNupUnHhkapAE3hbDZlc4ft2t38vmFeyK1r2tU1Q==
Message-ID: <42d26a0b-c517-4fc5-8d19-e0b7c4506cbf@bootlin.com>
Date: Tue, 27 Oct 2026 10:11:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] dt-bindings: pinctrl: berlin: Support Synaptics
 SL261X SoCs
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti
 <andi.shyti@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-14-jszhang@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260929061417.20733-14-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_021155_488950_A414A80B 
X-CRM114-Status: GOOD (  12.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TGUgMjkvMDkvMjAyNiDDoCAwODoxNCwgSmlzaGVuZyBaaGFuZyBhIMOpY3JpdMKgOgo+IERvY3Vt
ZW50IHRoZSBkdC1iaW5kaW5ncyBmb3IgcGluY3RybCBpbiBTeW5hcHRpY3MgU0wyNjFYIFNvQ3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+
IC0tLQo+ICAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvbWFydmVsbCxiZXJsaW4yLXNvYy1waW5jdHJs
LnlhbWwgIHwgMTAgKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWFydmVsbCxiZXJsaW4yLXNvYy1waW5jdHJsLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tYXJ2ZWxsLGJlcmxpbjIt
c29jLXBpbmN0cmwueWFtbAo+IGluZGV4IDZhY2UzYmY1NDMzYi4uZmI2MGEzMTBhMjRlIDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21hcnZl
bGwsYmVybGluMi1zb2MtcGluY3RybC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWFydmVsbCxiZXJsaW4yLXNvYy1waW5jdHJsLnlhbWwKPiBA
QCAtMzcsNiArMzcsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgIC0gbWFydmVsbCxiZXJs
aW40Y3Qtc29jLXBpbmN0cmwKPiAgICAgICAgICAgICAtIG1hcnZlbGwsYmVybGluNGN0LXN5c3Rl
bS1waW5jdHJsCj4gICAgICAgICAgICAgLSBzeW5hLGFzMzcwLXNvYy1waW5jdHJsCj4gKyAgICAg
ICAgICAtIHN5bmEsc2wyNjF4LXNvYy1waW5jdHJsCj4gKyAgICAgICAgICAtIHN5bmEsc2wyNjF4
LXN5c3RlbS1waW5jdHJsCj4gICAKPiAgICAgcmVnOgo+ICAgICAgIG1heEl0ZW1zOiAxCj4gQEAg
LTQ0LDggKzQ2LDEwIEBAIHByb3BlcnRpZXM6Cj4gICBhZGRpdGlvbmFsUHJvcGVydGllczoKPiAg
ICAgZGVzY3JpcHRpb246IFBpbiBncm91cCBjb25maWd1cmF0aW9uIHN1Ym5vZGVzLgo+ICAgICB0
eXBlOiBvYmplY3QKPiAtICAkcmVmOiAvc2NoZW1hcy9waW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwj
Cj4gLSAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICsgIGFsbE9mOgo+ICsgICAg
LSAkcmVmOiAvc2NoZW1hcy9waW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwjCj4gKyAgICAtICRyZWY6
IC9zY2hlbWFzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbCMKClRoZSBzcGVjaWFsIHZhbHVlIGJp
YXMtcHVsbC11cD0yIGlzIGhhbmRsZWQgaGFzIGEgc3Ryb25nIHB1bGwtdXAgaW4gdGhlIApjb2Rl
LCBtYXliZSB0aGF0J3Mgc29tZXRoaW5nIHRoYXQgbmVlZHMgYSBkb2N1bWVudGF0aW9uIGluIHRo
ZSBiaW5kaW5nCihvciB0aGUgc3Ryb25nIHB1bGwgdXAgdmFsdWUgaXMgcmVhbGx5IDIgT2htcywg
YW5kIGluIHRoaXMgY2FzZSwgCmV2ZXJ5dGhpbmcgaXMgb2spCgo+ICAgCj4gICAgIHByb3BlcnRp
ZXM6Cj4gICAgICAgZ3JvdXBzOgo+IEBAIC02MCw2ICs2NCw4IEBAIGFkZGl0aW9uYWxQcm9wZXJ0
aWVzOgo+ICAgICAgIC0gZ3JvdXBzCj4gICAgICAgLSBmdW5jdGlvbgo+ICAgCj4gKyAgdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiAgIGFsbE9mOgo+ICAgICAtIGlmOgo+ICAgICAg
ICAgcHJvcGVydGllczoKClJlZ2FyZHMsClJpY2hhcmQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
