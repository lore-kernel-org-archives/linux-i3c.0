Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C26C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez+F1gpEroOWUXv1120lkCzA/1f56gGsUTTBU+H0fJI=; b=3gLAYLvHtF+LSI
	QXhuLiIiduYx95I5pG4Gh5UnO3iTh9PtIo/Frfr8oJNxMgNzQeHse/LvVrfw0J/P7rtvbNa75ze2U
	JfBz/vdBIHMcZqc3F9EgQ3XJYCHbqmBFCBiP5EzjsbULrvPOHe+PSLlBXrUMK4bmId/9k1JqHVFgR
	YZE3K+ec0R5Lwtq6fipLvnucYnOaKJbAa0OJXlRrcESt806i190EHsc/RDX49IIQtW6eqNyp4ay9m
	TcsAIdiGNaOZELNne71szZj8heJX8QIwSsag3VeP6moIYGas7OhjK2M6R9zfoFZiyhMEFJ6nIeC9m
	xdE7z75MtO3eGU0847Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWq9-0000000HTLy-3Urv;
	Fri, 23 Aug 2024 16:08:41 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWpN-0000000HT9Q-10uk
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:07:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C0CD20002;
	Fri, 23 Aug 2024 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkpQSxHJZJqJ2ia8bscC51GsZfukDOspvZw0hSmkj7I=;
	b=Dgm5Cm6xNKaLcZIvGyNCJhLF3wwiZDgbr0yXlLVcfEZHkHrNa25qhugDv0x9LBZYKpUxnr
	j3hRqCfc6lMgl4OY4sv/xsVxJ/Qnu9D9zaqYBawxOuvnCkZbQeOIKk8ubHGkjoFkblYCqS
	x0qPeutSq8kx96v5k1pK7sL6pqBZzY6LbOjk1vLT11l+j9YPDM4w5o3lL4jrzwaLqymzTG
	/xdmC2SodHqICI4m3hUrCtdN6vS+DyRFHElxCfkeCUkZws4neHG7nav3i5bNjueZYbTm6u
	qmMr/C01ePFjDfCZcDnT69g47EXny67hKBiKn45oOnsQgpcFw5ZMiZ0fCoId0w==
Date: Fri, 23 Aug 2024 18:07:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH v3 05/11] i3c: master: Fix miss free init_dyn_addr at
 i3c_master_put_i3c_addrs()
Message-ID: <20240823180747.44fd0ec8@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-5-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-5-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090753_451539_5B711A05 
X-CRM114-Status: UNSURE (   5.59  )
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
MDE6NTkgLTA0MDA6Cgo+IGlmIChkZXYtPmJvYXJkaW5mbyAmJiBkZXYtPmJvYXJkaW5mby0+aW5p
dF9keW5fYWRkcikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXiBo
ZXJlIGNoZWNrICJpbml0X2R5bl9hZGRyIgo+IAlpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVz
KCZtYXN0ZXItPmJ1cywgZGV2LT5pbmZvLmR5bl9hZGRyLCAuLi4pCj4gCQkJCQkJICAgICAgICAg
ICAgIF5eXl4KPiAJCQkJCQkJZnJlZSAiZHluX2FkZHIiCj4gRml4IHR5cG8gImR5bl9hZGRyIiBi
eSByZXBsYWNpbmcgaXQgd2l0aCAiaW5pdF9keW5fYWRkciIuCgpNYXliZSB5b3UgY2FuIG1lbnRp
b24gaXQncyBhIGNvcHkvcGFzdGUgZXJyb3IsIHdoaWNoIG1ha2VzIHRoZSBkaWZmCi13aGVuIGxv
b2tpbmcgYXQgdGhlIHByZXZpb3VzIGxpbmVzLSBvYnZpb3VzLgoKUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
