Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D441EC3600B
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scaxF8O5Zf6eoTXI+nJ2zxUq0ZKX5t/hRnWgBMw5uXY=; b=g7HlEu67/BYag3
	cG/ahzdIRw3WWpqIPOqY/CQmu65KpdV4OiwhsKn+VRX37KBJNS+Fak7v1/3IcBfIUz7rGeFt4O1Oy
	g4ZegkJNnyEk+3Z3fO3/XSTQi4TRXsqMePxBzHfmTwTygr3hBm9a+qDF243D7azJ7ewPOKOCQTZQ7
	vWnBdItNRkZMbQpKiOedgA3CHQo4NEcMAgVQzfY1DDPk9veRFkSHsbK7JIXim9sAslhqfoKnJp72N
	0Sc88LAGrOTU6hO/Im/eQ4ixvLN3DA0KCb+hDTF7mheFoUwFL39ftH7djs9IbWRHYZ3PhCOHeJf1r
	1gixzQCyfsGJ8gj2ltwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0K-0000000005n-2cKA;
	Mon, 31 Mar 2025 10:04:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBgz-0000000HY5m-1k2v
	for linux-i3c@lists.infradead.org;
	Mon, 31 Mar 2025 09:44:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0176843349;
	Mon, 31 Mar 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743414266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1haYXwSDfLoyUzdskKRx546yxBk0+SAnC6Wt/ZsG0Q=;
	b=FevU2XELa05ufzVSvCVRwpM2ooN3CCusOtTsHKdk/4fJkAFc1TicFKMPBOsqm0PrgN3bs1
	XqNQing+Ht1zXLTvWYaRAyPS1/mqTYiW8c7LWGxltD0GnMp1wE2WXmGVYwuzHZXBW6zjq5
	7/0dcV9aMI1mMnNLSpqhxby2GaLFHwsUfpxXiaejSpFTd365FTJBe19c8Hti/P3oC5Gtk5
	gRYiQ9NhUSqUvFhTWsqxvuhIal0Vcm+f1q7gkT94Rvgg3ilycR5ykfuVzOg3tQK1hNLWLM
	Q95PKVWXlezSVs9eKFmojuErpRH0sEqUP6DP5mBF/i9lfgRVDJV1sTJUgrB9Rg==
Date: Mon, 31 Mar 2025 11:44:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org, bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
Cc: rvmanjumce@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v6] i3c: Add NULL pointer check in i3c_master_queue_ibi()
Message-ID: <174341425769.1100556.13422322396999492211.b4-ty@bootlin.com>
References: <20250326123047.2797946-1-manjunatha.venkatesh@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326123047.2797946-1-manjunatha.venkatesh@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeliedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedviefghedvvefhheevjefghedujeekfeeuvdfhgeduffduveehgfdvgeejheejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrt
 ghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhgrnhhjuhhnrghthhgrrdhvvghnkhgrthgvshhhsehngihprdgtohhmpdhrtghpthhtoheprhhvmhgrnhhjuhhmtggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024429_625281_AFCA1D5E 
X-CRM114-Status: GOOD (  10.66  )
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

T24gV2VkLCAyNiBNYXIgMjAyNSAxODowMDo0NiArMDUzMCwgTWFuanVuYXRoYSBWZW5rYXRlc2gg
d3JvdGU6Cj4gVGhlIEkzQyBtYXN0ZXIgZHJpdmVyIG1heSByZWNlaXZlIGFuIElCSSBmcm9tIGEg
dGFyZ2V0IGRldmljZSB0aGF0IGhhcyBub3QKPiBiZWVuIHByb2JlZCB5ZXQuIEluIHN1Y2ggY2Fz
ZXMsIHRoZSBtYXN0ZXIgY2FsbHMgYGkzY19tYXN0ZXJfcXVldWVfaWJpKClgCj4gdG8gcXVldWUg
YW4gSUJJIHdvcmsgdGFzaywgbGVhZGluZyB0byAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcmVh
ZCBmcm9tCj4gdW5yZWFkYWJsZSBtZW1vcnkiIGFuZCByZXN1bHRpbmcgaW4gYSBrZXJuZWwgcGFu
aWMuCj4gCj4gVHlwaWNhbCBJQkkgaGFuZGxpbmcgZmxvdzoKPiAxLiBUaGUgSTNDIG1hc3RlciBz
Y2FucyB0YXJnZXQgZGV2aWNlcyBhbmQgcHJvYmVzIHRoZWlyIHJlc3BlY3RpdmUgZHJpdmVycy4K
PiAyLiBUaGUgdGFyZ2V0IGRldmljZSBkcml2ZXIgY2FsbHMgYGkzY19kZXZpY2VfcmVxdWVzdF9p
YmkoKWAgdG8gZW5hYmxlIElCSQo+ICAgIGFuZCBhc3NpZ25zIGBkZXYtPmliaSA9IGliaWAuCj4g
My4gVGhlIEkzQyBtYXN0ZXIgcmVjZWl2ZXMgYW4gSUJJIGZyb20gdGhlIHRhcmdldCBkZXZpY2Ug
YW5kIGNhbGxzCj4gICAgYGkzY19tYXN0ZXJfcXVldWVfaWJpKClgIHRvIHF1ZXVlIHRoZSB0YXJn
ZXQgZGV2aWNlIGRyaXZlcuKAmXMgSUJJCj4gICAgaGFuZGxlciB0YXNrLgo+IAo+IFsuLi5dCgpB
cHBsaWVkLCB0aGFua3MhCgpbMS8xXSBpM2M6IEFkZCBOVUxMIHBvaW50ZXIgY2hlY2sgaW4gaTNj
X21hc3Rlcl9xdWV1ZV9pYmkoKQogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2FiZWxsb25p
L2MvYmQ0OTZhNDRmMDQxCgpCZXN0IHJlZ2FyZHMsCgotLSAKQWxleGFuZHJlIEJlbGxvbmksIGNv
LW93bmVyIGFuZCBDT08sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
