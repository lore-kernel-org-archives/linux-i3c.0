Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708ADE77197
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jan 2025 13:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPPshNIO4cajm2fSD1/hxMHY9PlLrZk1JLjwrrTzjug=; b=RLGPndP9IIod5a
	0GTdUCCIP3qcjpouCk4QT//rfHtjjuFz+xsqlZCYn4Yp+/jVayoxB9xLgJle+ufm89nQE02sZdfzf
	hHHQToRY5dv0O3PbINdplT16EjXbIR9RdvjULYIkWQzPEdpnmNzAe8Xj6bEkKcoRYGOM21JeJ+g3V
	HjLuwb8gL/OWWJfVwPMonQ9WJ71R8ErtFRKU8hcKSGJF7jig7C9ZOq9v6AhBGkLx7YxDNEkrjJxT0
	MPnRhUOoM8RCmGFU5osBr2DAFLYHvE6e5DUTPLDiP7vW0ZwXg/ow+mXZ4Qh+Prf+Z96O4jZSoPfWv
	dJEc4/V3PY1Mye8THZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsDT-0000000BwEj-09ea;
	Thu, 09 Jan 2025 13:04:51 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsDQ-0000000BwDu-1VPg
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jan 2025 13:04:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C030F4000B;
	Thu,  9 Jan 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736427885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAWTot885s+HJHOrMvpF9YdGKqoyNJBWi6FZYkvQ1ks=;
	b=hRKzjB0SQeG+aaDAr2xjePmzdCJraat9EKEwn3jmyKlQCyDlay3fQ8uNenn2G1JIaeUp/I
	aze8iYQFOTJI2Ty4Hnbpk7jAkH2T6b9NXec10sEUlsJ+e9zc9PvlqTtrfFVtEGelyCx4XE
	uQpW4m4B6u02/6yraH8No1uQZ6Nml//2dvf5pXKr40znYi/HaxFlLZhk9pid32EYqaQO7M
	63sL7TLeuKynSccsZap3af3iIBiRa3DMVaHwU79VM7BdmDk5451IQxEaRbrNwIWzHgDU55
	LU7WCosM9jOF2jfCFmg8Fa5IJlZD+/NrrB/YtNYTATQD47aV8f35W7Xnmdp6RQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Carlos Song
 <carlos.song@nxp.com>,  linux-i3c@lists.infradead.org (moderated list:I3C
 SUBSYSTEM),  linux-kernel@vger.kernel.org (open list),
  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com> (Frank Li's message of
	"Wed, 8 Jan 2025 17:55:33 -0500")
References: <20250108225533.915334-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 14:04:44 +0100
Message-ID: <87plkwcf4j.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_050448_541304_A1590CC9 
X-CRM114-Status: UNSURE (   6.38  )
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

T24gMDgvMDEvMjAyNSBhdCAxNzo1NTozMyAtMDUsIEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
PiB3cm90ZToKCj4gRml4IGEgcHJvYmUgZmFpbHVyZSBpbiB0aGUgaTNjIG1hc3RlciBkcml2ZXIg
dGhhdCBvY2N1cnMgd2hlbiBubyBpM2MKPiBkZXZpY2VzIGFyZSBjb25uZWN0ZWQgdG8gdGhlIGJ1
cy4KPgo+IFRoZSBpc3N1ZSBhcmlzZXMgaW4gYGkzY19tYXN0ZXJfYnVzX2luaXQoKWAgd2hlcmUg
dGhlIGByZXRgIHZhbHVlIGlzIG5vdAo+IHVwZGF0ZWQgYWZ0ZXIgY2FsbGluZyBgbWFzdGVyLT5v
cHMtPnNldF9zcGVlZCgpYC4gSWYgbm8gZGV2aWNlcyBhcmUKPiBwcmVzZW50LCBgcmV0YCByZW1h
aW5zIHNldCB0byBgSTNDX0VSUk9SX00yYCwgY2F1c2luZyB0aGUgY29kZSB0bwo+IGluY29ycmVj
dGx5IHByb2NlZWQgdG8gYGVycl9idXNfY2xlYW51cGAuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
