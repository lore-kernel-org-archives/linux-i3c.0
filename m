Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65072C4332F
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Nov 2023 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piUbYt3ME5st2nv2GZplFqtFeyLx3xXqha1QiQ5u7/M=; b=Qtk1tJmisDCGKK
	VgBNEDky31trtHTtRrEYsZwqqaExg/y2stOQ48LWK5/NmG0HgdNpXFKGJci4IrsCCf0GhPKkjVtlc
	CjpzlDR+L46hzmlEYq1WilHw7TdxuZ1DU6RIy4PmIMv0qjygRfV4oWsjsfTo/WrZRh9+jZyMekctg
	CApqFVxcNfSrNAV6oj+tng6+U2WqUVvHH1WCJTbHNKIW7+5J5Lop9+mCDK67mD3fC7HaeXyW+09PM
	fR/D2BKdDTze+h+eu2Vgj6Zw5XZbmDzm3mK/Q7cyG2y0hd+QG5reBdMmturGNQsUFjJ23mv1N5Mym
	NCEqRP+JCmLObEaVHiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oeV-00FNJ0-28;
	Tue, 14 Nov 2023 08:20:07 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oeS-00FNHs-2V
	for linux-i3c@lists.infradead.org;
	Tue, 14 Nov 2023 08:20:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA7471BF206;
	Tue, 14 Nov 2023 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699949997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7tWyiHY4GP5FHn9qova3bj8b2knZsniB4j8YzqtHyM=;
	b=XQMkCtmwnl1bi4OTYoaciGBU7mTkriP2zpYqsSv30p9AKSzeMaTIO3c7/Pkvc0t0+QZ22z
	2KziH0ZpTzy3BQuFS/4ISIWvCZO2UqpJ3rx2uUqzmvMjOcq2o/nvS0SS+PpQtROubU9kzH
	y2Odld0v+yARBwl7/VNM2abTU/lxWcTavyCdjK2ncD0p9yQ7Q8p1v4CYEA10wzFaUFr7E5
	zIbut3OTSizTkPBV1xk8axmpP5jShfQ5seXuzDZFkh2/w8V0XYwFvq1nS9el83Nuty3adQ
	Gd8gNcVp+yfiGYVRWiuWEELmzZ93x05KaRIMTcs62zq3wQpsEsT6I4WLAO3z8w==
Date: Tue, 14 Nov 2023 09:19:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] i3c: Add fallback method for GETMXDS CCC
Message-ID: <20231114091956.0b8dd6c5@xps-13>
In-Reply-To: <20231114033430.9623-2-joshua.yeong@starfivetech.com>
References: <20231114033430.9623-1-joshua.yeong@starfivetech.com>
	<20231114033430.9623-2-joshua.yeong@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_002004_965450_2BCE39BA 
X-CRM114-Status: GOOD (  19.23  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gVHVlLCAx
NCBOb3YgMjAyMyAxMTozNDozMCArMDgwMDoKCj4gU29tZSBJM0MgaGFyZHdhcmUgd2lsbCByZXBv
cnQgZXJyb3Igd2hlbiBpbmNvcnJlY3QgbGVuZ3RoIGlzIHJlY2VpdmVkIGZyb20KCgkJCQkJYW4K
Cj4gZGV2aWNlLiBHRVRNWERTIENDQyBhcmUgYXZhaWxibGUgaW4gMiBmb3JtYXRzOyB3aXRob3V0
IHR1cm5hcm91bmQgdGltZSAoZm9ybWF0CgoJCQkgIGF2YWlsYWJsZQkJOgoKPiAxKSBhbmQgd2l0
aCB0dXJuYXJvdW5kIHRpbWUgKGZvcm1hdCAyKS4gVGhlcmUgaXMgbm8gbWVjaGFuaWNzIHRvIGRl
dGVybWluZSB3aGljaAo+IGZvcm1hdCBpcyBzdXBwb3J0ZWQgYnkgZGV2aWNlLiBJbiBjYXNlIHNl
bmRpbmcgR0VUTVhEUyBDQ0MgZm9ybWF0IDIgcmVzdWx0ZWQKCgkJCQlTbyBpbiBjYXNlPwoKPiBm
YWlsdXJlLCB0cnkgc2VuZGluZyBHRVRNWERTIENDQyBmb3JtYXQgMSBpbnN0ZWFkLgoKaW4gYQoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRl
Y2guY29tPgo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDEyICsrKysrKysrKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+
IGluZGV4IDBjZGM5NGU0Y2I3Ny4uMmZjMDRkOTdmMDdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMTA5OSw4ICsx
MDk5LDE2IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9nZXRteGRzX2xvY2tlZChzdHJ1Y3QgaTNj
X21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gIAo+ICAJaTNjX2NjY19jbWRfaW5pdCgmY21k
LCB0cnVlLCBJM0NfQ0NDX0dFVE1YRFMsICZkZXN0LCAxKTsKPiAgCXJldCA9IGkzY19tYXN0ZXJf
c2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQpOwo+IC0JaWYgKHJldCkKPiAtCQlnb3Rv
IG91dDsKPiArCWlmIChyZXQpIHsKPiArCQkvKgoJCSBeCldyb25nIGFsaWdubWVudCBvZiB0aGUg
c3RhcnRzIGJlbG93CgkJdgo+ICsJCSogUmV0cnkgd2hlbiB0aGUgZGV2aWNlIGRvZXMgbm90IHN1
cHBvcnQgbWF4IHJlYWQgdHVybmFyb3VuZAo+ICsJCSogd2hpbGUgZXhwZWN0aW5nIHNob3J0ZXIg
bGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZAoKcGVyaW9kPwoKPiArCQkqLwo+ICsJCWRlc3Qt
PnBheWxvYWQubGVuIC09IDM7Cj4gKwkJcmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9j
a2VkKG1hc3RlciwgJmNtZCk7Cj4gKwkJaWYgKHJldCkKPiArCQkJZ290byBvdXQ7Cj4gKwl9CgpJ
IGJlbGlldmUgdGhpcyBpcyBhIHBlci1kZXZpY2UgY29uZmlndXJhdGlvbiBhbmQgd2Ugc2hvdWxk
IHNhdmUgdGhpcyBpbgpvcmRlciB0byBvbmx5IGZhaWwgb25jZSwgbm8/Cgo+ICAKPiAgCWlmIChk
ZXN0LnBheWxvYWQubGVuICE9IDIgJiYgZGVzdC5wYXlsb2FkLmxlbiAhPSA1KSB7Cj4gIAkJcmV0
ID0gLUVJTzsKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
