Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0A0C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Yg/r3LPuX+dZWtduOoPd3/MfQ9SqXR1tEq+l2RNngA=; b=Q0fWBMe7GkAQul
	StXEHunZyKW0yfHQbzMT72YMn1+4mHWqtBg3UgOGzzCUpOjcgwcKZj/qQmZ1SneMXfhM9DZA6P6fI
	1124Gv6zDKa1kWppwla5qKn8MxnpLe/E73ANj+0PauGlKinu3NhEq/AjCxS3Sy4s9/KdB+BwQl/kO
	JmE3Oh8a48YS0+nLdMJfOGRfAF3zlhgjo0VYdR0PRGpjXu5nuI0sSg4kM24QWeMMG1CkY04I/ZaQM
	w6HWIdrmjKt/WFCFXjPsx4IyZJScb4xvH7Y/K5rwpPqlLiQWHLvwO9Px84pamxEgH+DCOkNmdBQCT
	M5ebvVfx7XrLKW30AA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWsO-0000000HTwU-0tg0;
	Fri, 23 Aug 2024 16:11:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWsL-0000000HTvf-0HMh
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:10:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13D3D40009;
	Fri, 23 Aug 2024 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTgGYKu2x0zUKSDgcu/aPbz+tb0PHBa0K0KAuoUGdlY=;
	b=aoPAuVp/1cIoLFPBf8qBDCysN7ZELBNzgpxnKiSg0xyPrispsWeedQ9LXmP6X00itXfHg9
	rpdRM0XG88qlckXUaPoxRbzD3k03L7eJFxJSqyGdbsFYzB+VcxcqQj7Z0aC9rjQNeatMdW
	UiunmznfP9Twd2SnuEDbknS8KVKRSkI1vJbMuAV96IdEbWtEMGHqREsF1SdC4sh64nnpXU
	FPAr7ESIfcCSuOUOVJU0tPVigjpGeHiwAFx+ZE8wyGxButwFtbs4MExqoNPuedOdnLXIg7
	fqzddBVpESdRhmBOjT0FCEjr2Gx7mlyaDy+l7e8NWDWiTZ7wXck7X88+P4Tdtg==
Date: Fri, 23 Aug 2024 18:10:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 07/11] i3c: master: svc: manually emit NACK/ACK for
 hotjoin
Message-ID: <20240823181053.4a793095@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-7-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-7-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091057_257429_20180C23 
X-CRM114-Status: UNSURE (   8.46  )
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
MDI6MDEgLTA0MDA6Cgo+IFdoZW4gdGhlIGFkZHJlc3MgaXMgYXJiaXRyYXRlZCBhdCBzZW5kIGFk
ZHJlc3MsIHRoZSBoYXJkd2FyZSBjYW4gYXV0by1zZW5kCj4gTkFDSyBpZiBpdCBpcyBhbiBJQkku
IEhvd2V2ZXIsIG1hbnVhbCBlbWlzc2lvbiBvZiBOQUNLL0FDSyBpcyBuZWVkZWQgZm9yCj4gaG90
IGpvaW4gb3IgY29udHJvbGxlciByZXF1ZXN0IGV2ZW50cy4KPiAKPiBBZGQgaGVscCBmdW5jdGlv
biBzdmNfaTNjX21hc3Rlcl9oYW5kbGVfaWJpX3dvbigpIHRvIGNoZWNrIGV2ZW50IHR5cGUgYW5k
Cj4gc2VuZCBvdXQgTkFDSyBpZiB0aGUgZXZlbnQgaXMgbm90IGFuIElCSS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KClJldmlld2VkLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
