Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C1BCF856E
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Oct 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTTcVVhunYoCLBwbw0JsggsnxnEcgKU2yUq8kQTBPk4=; b=dHcUNxgu2PVSSR
	Kt9NUgpFu8WkMlTwKJYsvXJpuFQpfxuoIYE7vy8MEb4YB9bMOISA8btPixUiF/vbl20o6Bc+hdaZ0
	Xa+XDoCZn509sdmwNnMT6IReSXxyMGtDSwoLlecjE4DJsSVa6ZtOT8DoPWpxx/Sr9R2udrP20Kt6e
	d1yjVHUyye9dCBqnm74WOUQ8L28pxm8tHj4VQAyQ+inKutDRTiDoe7DxVN3nZOIMMaMF0/xTE5ckZ
	nrj4+/GsC3zs9BHWd0y8oN6Mfzd9LFrP39tlDbvEkLR0az8QT8ZueE3B9rcbHn1bQeQldZA7f0ovB
	l1f9cN3z8/eJX+ihCXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swHDE-00000008ZLG-3Fhh;
	Thu, 03 Oct 2024 08:29:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swHDB-00000008ZJe-431G
	for linux-i3c@lists.infradead.org;
	Thu, 03 Oct 2024 08:29:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 857571BF23C;
	Thu,  3 Oct 2024 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727944163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWhKgAh29eCDmjxeIkKTW4yOpIcC1z2EdppPQVN5/bE=;
	b=MP5sqVuWNKaLvWYs4nA+uCRPmFOaMMFU4cMPQ0+jbkUp/FrmNYJ52d/VRj/usReH9aggB5
	wXVgnsR4sAv4tco9VvaSYZCBJclUouTWb89teW04zqF76yv1nIiOBhY8FvauUB6QqfaIoi
	Hc+CvR9XsVWlEqSPT6D9s4+CeoD1wEhGwsBFS+3aJmUAfW3NAGUNponqvcOTXtvc+dUz4U
	wak+jbVjTFW9+tsPiulQgdN33iqpbt8DnHuzlrHCrKrC2MUQYA/g4/L0dUQKgk4HHH0jOO
	w9E8ydk0zjaADsx67qQ+gN0/OwrdY8YQ8AUu9dD1HYRthYpzwnqoJ4yZ5oswXw==
Date: Thu, 3 Oct 2024 10:29:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH 2/3] i3c: master: Extend address status bit to 4 and add
 I3C_ADDR_SLOT_EXT_INIT
Message-ID: <20241003102921.771b2bc1@xps-13>
In-Reply-To: <Zv15UjD9yvJb43MF@lizhi-Precision-Tower-5810>
References: <20241001-i3c_dts_assign-v1-0-6ba83dc15eb8@nxp.com>
	<20241001-i3c_dts_assign-v1-2-6ba83dc15eb8@nxp.com>
	<20241002094944.5c0c83c8@xps-13>
	<Zv15UjD9yvJb43MF@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_012926_183762_2417DFC9 
X-CRM114-Status: GOOD (  11.20  )
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

