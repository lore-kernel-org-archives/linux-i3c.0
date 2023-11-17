Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16E8C072A2
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Nov 2023 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m//RUgr1AG9YdlSF6hxLYNIqiEsXlwvOIQrv8jcMBJo=; b=WOwQdHhpgXT+SM
	gSKuJzEertCfAQIn8PVnZLG41qgAh1YO8TzIp0WKQmk3zdIr7caCsJm5CmZSL6Ep54hjh+vkeAciZ
	/GOkkBFFpJ3AyvLX3EErP0i/TgsfMVn0cgv7dmoZS7Iq2SoX+lWY0szezBXOZ8dFFiIUsejs9oRhr
	9ZJh1esyZh6rIu86SPcz2T5YOQUm7h/78cywMKLqurl8TYep8iKPntYOVqeysUcpUxMuyEJ2q2oPI
	+P2gfPF5onq4vAKVI6jg550/j3SVAYJDLWeD9at25c7iyTujGpqFNBPtzCO2DpBr0TA4G5BowHtaU
	KYi0ULTvw57OWSGmXE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wvX-006KFF-1V;
	Fri, 17 Nov 2023 11:22:23 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wvV-006KBK-0I
	for linux-i3c@lists.infradead.org;
	Fri, 17 Nov 2023 11:22:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F765FF80A;
	Fri, 17 Nov 2023 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700220136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2BPqd+FSamcYon4mcOXpelEiQV6hXMkVTYzbdo7LwM=;
	b=WGCP/hiz0Xyso7ONuqhbflCdGjOZlSFhctuGgpkdxum3lni5FZSXNnzd2Dt5PsiPsCC8zj
	mN/1gn2xIvEJ9qUBMTZtVOFjSM+Dw+9/LFjrhKInE2gDpPy/zped5nfUppOZHYxYAIGUtf
	lpulnxrTHkK87ldAxlowKz3zyxa49pwERbof+tKbZjYgEiDFd+rLoZIMX8mjt8JCvuvz84
	WB2QaXDXWQthPF+giYMXDUga0OTTaHST8rc2vpoqY/kgudnZPXD6dxg+qOWHxpjWqOl8Nf
	kXCgUkiNNtfOTXl6FdlFP3zru6lRO3NO0oa8597QwnoZ4Wp+x0zMRAJ1K5PDDA==
Date: Fri, 17 Nov 2023 12:22:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Joshua Yeong
 <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH] i3c: master: Fix build error
Message-ID: <20231117122215.11192504@xps-13>
In-Reply-To: <20231117110924.634280-1-jarkko.nikula@linux.intel.com>
References: <20231117110924.634280-1-jarkko.nikula@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_032221_263700_7210AA45 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgSmFya2tvLAoKamFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb20gd3JvdGUgb24gRnJpLCAx
NyBOb3YgMjAyMyAxMzowOToyNCArMDIwMDoKCj4gRml4IGJ1aWxkIGVycm9yIGNhdXNlZCBieSBj
b21taXQgMmFhYzBiZjRlYmM4ICgiaTNjOiBBZGQgZmFsbGJhY2sgbWV0aG9kCj4gZm9yIEdFVE1Y
RFMgQ0NDIikgd2hpY2ggaW5jb3JyZWN0bHkgYWNjZXNzIHRoZSAic3RydWN0IGkzY19jY2NfY21k
X2Rlc3QKPiBkZXN0IiBhcyBwb2ludGVyLgo+IAo+IGRyaXZlcnMvaTNjL21hc3Rlci5jOiBJbiBm
dW5jdGlvbiDigJhpM2NfbWFzdGVyX2dldG14ZHNfbG9ja2Vk4oCZOgo+IGRyaXZlcnMvaTNjL21h
c3Rlci5jOjExNDA6MjE6IGVycm9yOiBpbnZhbGlkIHR5cGUgYXJndW1lbnQgb2Yg4oCYLT7igJkg
KGhhdmUg4oCYc3RydWN0IGkzY19jY2NfY21kX2Rlc3TigJkpCj4gIDExNDAgfCAgICAgICAgICAg
ICAgICAgZGVzdC0+cGF5bG9hZC5sZW4gLT0gMzsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgXn4KPiAKPiBGaXhlczogMmFhYzBiZjRlYmM4ICgiaTNjOiBBZGQgZmFsbGJhY2sgbWV0aG9k
IGZvciBHRVRNWERTIENDQyIpCj4gU2lnbmVkLW9mZi1ieTogSmFya2tvIE5pa3VsYSA8amFya2tv
Lm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
Ywo+IGluZGV4IDcxOGI2NDNjYjU0ZC4uOGI3MjllYmFlMmE2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMTEzNSw3
ICsxMTM1LDcgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX2dldG14ZHNfbG9ja2VkKHN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiAgCQkgKiBSZXRyeSB3aGVuIHRoZSBkZXZp
Y2UgZG9lcyBub3Qgc3VwcG9ydCBtYXggcmVhZCB0dXJuYXJvdW5kCj4gIAkJICogd2hpbGUgZXhw
ZWN0aW5nIHNob3J0ZXIgbGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZC4KPiAgCQkgKi8KPiAt
CQlkZXN0LT5wYXlsb2FkLmxlbiAtPSAzOwo+ICsJCWRlc3QucGF5bG9hZC5sZW4gLT0gMzsKPiAg
CQlyZXQgPSBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQobWFzdGVyLCAmY21kKTsKPiAg
CQlpZiAocmV0KQo+ICAJCQlnb3RvIG91dDsKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
