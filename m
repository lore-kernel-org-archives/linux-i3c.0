Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A1CFA74C
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2024 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Xa5Zx0I5VzDbUNXt67+Pfd35fU+2zoYBz2sncqU7oM=; b=nSfqtA1OxgvFQl
	4uhPWG4CYG2dO5tbU3AYCiwSqQhR8t8M81HD1m4E4mhmB348c6AiP8/7/C4bb+ZtuMCuTSjJUnAaf
	FVduB6+KMob4P2dGmEDJemS3WCJGYUnSLXY9sXVtINbloy46zCqKzPEuoo0GQjz+pZwY3wvhJbboX
	A7xd3OwNPj13lxTUHGWzuo0LVjpPnPfxPs3gk9a+0A/0COHrMwiU0evEdxIeLgldv0vjaRDFxM9ac
	YXwbO8OQ20hKN8CQIcU6NNLwPUL+3Z0pUgFBJ2+yMmVlzo8XK2Wscjiksj6dEr2Y891KhOmzJINnt
	7an3KLHdVFtkc+Yz4yEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swckf-0000000BE0d-0hIm;
	Fri, 04 Oct 2024 07:29:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swckb-0000000BE0C-3TjL
	for linux-i3c@lists.infradead.org;
	Fri, 04 Oct 2024 07:29:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B37240008;
	Fri,  4 Oct 2024 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728026956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3TTnuR28kslWEwBM5pyA9qaAOzOesXM2P5x5soXKlY=;
	b=L/UbZ7LXGUN/3HkPF6ZE6gq/YEeIC9acHhUTIOU8ZWEFtcbBccwLW55PzEpNEgi7EJ68Jm
	PEQ1RBotR3N3WMpiVfup4bVAIpnB+XN+6PFrsluhkXdZaqkjOvHjkiA8GP7NdgLxIDorGa
	VjC3BThwK/N6lX8Ncnhv6ymRO3FZ66gi0cJ9fSomrMYE2a2CO0XB7Ie8OqLZtDhtB8DhXW
	FDAcaQfk6WlAHln+mtWyYUWR2FEMNG1/f/8QQB73WM6npBm84Ii66O/B6bkRmgCypG4JKr
	6M5v2reYu0ifPmXbOIWhOtJa2YMsjhecYMDIwAXeKH/IJ7wip6BrvgJ6gtR+JA==
Date: Fri, 4 Oct 2024 09:29:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH v6 2/3] i3c: master: Extend address status bit to 4 and
 add I3C_ADDR_SLOT_EXT_DESIRED
Message-ID: <20241004092914.42701e56@xps-13>
In-Reply-To: <20241003-i3c_dts_assign-v6-2-eae2569c92ca@nxp.com>
References: <20241003-i3c_dts_assign-v6-0-eae2569c92ca@nxp.com>
	<20241003-i3c_dts_assign-v6-2-eae2569c92ca@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_002922_155570_58BE72F7 
X-CRM114-Status: GOOD (  24.58  )
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

