Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D71CC7113B
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Aug 2023 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/tzfGKPi9qflF14InmTmX0T24pX3PIF+uVFJ2OOhc0=; b=sUIbUnl0xPM4g7
	iJOmFY9rdd3rxXmrajz6RHAAnyHoAgt7Wc9T/9vQuWz2Ugbnmk/8v9Hgg6Kvp2UBURy7xuGTD6QNi
	1GAZH4rGN+CozJjAEVzRRSJONhyxerpCJnrjQnzP4UCKxoz14v/xEbJ68aRmbL9rC8VvqQIUucnV6
	Yrv0BgBAJiyK3+J1G4rJMjZUlKGFGSOwcvU8XVPIZXmshrjw+lRuj/V1PcP0n1mSQJEUpMfPHmkRx
	s0UPwwatXyg1a3GHHUBUnfRyiojKEL9LUsSK/DrFVk2ga2DJPy/SYzwbz04yCcVRLKXUDZyQJDBx9
	FNqkn946vRkVPWUykqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Mv-002VsF-2y;
	Thu, 24 Aug 2023 08:07:05 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Ms-002Vq8-0I;
	Thu, 24 Aug 2023 08:07:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A58C56000A;
	Thu, 24 Aug 2023 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692864415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iy90UPBEpYr9Ks6Pdn0quIrhraOkWjQhbq0wpTYDBM=;
	b=XizArq1AmE8u1PlEKB4g8NjhXu0zjN5QFi79zW24HbCXBErrvogWggSj9arbq+KhrFKB+O
	uNFRNoDum6eiw6b1FusyrSJGtFu52oxgQ2aZxvU94bbYQ6VeF6C6+aaiIjsvth2eXnzCxv
	fG9eW8n1Z7MjHVpGZKNTWsEMTPK6e/12/dzQCGsxQ9uVm1S5ddD2cTGo7DkevkDqa3KU8H
	w1ZbBKh6080wCbuer4WK7KK05Jg/bzrwy8FVePWax3FVuMu3JvmQ+yeRvZQEooNr0+hv60
	bNmbWEfq0tXu55UOuMr9+VZp+jY7MAOxARwAMNEhCJ6ymjR+mtZvO+UxG0Uu9Q==
Date: Thu, 24 Aug 2023 10:06:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Emil Renner
 Berthing <kernel@esmil.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Ulf Hansson <ulf.hansson@linaro.org>, Richard
 Weinberger <richard@nod.at>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, M ark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Bart Van Assche
 <bvanassche@acm.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <20230824100648.5b6e8b70@xps-13>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
References: <20230823183749.2609013-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_010702_444998_FDA2E66F 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMjMgQXVnIDIwMjMgMTM6Mjg6
NDcgLTA1MDA6Cgo+IENsZWFudXAgYmluZGluZ3MgZHJvcHBpbmcgdGhlIGxhc3QgcmVtYWluaW5n
IHVubmVlZGVkIHF1b3Rlcy4gV2l0aCB0aGlzLAo+IHRoZSBjaGVjayBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+ICMgZm9yIG10ZAoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
