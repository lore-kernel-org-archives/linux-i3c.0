Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DFAC3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 06:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGGOv4TfIg7pkLB2Ukq2GrayI8h5IDBNQRuEhbeuPvI=; b=qm0/JU2mdujELr
	Wo/GRE9iQPoYNKAL6zDPjBHCbr90wcs8yGSsytM879V+GP25Nijf7B8lBpTFqSQG3a3CKzsYYZTfb
	/KFFMDgNmsr4vefCeIka13kXoz+QK+p6LiDhmynL0w03KkbmzEY4ho48lMq97vlyfXxjXXYganA4T
	v7iJVuqSXjrX0GwqDSr/4UacaqhR8Q0ziN8Rr4cHg8Xr/Z2sgdrYwdHGG4+X2mLeDYJr1S9vYiLt1
	iKBTCJmXk+D+j7GFh8Ktz5WdaYYfV65y9igRDp32kz4XPRUNK7p9+QFyysuNCPioSv7Awh5NZTGtZ
	0pt1FVEm7teZHDeokplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiFS-00000002wUj-2HBC;
	Mon, 08 Jul 2024 06:53:18 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiFP-00000002wRv-1jBB
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 06:53:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32C3CFF804;
	Mon,  8 Jul 2024 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720421592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMFmnL/yAUUG6X+1hGqY1449jjRCP0JB7dfM2mH71JA=;
	b=G+eS1cnwWy/kpo+W77MWv7QMdS4sxK/FA205kGTWhaSzI0CaOQXd3Zrr4ECLccJp0oJYkx
	hiObDCuj0ECY1QXzcliauBamxh5813oArqpjgjgJ+dAtypnrddj5a9f9QdHVv8zPI3psa6
	nmoSvpzanrlXNJElSe5L4IVqGbmlgL4HA788gj8YXBvqrF+/JE5OYVqOlWJUEogFGkrCb9
	ZNQtcEV4n44+OSKxjtanVFCBVJGw3YuXiR6u8Zz0Sv4+ADGXUH+vELt13EcmgpBWSL1rI6
	Eqplm4d8Vtr56d5KkWNukMM+hbVwCISfwXeG0vyzxLrjNJDIQalXsH3ZJv+pQw==
Date: Mon, 8 Jul 2024 08:53:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Improve DAA STOP handle code
 logic
Message-ID: <20240708085310.5c5f5521@xps-13>
In-Reply-To: <20240702223107.403057-1-Frank.Li@nxp.com>
References: <20240702223107.403057-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_235315_617530_CAF1467B 
X-CRM114-Status: GOOD (  10.13  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgIDIgSnVsIDIwMjQgMTg6
MzE6MDcgLTA0MDA6Cgo+IFRoZSBSRVFVRVNUX1BST0NfREFBIGNvbW1hbmQgYmVoYXZlcyBkaWZm
ZXJlbnRseSBmcm9tIG90aGVyIGNvbW1hbmRzLgo+IFNvbWV0aW1lcyB0aGUgaGFyZHdhcmUgY2Fu
IGF1dG8gZW1pdCBTVE9QLCBidXQgaW4gb3RoZXIgY29uZGl0aW9ucywgaXQKPiBjYW5ub3QuCj4g
Cj4gSW1wcm92ZXMgdGhlIGNvZGUgbG9naWMgdG8gYmV0dGVyIGhhbmRsZSB0aGVzZSBzaXR1YXRp
b25zLgo+IAo+IEhhcmR3YXJlIGNhbiBhdXRvIGVtaXQgU1RPUCBvbmx5IHdoZW4gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zIGFyZSBtZXQ6Cj4gLSBUaGUgcHJldmlvdXMgSTNDIGRldmljZSBjb3Jy
ZWN0bHkgcmV0dXJucyBhIFBJRCBhbmQgQUNLcyBhbiBJM0MgYWRkcmVzcy4KPiAtIEEgTkFDSyBp
cyByZWNlaXZlZCB3aGVuIGVtaXR0aW5nIDdFIHRvIHRyeSB0byBnZXQgdGhlIG5leHQgSTNDIGRl
dmljZSdzCj4gUElELgo+IAo+IEluIGFsbCBvdGhlciBjYXNlcywgYSBtYW51YWwgU1RPUCBlbWlz
c2lvbiBpcyBuZWVkZWQuCj4gCj4gVGhlIGNvZGUgaXMgY2hhbmdlZCB0byBlbWl0IFNUT1Agd2hl
biBicmVhayB0aGUgd2hpbGUgbG9vcCBhbmQgJ3JldHVybiAwJwo+IG9ubHkgd2hlbiB0aGUgaGFy
ZHdhcmUgY2FuIGF1dG8gZW1pdCBTVE9QLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPgoKTG9va3Mgc2Vuc2libGUgdG8gbWUuCgpSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