SGkgRnJhbmssCgo+ICsgKiBIb3dldmVyLCBzb21lIEkzQyB0YXJnZXRzIG1heSByZXF1ZXN0IHNw
ZWNpZmljIGFkZHJlc3NlcyAoY2FsbGVkIGFzICJpbml0X2R5bl9hZGRyIiksIHdoaWNoIGlzCj4g
KyAqIHR5cGljYWxseSBzcGVjaWZpZWQgYnkgdGhlIERULSdzIGFzc2lnbmVkLWFkZHJlc3MgcHJv
cGVydHkuIExvd2VyIGFkZHJlc3NlcyBoYXZpbmcgaGlnaGVyIElCSQo+ICsgKiBwcmlvcml0eS4g
SWYgaXQgaXMgYXZhaWxhYmxlLCBpM2NfYnVzX2dldF9mcmVlX2FkZHIoKSBwcmVmZXJhYmx5IHJl
dHVybiBhIGZyZWUgYWRkcmVzcyB0aGF0IGlzCj4gKyAqIG5vdCBpbiB0aGUgbGlzdCBvZiBkZXNp
cmVkIGFkZHJlc3NlcyAoY2FsbGVkIGFzICJpbml0X2R5bl9hZGRyIikuIFRoaXMgYWxsb3dzIHRo
ZSBkZXZpY2Ugd2l0aAo+ICsgKiB0aGUgImluaXRfZHluX2FkZHIiIHRvIHN3aXRjaCB0byBpdHMg
ImluaXRfZHluX2FkZHIiIHdoZW4gaXQgaG90LWpvaW5zIHRoZSBJM0MgYnVzLiBPdGhlcndpc2Us
Cj4gKyAqIGlmIHRoZSAiaW5pdF9keW5fYWRkciIgaXMgYWxyZWFkeSBpbiB1c2UgYnkgYW5vdGhl
ciBJM0MgZGV2aWNlLCB0aGUgdGFyZ2V0IGRldmljZSB3aWxsIG5vdCBiZQo+ICsgKiBhYmxlIHRv
IHN3aXRjaCB0byBpdHMgZGVzaXJlZCBhZGRyZXNzLgo+ICsgKgo+ICsgKiBJZiB0aGUgcHJldmlv
dXMgc3RlcCBmYWlscywgZmFsbGJhY2sgcmV0dXJuaW5nIG9uZSBvZiB0aGUgcmVtYWluaW5nIHVu
YXNzaWduZWQgYWRkcmVzcywKPiArICogcmVnYXJkbGVzcyBvZiBpdHMgc3RhdGUgaW4gdGhlIGRl
c2lyZWQgbGlzdC4KPiArICovCj4gIHN0YXRpYyBpbnQgaTNjX2J1c19nZXRfZnJlZV9hZGRyKHN0
cnVjdCBpM2NfYnVzICpidXMsIHU4IHN0YXJ0X2FkZHIpCj4gIHsKPiAgCWVudW0gaTNjX2FkZHJf
c2xvdF9zdGF0dXMgc3RhdHVzOwo+ICAJdTggYWRkcjsKPiAgCj4gKwlmb3IgKGFkZHIgPSBzdGFy
dF9hZGRyOyBhZGRyIDwgSTNDX01BWF9BRERSOyBhZGRyKyspIHsKPiArCQlzdGF0dXMgPSBpM2Nf
YnVzX2dldF9hZGRyX3Nsb3Rfc3RhdHVzX21hc2soYnVzLCBhZGRyLAo+ICsJCQkJCQkJICAgSTND
X0FERFJfU0xPVF9FWFRfU1RBVFVTX01BU0spOwo+ICsJCWlmIChzdGF0dXMgPT0gSTNDX0FERFJf
U0xPVF9GUkVFKQo+ICsJCQlyZXR1cm4gYWRkcjsKPiArCX0KPiArCj4gIAlmb3IgKGFkZHIgPSBz
dGFydF9hZGRyOyBhZGRyIDwgSTNDX01BWF9BRERSOyBhZGRyKyspIHsKPiAgCQlzdGF0dXMgPSBp
M2NfYnVzX2dldF9hZGRyX3Nsb3Rfc3RhdHVzKGJ1cywgYWRkcik7CgpNYXliZSBoZXJlIHdlIGNv
dWxkIGFsc28gdXNlIHRoZSBzYW1lIHN0YXR1c19tYXNrKCkgd2l0aCB0aGUgb3RoZXIgbWFzaywK
anVzdCB0byBjbGFyaWZ5IHRoZSBkaWZmZXJlbmNlLgoKPiAgCQlpZiAoc3RhdHVzID09IEkzQ19B
RERSX1NMT1RfRlJFRSkKPiBAQCAtMTkxOCw5ICsxOTU5LDEwIEBAIHN0YXRpYyBpbnQgaTNjX21h
c3Rlcl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4gIAkJ
CWdvdG8gZXJyX3JzdGRhYTsKPiAgCQl9Cj4gIAo+IC0JCWkzY19idXNfc2V0X2FkZHJfc2xvdF9z
dGF0dXMoJm1hc3Rlci0+YnVzLAo+IC0JCQkJCSAgICAgaTNjYm9hcmRpbmZvLT5pbml0X2R5bl9h
ZGRyLAo+IC0JCQkJCSAgICAgSTNDX0FERFJfU0xPVF9JM0NfREVWKTsKPiArCQlpM2NfYnVzX3Nl
dF9hZGRyX3Nsb3Rfc3RhdHVzX21hc2soJm1hc3Rlci0+YnVzLAo+ICsJCQkJCQkgaTNjYm9hcmRp
bmZvLT5pbml0X2R5bl9hZGRyLAo+ICsJCQkJCQkgSTNDX0FERFJfU0xPVF9JM0NfREVWIHwgSTND
X0FERFJfU0xPVF9FWFRfREVTSVJFRCwKPiArCQkJCQkJIEkzQ19BRERSX1NMT1RfRVhUX1NUQVRV
U19NQVNLKTsKCkhvd2V2ZXIgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgdXNlIG9mIHRo
ZQpzZXRfYWRkcl9zbG90X3N0YXR1c19tYXNrKCkgZnVuY3Rpb24uIENhbid0IHdlIGp1c3QgdXNl
IHRoZSBub3JtYWwKZnVuY3Rpb24gYW5kIGp1c3QgZXh0ZW5kIHRoZSBtYXNrIGluIHRoZSBmaXN0
IHBsYWNlPwoKPiAgCQkvKgo+ICAJCSAqIE9ubHkgdHJ5IHRvIGNyZWF0ZS9hdHRhY2ggZGV2aWNl
cyB0aGF0IGhhdmUgYSBzdGF0aWMKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pM2MvbWFz
dGVyLmggYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAo+IGluZGV4IDIxMDA1NDdiMmQ4ZDIu
LjZlNTMyOGM2YzZhZmQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAo+IEBAIC0yOTgsNyArMjk4LDggQEAg
ZW51bSBpM2Nfb3Blbl9kcmFpbl9zcGVlZCB7Cj4gICAqIEBJM0NfQUREUl9TTE9UX0kyQ19ERVY6
IGFkZHJlc3MgaXMgYXNzaWduZWQgdG8gYW4gSTJDIGRldmljZQo+ICAgKiBASTNDX0FERFJfU0xP
VF9JM0NfREVWOiBhZGRyZXNzIGlzIGFzc2lnbmVkIHRvIGFuIEkzQyBkZXZpY2UKPiAgICogQEkz
Q19BRERSX1NMT1RfU1RBVFVTX01BU0s6IGFkZHJlc3Mgc2xvdCBtYXNrCj4gLSAqCj4gKyAqIEBJ
M0NfQUREUl9TTE9UX0VYVF9ERVNJUkVEOiB0aGUgYml0bWFzayByZXByZXNlbnRzIGFkZHJlc3Nl
cyB0aGF0IGFyZSBwcmVmZXJyZWQgYnkgc29tZSBkZXZpY2VzLAo+ICsgKgkJCSAgICAgICBzdWNo
IGFzIHRoZSAiYXNzaWduZWQtYWRkcmVzcyIgcHJvcGVydHkgaW4gYSBkZXZpY2UgdHJlZSBzb3Vy
Y2UuCj4gICAqIE9uIGFuIEkzQyBidXMsIGFkZHJlc3NlcyBhcmUgYXNzaWduZWQgZHluYW1pY2Fs
bHksIGFuZCB3ZSBuZWVkIHRvIGtub3cgd2hpY2gKPiAgICogYWRkcmVzc2VzIGFyZSBmcmVlIHRv
IHVzZSBhbmQgd2hpY2ggb25lcyBhcmUgYWxyZWFkeSBhc3NpZ25lZC4KPiAgICoKPiBAQCAtMzEx
LDkgKzMxMiwxMSBAQCBlbnVtIGkzY19hZGRyX3Nsb3Rfc3RhdHVzIHsKPiAgCUkzQ19BRERSX1NM
T1RfSTJDX0RFViwKPiAgCUkzQ19BRERSX1NMT1RfSTNDX0RFViwKPiAgCUkzQ19BRERSX1NMT1Rf
U1RBVFVTX01BU0sgPSAzLAo+ICsJSTNDX0FERFJfU0xPVF9FWFRfU1RBVFVTX01BU0sgPSA3LAo+
ICsJSTNDX0FERFJfU0xPVF9FWFRfREVTSVJFRCA9IEJJVCgyKSwKPiAgfTsKPiAgCj4gLSNkZWZp
bmUgSTNDX0FERFJfU0xPVF9TVEFUVVNfQklUUyAyCj4gKyNkZWZpbmUgSTNDX0FERFJfU0xPVF9T
VEFUVVNfQklUUyA0Cj4gIAo+ICAvKioKPiAgICogc3RydWN0IGkzY19idXMgLSBJM0MgYnVzIG9i
amVjdAo+IAoKT3RoZXJ3aXNlIGxndG0uCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