SGkgRnJhbmssCgo+ID4gPgo+ID4gPiAtc3RhdGljIHZvaWQgaTNjX2J1c19zZXRfYWRkcl9zbG90
X3N0YXR1cyhzdHJ1Y3QgaTNjX2J1cyAqYnVzLCB1MTYgYWRkciwKPiA+ID4gLQkJCQkJIGVudW0g
aTNjX2FkZHJfc2xvdF9zdGF0dXMgc3RhdHVzKQo+ID4gPiArc3RhdGljIGVudW0gaTNjX2FkZHJf
c2xvdF9zdGF0dXMKPiA+ID4gK2kzY19idXNfZ2V0X2FkZHJfc2xvdF9zdGF0dXMoc3RydWN0IGkz
Y19idXMgKmJ1cywgdTE2IGFkZHIpCj4gPiA+ICt7Cj4gPiA+ICsJcmV0dXJuIGkzY19idXNfZ2V0
X2FkZHJfc2xvdF9zdGF0dXNfZXh0KGJ1cywgYWRkcikgJiBJM0NfQUREUl9TTE9UX1NUQVRVU19N
QVNLOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBpM2NfYnVzX3NldF9hZGRy
X3Nsb3Rfc3RhdHVzX21hc2soc3RydWN0IGkzY19idXMgKmJ1cywgdTE2IGFkZHIsCj4gPiA+ICsJ
CQkJCSAgICAgIGVudW0gaTNjX2FkZHJfc2xvdF9zdGF0dXMgc3RhdHVzLCBpbnQgbWFzaykKPiA+
ID4gIHsKPiA+ID4gIAlpbnQgYml0cG9zID0gYWRkciAqIEkzQ19BRERSX1NMT1RfU1RBVFVTX0JJ
VFM7Cj4gPiA+ICAJdW5zaWduZWQgbG9uZyAqcHRyOwo+ID4gPiBAQCAtMzY5LDExICszNzUsMjIg
QEAgc3RhdGljIHZvaWQgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cyhzdHJ1Y3QgaTNjX2J1
cyAqYnVzLCB1MTYgYWRkciwKPiA+ID4gIAkJcmV0dXJuOwo+ID4gPgo+ID4gPiAgCXB0ciA9IGJ1
cy0+YWRkcnNsb3RzICsgKGJpdHBvcyAvIEJJVFNfUEVSX0xPTkcpOwo+ID4gPiAtCSpwdHIgJj0g
figodW5zaWduZWQgbG9uZylJM0NfQUREUl9TTE9UX1NUQVRVU19NQVNLIDw8Cj4gPiA+IC0JCQkJ
CQkoYml0cG9zICUgQklUU19QRVJfTE9ORykpOwo+ID4gPiArCSpwdHIgJj0gfigodW5zaWduZWQg
bG9uZyltYXNrIDw8IChiaXRwb3MgJSBCSVRTX1BFUl9MT05HKSk7Cj4gPiA+ICAJKnB0ciB8PSAo
dW5zaWduZWQgbG9uZylzdGF0dXMgPDwgKGJpdHBvcyAlIEJJVFNfUEVSX0xPTkcpOwo+ID4gPiAg
fQo+ID4gPgo+ID4gPiArc3RhdGljIHZvaWQgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cyhz
dHJ1Y3QgaTNjX2J1cyAqYnVzLCB1MTYgYWRkciwKPiA+ID4gKwkJCQkJIGVudW0gaTNjX2FkZHJf
c2xvdF9zdGF0dXMgc3RhdHVzKQo+ID4gPiArewo+ID4gPiArCWkzY19idXNfc2V0X2FkZHJfc2xv
dF9zdGF0dXNfbWFzayhidXMsIGFkZHIsIHN0YXR1cywgSTNDX0FERFJfU0xPVF9TVEFUVVNfTUFT
Syk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIGkzY19idXNfc2V0X2FkZHJf
c2xvdF9zdGF0dXNfZXh0KHN0cnVjdCBpM2NfYnVzICpidXMsIHUxNiBhZGRyLAo+ID4gPiArCQkJ
CQkgICAgIGVudW0gaTNjX2FkZHJfc2xvdF9zdGF0dXMgc3RhdHVzKQo+ID4gPiArewo+ID4gPiAr
CWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXNfbWFzayhidXMsIGFkZHIsIHN0YXR1cywgSTND
X0FERFJfU0xPVF9FWFRfU1RBVFVTX01BU0spOwo+ID4gPiArfSAgCj4gPgo+ID4gQ2FuIHdlIGRy
b3AgdGhpcyBoZWxwZXIgYW5kIGluc3RlYWQgbW9kaWZ5IHRoZQo+ID4gaTNjX2J1c19zZXRfYWRk
cl9zbG90X3N0YXR1cygpIHByb3RvdHlwZSB0byBnZXQgdGhlIG1hc2sgZnJvbSBpdHMKPiA+IHBh
cmFtZXRlcnM/ICAKPiAKPiBnaXQgZ3JlcCAiaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cygi
IGRyaXZlcnMvaTNjLyB8IHdjCj4gCj4gVGhlcmUgYXJlIDE4IHBsYWNlcyBuZWVkIGJlIG1vZGlm
aWVkIHdpdGhvdXQgdGhpcyBoZWxwZXIgZnVuY3Rpb24uCj4gYXJlIHlvdSBzdWUgd2hhdCB5b3Ug
d2FudD8KPiAKPiBNYXliZSBkcm9wIGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXNfZXh0KCkg
aXMgZ29vZCBpZGVhIGJ5IGRpcmVjdCB1c2UKPiBpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVz
X21hc2soKS4KCk9rIGZpbmUgZm9yIF9tYXNrLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
