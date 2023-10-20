Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F961CDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sS+jdUVKkCaFPFZIGTdmuUqGz/0ggZ4CqzbrqK+vV6Y=; b=3E7LLCM5hdWlzT
	O3dqWdvA5+uwiZmFEZpcXy6ljmWeGxXgs4JvI6b5Fa3ZF3ap6gszXX3z23POZ9nP3aN44v8SMLb5d
	LOhIdPMwgT7T8xf5w4IlKnKnjPu+TKXtNxpQzAbLwuZrULQAIVuQtqo37666gOwHhcuhc0dWjIcQ0
	+NzFr642SgigYYamI/+e4Xz5+aBb5Iu4icgtwOO+oCLt+ak+eOlCTVqxsZu/elXs1Bs0R+mRtU4Ri
	S27PRukaweXLhhF+g6e+a6O6V9mX1yiwCDLhUnXcJDE6hE13kDBHK7n9MRa3ICoWjU0sgVmhVY6e+
	SvATGfpEiQdS/5vyU74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpu7-002QVX-05;
	Fri, 20 Oct 2023 13:51:07 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpu4-002QUk-1F
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 13:51:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F0681C0009;
	Fri, 20 Oct 2023 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJdh2dlht0YbkjGiXzj0O1UFXr5Vq+0OYseTVm5gD0=;
	b=RPknoZfelsjqVnX7ujKayYxTjgpay25KcKrzIsmenLT/Ui3+XA2AWDhTG+mBuOUh9nP0CY
	JEFOgENRhrNcQ3L57X5oK5O4+Oqm2XdXmCDLbxbGvpypRHVlPUlHslOlxbH83G1L7pEQrp
	ClpVmJXFXM2i9IkHNJqwynQ6hfuL6PYO3PgQkc79hFwJAioHedmAPC8U7vC14IYtbz5fQm
	uB1WjhVbU7LHV6u6lap1+mbVFztdN8T/f+W7GpFZ1K+GRwIr9SSxRv4f1SyLolsRDlG6T6
	v9440lfZ4lvyfA7GGImIAjb23Li7gJE2+g6/gT9iudLRSD9lDSOjWEUM2CMj0g==
Date: Fri, 20 Oct 2023 15:50:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] i3c: master: svc: fix check wrong status
 register in irq handler
Message-ID: <20231020155059.4dfd4109@xps-13>
In-Reply-To: <20231019222725.3598022-5-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-5-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_065104_559579_7FD4691F 
X-CRM114-Status: UNSURE (   6.34  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFRodSwgMTkgT2N0IDIwMjMgMTg6
Mjc6MjMgLTA0MDA6Cgo+IHN2Y19pM2NfbWFzdGVyX2lycV9oYW5kbGVyKCkgd3JvbmcgY2hlY2sg
cmVnaXN0ZXIgU1ZDX0kzQ19NSU5UTUFTS0VELiBJdAoKVGhpcyBzZW50ZW5jZSBzdGlsbCBuZWVk
cyB0byBiZSBjb3JyZWN0ZWQsIHBsZWFzZSByZWFkIGNhcmVmdWxseSBteQpyZXZpZXdzLgoKPiBz
aG91bGQgYmUgU1ZDX0kzQ19NU1RBVFVTLgo+IAo+IEZpeGVzOiBkZDNjNTI4NDZkNTkgKCJpM2M6
IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCj4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4KPiAtLS0KCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
