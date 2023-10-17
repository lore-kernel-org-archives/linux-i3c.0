Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C50CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Egajf/R2A77MzcSVUc4ODzcyuvXDBzdbSpDfXM0DzoA=; b=rjHPhHQTDqMF7c
	xWeiVkQVr1kEHlgAewsNWXho9H4S5qcbG056WbP6nCWNY9SAdoSAkw+V0+CKxoSWNemTThTWqWOiv
	00FHedVXcAu/8Crqu1CFjZeX/v3EhA/tI+UaulbfyUCh5RLMjdllHBkfPZIkWe6sMs1MblrzLBZpS
	c5iy++/Yeg+1PgDN9tXaJJPXMvK4NytUHBtFfgDJgWzcopZxcxoOJ292OqU6BGiv304s/UnWr4a6M
	epx3lFnKOWAWJMX+hG/8SGVtPJ63IQpFdSMcYpPMYtQan6HqMH9eERPa6OxFyk6rgNzWU70r9u0bh
	KQ2HtJ8NE7ApijSs1anA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsksc-00CVa5-0p;
	Tue, 17 Oct 2023 14:17:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsksY-00CVYu-2u
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:17:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4569D1BF206;
	Tue, 17 Oct 2023 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzWYE5zWxR4YaYmFe+0XGWID7PzfYYmmrvNow3aY3S8=;
	b=YRgT2TIESp421HGFWArNrytq/Jl2NLfZZUDtPgsnpvAXKMgNPOn644HqVy/S7h/WBrZpCl
	gP3ZJ9sR0xFF6u/yJ5tIsFdO3zTMxGsYXZCfap+NHZQcfuF9fcyBfmI4ucniHIRDIXmwr6
	afJk1w1IXCYYvuA7PmHq5yHmdxQP3/++Lfgm4X7vgu0fCuAgNak27fJKgnWsfVgYc8zkM9
	JSyq+NCIKjQnhbWjS1TuOeYQdyf9Fdt8SDeYsqhcPUiRclkZYDPFCxba7Can1G13X1cEQk
	0466Xg/zkf7/AvLO3xRi+iiseuh9MPORjWcCohrv00/N1TUbMaDqGi3w3sqn7Q==
Date: Tue, 17 Oct 2023 16:16:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017161658.2de6d9f3@xps-13>
In-Reply-To: <20231016153232.2851095-2-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_071703_081263_B7E33A95 
X-CRM114-Status: UNSURE (   6.42  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTE6
MzI6MjcgLTA0MDA6Cgo+IFRoZSBpYmkgd29yayB0aHJlYWQgb3BlcmF0ZXMgYXN5bmNocm9ub3Vz
bHkgd2l0aCBvdGhlciB0cmFuc2ZlcnMsIHN1Y2ggYXMKPiBzdmNfaTNjX21hc3Rlcl9wcml2X3hm
ZXJzKCkuIEludHJvZHVjZXMgbXV0ZXggcHJvdGVjdGlvbiB0byBlbnN1cmUgdGhlCgpJbnRyb2R1
Y2UKCj4gY29tcGxldGlvbiBvZiB0aGUgZW50aXJlIGkzYy9pMmMgdHJhbnNhY3Rpb24uCgpEaWQg
eW91IGV4cGVyaWVuY2UgZmF1bHR5IGNvbmRpdGlvbnMgb3Igd2FzIGl0IHJlcG9ydGVkIHRoYW5r
cyB0bwpzdGF0aWMgYW5hbHlzaXM/CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KCj4gCj4gRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFz
dGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pgo+IC0tLQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
