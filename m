Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15838C982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhhHU9OUFoJG8SBidl6MkFRC6sTn9HmdoVcpUeAXigs=; b=3r/nAXi0e+V6K3
	VwpAq5Ah3M3GGwxgeh28OZ9jd4CwtgmRYGVl5qQmkSI9Q/JxVHff+snzeoRDo4ZKn/7akbAqHQtsy
	n4DTlHkVzyZpww1IMNqiGxZcxJ/CbCec2xwND8dcCKpe3roNr6WIoGTbFOR0novUB5HrJEpaMBYb7
	fUDqbsmsYXVB3q22Qh3zb0RGAh60FT0mn2HhrwlS4Wk1rMRPw030usOEOp+OFfgQAMqmpaUYbyiED
	WDkbfV+Ss6HFIMYjNwVBG5TJylYN8Tw++sgS71hEkf+7vq2GhTS9EhFgcY2ZaLUNLYCCaO1SYaudB
	oqhqz74uaSjhUTeMrsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y24-0000000569W-3DQA;
	Tue, 22 Sep 2026 10:47:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y23-0000000569K-3XPT
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E8CA6021C;
	Tue, 22 Sep 2026 10:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9121F000FF;
	Tue, 22 Sep 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074046;
	bh=D4xt0EQqkbQ4QpGr/rWEfLBSlUeslFGA4wmWm+gy+4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHBegxnmYqFCdMTEazxdAjbs/5mie58S9/aKqW6Y1JsNdqVg88UYFYvhey1/4SMnh
	 9AMUlF9FtY9Ewi4OuAMcRCbDD+pdLNPTzMgBFICHgYU3qf7H0gFT7Az7pZCYx3qHpp
	 XphNhteU0lhlyYPQPKv0Bxlbp6Wy2+90BVaZoE0LD+Mdjlu5Mjxy/Io0B8Y27xjsnm
	 v7Ol2jpDeiVRqP8kUffH9DLXOFPyixbwkME4izv2b6O54Vh1SPh7p4gTYvURVXECWi
	 aHtLFeXag9xxwX1DF916u/6ZzOEBtojKnNReP0c7blfRDfkqGOocU3QEgNwVEtJshW
	 d2KY86qJlOqgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260922103551.2754613-6-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-6-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:47:25 +0000
Message-Id: <20260922104726.6A9121F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbWZkOiBkcml2ZXItc3Bl
Y2lmaWMgaGVhZGVyIHBsYWNlZCBpbiBnbG9iYWwgaW5jbHVkZSBkaXJlY3RvcnkKLS0KCmNvbW1p
dCA1MWQyMDRhZWQwZDUxODI4ZDFlNjhhMGFjMGExMGY4YzhjYWMzMTFiCkF1dGhvcjogQW1hbiBL
dW1hciBQYW5kZXkgPGFtYW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KCnJlZ3VsYXRvcjogcDNoMng0
eDogQWRkIGRyaXZlciBmb3Igb24tZGllIHJlZ3VsYXRvcnMgaW4gTlhQIFAzSDJ4NHggaTNjIGh1
YgoKVGhpcyBjb21taXQgYWRkcyBhIHJlZ3VsYXRvciBkcml2ZXIgZm9yIHRoZSBvbi1kaWUgcmVn
dWxhdG9ycyBpbiB0aGUgTlhQClAzSDJ4NHggaTNjIGh1YiBkZXZpY2UsIHJlZ2lzdGVyaW5nIHRo
ZW0gdmlhIHRoZSByZWd1bGF0b3Igc3Vic3lzdGVtIHVzaW5nCnRoZSBNRkQgZnJhbWV3b3JrLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRv
ci5jIGIvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4yNDRmMmE0ZjcwZjM4Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9y
ZWd1bGF0b3IuYwo+IEBAIC0wLDAgKzEsMjg5IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAyMDI1LTIwMjYgTlhQCj4gKyAqIE5Y
UCBQM0gyWDRYIHJlZ3VsYXRvciBkcml2ZXIgZmlsZSBjb250YWluIGZ1bmN0aW9ucyBmb3IgZW5h
YmxlL2Rpc2FibGUgcmVndWxhdG9yCj4gKyAqIGFuZCB2b2x0YWdlIHNldC9nZXQuCj4gKyAqLwo+
ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L21mZC9wM2gyODQwLmg+CgpbU2V2ZXJpdHk6IExvd10KRG9l
cyB0aGlzIGluY2x1ZGUgdmlvbGF0ZSB0aGUgTUZEIHN1YnN5c3RlbSBndWlkZWxpbmVzIGZvciBk
cml2ZXItc3BlY2lmaWMKaGVhZGVycz8gCgpUaGUgTUZEIGd1aWRlbGluZXMgc3RhdGUgdGhhdCBk
cml2ZXItc3BlY2lmaWMgaGVhZGVyIGZpbGVzIHVzZWQgb25seSBieSB0aGUKcGFyZW50IGFuZCBp
dHMgaW1tZWRpYXRlIGNoaWxkcmVuIHNob3VsZCBiZSBrZXB0IGxvY2FsIHRvIGRyaXZlcnMvbWZk
LwpyYXRoZXIgdGhhbiBiZWluZyBwbGFjZWQgaW4gdGhlIGdsb2JhbCBpbmNsdWRlL2xpbnV4L21m
ZC8gZGlyZWN0b3J5LiBTaW5jZQp0aGlzIGhlYWRlciBhcHBlYXJzIHRvIG9ubHkgYmUgdXNlZCBi
eSB0aGUgcDNoMjg0MCBwYXJlbnQgYW5kIGNoaWxkcmVuLApjb3VsZCBpdCBiZSBtb3ZlZCB0byB0
aGUgbG9jYWwgc3Vic3lzdGVtIGRpcmVjdG9yeSB0byBhdm9pZCBwb2xsdXRpbmcgdGhlCmdsb2Jh
bCBpbmNsdWRlIHNwYWNlPwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyMjEwMzU1MS4yNzU0NjEzLTEtbGFrc2hh
eS5waXBsYW5pQG54cC5jb20/cGFydD01CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
