Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3485DC531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=108KI4H/pMI7v9nMIQCLsOP5WseR78XeHPmUNcKCsPo=; b=EYwclNaZZ/0nUT
	N0pH+ZmMWGpWSZA03p1o+Uske70TxMS1PkQxdzRuDDObuPlwcJ7M9EZPZkA87i18paUwGbjGGo1Ab
	/CMnVYoUcUCrhpkWsM2+B1FMGrOkaG1UfADr2WPO/Idx+8pK4aRYuUTripLyHY++33AqzTrnrhJ3A
	Y7LD+4zTK4Va1WC8YEgPcC5etrHko3ochJfCuKXRU3i966vS3m6cY4qLJUxx+bZ/ii1EXoHby/nar
	DlTsITWw4fVImQJWo33B85i24wU2viCQ5XUdYf9MxgLUOmedHrBqEhPHfbDiJXcu2vvS826UM80Xx
	3B7hQGRziKCxhC6nFyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWva-0000000HUyX-3ilV;
	Fri, 23 Aug 2024 16:14:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWu4-0000000HUPs-375c
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:12:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ACAD20002;
	Fri, 23 Aug 2024 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RDjhAQo3WCpUKDsGB4htnl2osRW4XTn8+QqEKONfNs4=;
	b=NK6v0whUOddYl9xAAfEd3KnwdBOmT3vPekcBvzUKHznswzXbAr2AOi6v6pk2AxfOiFDn0V
	KHCAFKHqy/ljW11gjMQIzNhcv7OEbBJnaV32gwYkv+YrXftNkQMG7RCsDhbn+FNm8l3H/I
	oO+UNb5Si+srY/9NgWkfHLeW1IfQc3wiwygCWaYUXR/+ZagqoT6fALWhp4NofRvnFtmcop
	yXCxP7n/EieK7KkkRZPY8RRl5oyA1AT0XRSj1eL94XeDWHyG2zxeQPRAMCwHTT4JixxndM
	7r8WoL/Blk4sXCbJYF5EgvokVss31dy5eVbVgN1bzl08cyqmS7ec4l38MO4/eA==
Date: Fri, 23 Aug 2024 18:12:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 08/11] i3c: master: svc: need check IBIWON for
 dynamtica address assign
Message-ID: <20240823181241.37c399d9@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-8-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-8-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091245_405315_AEE7C080 
X-CRM114-Status: UNSURE (   6.94  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDI6MDIgLTA0MDA6Cgo+IFdoZW4gc2VuZGluZyBSRVFVRVNUX1BST0NfREFBLCBlbWl0IFNUQVJU
IGFuZCBhZGRyZXNzIDdFLiBBZGRyZXNzCj4gYXJiaXRyYXRpb24gbWF5IG9jY3VyIGF0IHRoaXMg
dGltZSBpZiBvdGhlciBkZXZpY2VzIHRyaWdnZXIgSEosIElCSSwgb3IKPiBDUiBldmVudHMuCj4g
Cj4gV2hlbiBJQklXT04gaGFwcGVuIGF0IFJFUVVFU1RfUFJPQ19EQUEsIG5hY2sgSUJJIHJlcXVl
c3QgdGhlbiB1c2UgcmVwZWF0CgoJCSAgIGR1cmluZyBhCQlOQUNLIHRoZQkgICAgIHNlbmQgYQoK
cmVwZWF0ZWQgc3RhcnQKCj4gc3RhcnQgdG8gY29udGludWUgY3VycmVudCBkeW5hbXRpY2EgYWRk
cmVzcyBhc3NpZ24uCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgID8KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
