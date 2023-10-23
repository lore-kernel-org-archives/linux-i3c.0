Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC8CC25B46
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Oct 2023 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sio+0+5O3sINVB30Ii/BEig3tQpuioz9PujPUunGSUE=; b=O2mSzsarCkWzu1
	JMBiqYRueGHnszqRWeNA235+ruloQ3BS1c6L2Dry9LYlHfUZ33SL3BTUig+rNBaGQk49BZq/GtCSU
	+llRmgm9TzqGsQ7vtjwhzsBb6ngNA22SzvTwfvZ6wnwfK9UyVLq2g2zK9iY7z5DEHt0KpbDjKuUuT
	fJvYtlL3YLVEHh1LbA0sLkwdInf6M7RhbDQC6Ee+Uv+E2lWqCqB/3Mk0m7szryiwlIRhR92K8EEDN
	DmoC+inW9JupMS6fuy8dU5I7g+XDFip+D6fVgLir+uwv1/EbFdvbbSXDV7HhGkN+2W/gqQJW1stg2
	qwaHpMlIN2+CJ0c6LS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv0Jy-0089Wu-04;
	Mon, 23 Oct 2023 19:10:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv0Jv-0089W8-1K
	for linux-i3c@lists.infradead.org;
	Mon, 23 Oct 2023 19:10:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBC2940006;
	Mon, 23 Oct 2023 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698088231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQTqFxA2htUn59dyviXFE3afEYPNmc6FuT7Pc/5oDXo=;
	b=VfH2RE8fu683n82J63fAWnyh0YZCsIKYktyJuucgqGBGaWQPg5j+AZjEi8ci0on++E8J9G
	dZVeeNTfESapIOvknDZCI7ObRjEfDo07U7oFh752U3lhkS2j62PgqRUAxEdW3qC9n1XygC
	QzsSCYYK6nkRLs61j00m83eE/c8PEgZff6DCS7pRK1ov1/WMdLO69S10bQZgr5v4zE0CFZ
	uTwXkFVnrMPvsDbk1e2yUgWpSpy01s5iJbgZ8Vpb7pSDACu39S9AFdP82lhgYsf55cqdXT
	U3ZFtzbjaNHJRCRJL/eveRMBEq42GpDxtQvQdEcPw2IDZVZc5EPFgENxrXIKeg==
Date: Mon, 23 Oct 2023 21:10:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] i3c: master: svc: fix random hot join failure
 since timeout error
Message-ID: <20231023211028.3a4613df@xps-13>
In-Reply-To: <20231023161658.3890811-7-Frank.Li@nxp.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
	<20231023161658.3890811-7-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_121035_743121_28482B88 
X-CRM114-Status: UNSURE (   8.63  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMjMgT2N0IDIwMjMgMTI6
MTY6NTggLTA0MDA6Cgo+IG1hc3RlciBzaWRlIHJlcG9ydDoKPiAgIHNpbHZhY28taTNjLW1hc3Rl
ciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBj
NywgTUVSUldBUk4gMHgwMDEwMDAwMAo+IAo+IEJJVCAyMDogVElNRU9VVCBlcnJvcgo+ICAgVGhl
IG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hl
bjoKPiAgIC0gVGhlIFRYIEZJRk8gb3IgUlggRklGTyBpcyBub3QgaGFuZGxlZCBhbmQgdGhlIGJ1
cyBpcyBzdHVjayBpbiB0aGUKPiBtaWRkbGUgb2YgYSBtZXNzYWdlLAo+ICAgLSBObyBTVE9QIHdh
cyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gICAtIElCSSBtYW51YWwgaXMgdXNlZCBh
bmQgbm8gZGVjaXNpb24gd2FzIG1hZGUuCj4gICBUaGUgbWF4aW11bSBzdGFsbCBwZXJpb2QgaXMg
MTAwIM68cy4KPiAKPiBUaGlzIGNhbiBiZSBjb25zaWRlcmVkIGFzIGJlaW5nIGp1c3QgYSB3YXJu
aW5nIGFzIHRoZSBzeXN0ZW0gSVJRIGxhdGVuY3kKPiBjYW4gZWFzaWx5IGJlIGdyZWF0ZXIgdGhh
biAxMDB1cy4KPiAKPiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRk
IFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpSZXZpZXdlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlx
dcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
