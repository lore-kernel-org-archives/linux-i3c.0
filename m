Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60752C87FC9
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXnmWt3VM9LkLjDGrOzK0g3BKzn6gxW30/d1AEWemoE=; b=rLVaGUriR26Pov
	MzRLKBwLLBQn2NkwvvkNfBjQvIkOawytTXQkukpaOarS8Btat+VzFt5sdUPpkI0Nji/EmW8zPliSb
	noFajNX19pm2kGtnoFGkAeycTha/ipRuv2wGQB7lzFLHfvyljsIJ7C3N9pv6EsgqLjYwSrkExSrPO
	UK/5AEIEnLM9xiPBLodw4BpU9A80cAmXWZs0UJyR9KeXRmvuHqVuJd3kUVjleHh5TqG5E128uBJMi
	hZ35IPfByoEPWIfdPNiiEw5DQjM09n4GthyAcAOArz97MwL0fbYpah06cJeVmYHui0ubNKlJEm3C6
	fO9QbM8MG3R5C2iAy8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1j7-00000000wZ4-0cTJ;
	Wed, 30 Jul 2025 07:59:53 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1j4-00000000wYe-1RlT
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 07:59:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3B1D442DE;
	Wed, 30 Jul 2025 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753862385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWLJzoxGMyk+AMMLTL6p1dcK8qNXJLvsTF7DGbZkpKE=;
	b=Z8CNQMtXjH+12nd0PlDVNAXtyanqvVF+Y9slHedmqRJtgi7Lx50e15UAzrNksfoIC7aCdY
	m8JB64gICFyHYeHakRCbTpH3mqkmPKXt77u1pf1AczS6mPx5CjA4sJZkRr+FtLVAogtRm8
	FXgSWVjwfMsoreG86RqcLAZkOr2Ub9KSJdN/3mdaVUT1QX7yVb6HSyYBcOr8oe8e4tbitG
	Llz21TLJZJwBH8f7GH7o2sIFEGZuXjUXY1lLuJfcZZITlHu86+WRDKQmBiSk1GpKCNXzwD
	/moooGGtEtYjiUIl9J4Hr0cvJHrOcyUTD58yIJ5dIP1wjone6W9XgIqjFdn2WQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: frank.li@nxp.com,  alexandre.belloni@bootlin.com,
  linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
  tomer.maimon@nuvoton.com,  kwliu@nuvoton.com,  yschu@nuvoton.com
Subject: Re: [PATCH v3] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
In-Reply-To: <20250730003719.1825593-1-yschu@nuvoton.com> (Stanley Chu's
	message of "Wed, 30 Jul 2025 08:37:19 +0800")
References: <20250730003719.1825593-1-yschu@nuvoton.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 30 Jul 2025 09:59:43 +0200
Message-ID: <87tt2unm6o.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepshhtrghnlhgvhidrtghhuhihshesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehtohhmvghrrdhmrghimhhonhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehkfihlihhusehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohephihstghhuhesnhhuvhhothhonhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_005951_051442_0C1EDC4D 
X-CRM114-Status: UNSURE (   8.06  )
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

SGkgU3RhbmxleSwKCk9uIDMwLzA3LzIwMjUgYXQgMDg6Mzc6MTkgKzA4LCBTdGFubGV5IENodSA8
c3RhbmxleS5jaHV5c0BnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBTdGFubGV5IENodSA8eXNj
aHVAbnV2b3Rvbi5jb20+Cj4KPiBJbiBhIHByaXZhdGUgd3JpdGUgdHJhbnNmZXIsIHRoZSBkcml2
ZXIgcHJlLWZpbGxzIHRoZSBGSUZPIHRvIHdvcmsgYXJvdW5kCj4gdGhlIEZJRk9fRU1QVFkgcXVp
cmsuIEhvd2V2ZXIsIGlmIGFuIElCSVdPTiBldmVudCBvY2N1cnMsIHRoZSBoYXJkd2FyZQo+IGVt
aXRzIGEgTkFDSyBhbmQgdGhlIGRyaXZlciBpbml0aWF0ZXMgYSByZXRyeS4gRHVyaW5nIHRoZSBy
ZXRyeSwgZHJpdmVyCj4gYXR0ZW1wdHMgdG8gcHJlLWZpbGwgdGhlIEZJRk8gYWdhaW4gaWYgdGhl
cmUgaXMgcmVtYWluaW5nIGRhdGEsIGJ1dCBzaW5jZQo+IHRoZSBGSUZPIGlzIGFscmVhZHkgZnVs
bCwgdGhpcyBsZWFkcyB0byBkYXRhIGxvc3MuCj4KPiBDaGVjayBhdmFpbGFibGUgc3BhY2UgaW4g
RklGTyB0byBwcmV2ZW50IG92ZXJmbG93Lgo+Cj4gRml4ZXM6IDQwMDhhNzRlMGY5YiAoImkzYzog
bWFzdGVyOiBzdmM6IEZpeCBucGNtODQ1IEZJRk8gZW1wdHkgaXNzdWUiKQoKU3RpbGwgbWlzc2lu
ZyBDYzogc3RhYmxlIGhlcmUKCj4gU2lnbmVkLW9mZi1ieTogU3RhbmxleSBDaHUgPHlzY2h1QG51
dm90b24uY29tPgo+IC0tLQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
