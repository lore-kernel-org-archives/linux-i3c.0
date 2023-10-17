Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A33CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtKEA5t0HmLCsirqMrw5ruVuvG1RSi+RrFTPiJIB648=; b=f97X15aPVGlH+R
	klIaj94TnN9nzpixV4CSkxlr1FRECpTbNZI+l92546A8lMmMPKff8Wrwqe4i6UOpf82xwFuEMFQ9B
	JEJfcT97OaxHbnOjyGXGpP6r35+0U57w8gV+4qVMMl16CvtN66KLsGgxCDZw69yCg/VgnwIFt3OTl
	KM/ONvgWeXHjcvPN9E5LHcaHm/n5PCqzs8x56hy8aRujreCorzVjwJEYsKK+8+j3BE2VSMkUhi0Fr
	qbFLnoJ1INLMzsXkhnuYRv+V29FK3QviWxyA+TJIpDQESe2bEqOFQgg91el1nvcky2wbYQZHHwa69
	9MTfetKLXxtAM3/fLl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskff-00CUHI-0T;
	Tue, 17 Oct 2023 14:03:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskfY-00CUCk-2A;
	Tue, 17 Oct 2023 14:03:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA0A11BF212;
	Tue, 17 Oct 2023 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiOs9YI1ID+7xm218JICttAfUAvK/5UkhYCx7ePCGkQ=;
	b=KpTFFW951zuT+F79MouKuHxWBk54OyHi5B/wOsPLTPLH8ulW9GAY7Nkwuq56og//cO7Mgo
	eG1H/dfvAm5Q4Ept/hjOz1VrnIiDy2V5iSu0IJqtoGN/gLX7l6sTwvlYGfJPYF98jUWlyh
	0EJiKJoRx+ARTVlkcHUNdXqg6DxPl1ym2MISJ6bPqhvNrFjSO+B3q8rT6nFy2Bu3I/wwJY
	oFL3+/ElyO4kLHn59CvDF58uBUdZIhncxwsN8NojCuBBAgmsGpF1qfP2luPb2V4TkkiByM
	dWOFfQXK+WI96tqw79289nv6x1yOZxrVfYNyLzeqiAP8tPL68AtIdGswJ1ixqw==
Date: Tue, 17 Oct 2023 16:03:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, alexander.stein@ew.tq-group.com,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 conor.culhane@silvaco.com, conor@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, haibo.chen@nxp.com, imx@lists.linux.dev,
 joe@perches.com, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH 1/2] i3c: master: svc: fix compatibility string mismatch
 with binding doc
Message-ID: <20231017160327.569043e0@xps-13>
In-Reply-To: <20231016211854.2901427-1-Frank.Li@nxp.com>
References: <20231016211854.2901427-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_070336_857371_C4017238 
X-CRM114-Status: UNSURE (   8.26  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTc6
MTg6NTMgLTA0MDA6Cgo+IEluIHRoZSBiaW5kaW5nIGRvY3VtZW50YXRpb24sIHRoZSBjb21wYXRp
YmxlIHN0cmluZyBpcyBzcGVjaWZpZWQgYXMKPiAnc2lsdmFjbyxpM2MtbWFzdGVyLXYxJywgYnV0
IGluIHRoZSBkcml2ZXIsIGl0IGlzIGRlZmluZWQgYXMKPiAnc2lsdmFjbyxpM2MtbWFzdGVyJy4K
PiAKPiBBZGQgJ3NpbHZhY28saTNjLW1hc3Rlci12MScgdG8gdGhlIGRyaXZlciBhbmQgZGVwcmVj
YXRlcwo+ICdzaWx2YWNvLGkzYy1tYXN0ZXInIHRvIGVuc3VyZSBjb21wYXRpYmlsaXR5IHdpdGgg
dGhlIGRvY3VtZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxp
QG54cC5jb20+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
