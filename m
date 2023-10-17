Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BBCCDB482
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifUXk5c5iE4ZLJDLWRNqTTworQYJedMw6M+xGBPTgXw=; b=FX/+sUiLUBIp2/
	ItPwDUoqEWrREuFFDSPDoXTXgwAjShETT7dksi0pjWWGSBDBDWzTsghS5Jt8mM5Mpk7BiES7BXOg+
	zdUlUwvdnmeIWNliWUYHMP1GjRXtciml12ze+r3JNlTAW3dh+z8h5UHONW/WFiwddMyP8/B1ws2hP
	Xou78oVw/GZulYMVs49tWYXwDegphKH8ExRIyR0tvYZyz1XAfgFGglXd1upkxgi6xgr2SwtK1i37F
	4CNT57Z1UAWIhaBm7lNY19nY3CckkqxjrUBtfWXdWPkPzzuYuC7IIIAPJdLzGgFvJB0ni30sFBXQX
	KRnyrAPdkohtsJQj5LBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl4f-00CWuc-0O;
	Tue, 17 Oct 2023 14:29:33 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl4c-00CWtd-2h
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:29:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E47960009;
	Tue, 17 Oct 2023 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcsvGRK8K2SUzbeAUGwaIsZjtuCIZBWqXi6HsY6/W7o=;
	b=jLeluP3OIKI9b6XdjpiJc/1HViOWLCs+g1EW7wYY9HMIoUykPDihy3LYuK0xTxbHXZecs4
	cHZ/ySeCVN29gKCayPAR2ucMKBmIykrD/HQdbg81buS0sa2cS6r3yfjID377X5rN0koOm2
	y+jHGj2w8WrBR6h3Vv4c+eR7++RlQFBLAK5yGvk/ex8Osl4V1BBsyB/1nSd8Nla8kU4G0L
	RotH1V+WBRDQYaWsAqqA+dCYIU+GOOzq3jXrFY2J6zPUPXzKWV5j1D3qaN/7SdDB0iQuey
	y0AiQoJv1B0Pg87Ulh+5ITnMI50MKm465bND49+29RK75wTPgrquvGxKihvZMw==
Date: Tue, 17 Oct 2023 16:29:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 5/6] i3c: master: svc: fix SDA keep low when polling
 IBIWON timeout happen
Message-ID: <20231017162924.3a4b4200@xps-13>
In-Reply-To: <20231016153232.2851095-6-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-6-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_072931_020391_E714E1A6 
X-CRM114-Status: GOOD (  11.19  )
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
MzI6MzEgLTA0MDA6Cgo+IE5lZWQgY2FsbCBzdmNfaTNjX21hc3Rlcl9lbWl0X3N0b3AoKSByZWxl
YXNlIGJ1cy4KCkNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB0aGlzIGNvbW1pdCBtZXNzYWdlIHBs
ZWFzZT8KCj4gRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2
YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2Mt
bWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IDVh
YjY4ZDZlNDM5ZC4uNWJjYTM2OWQ2OTEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFz
dGVyLmMKPiBAQCAtNDAzLDYgKzQwMyw3IEBAIHN0YXRpYyB2b2lkIHN2Y19pM2NfbWFzdGVyX2li
aV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCQkJCQkgU1ZDX0kzQ19NU1RBVFVT
X0lCSVdPTih2YWwpLCAwLCAxMDAwKTsKPiAgCWlmIChyZXQpIHsKPiAgCQlkZXZfZXJyKG1hc3Rl
ci0+ZGV2LCAiVGltZW91dCB3aGVuIHBvbGxpbmcgZm9yIElCSVdPTlxuIik7Cj4gKwkJc3ZjX2kz
Y19tYXN0ZXJfZW1pdF9zdG9wKG1hc3Rlcik7Cj4gIAkJZ290byByZWVuYWJsZV9pYmlzOwo+ICAJ
fQo+ICAKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
