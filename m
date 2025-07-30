Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F4C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTcHOBDqxHQg/MWuuT8UFEXmqhpG7IPp8b9nzlXkeNg=; b=wsW2unCwXg8KUm
	nYVogQQ4tutNi79cUoLNFaJEcM0Le+xb/HYOq0MTsVm2+snz5gfbRc1Y4zT1dkW7bcXhd17bqitjB
	7/j3K/KitGlDYtz++caEjMfquLUWIHj6VxYEBhtfCorWCwN12318ap5OyYyIz+oFstU1oIjrXiM6f
	aUPNVqxcy1ki8YGz0XG6QVMEre/nMaCu2nz2lEXwUFr621c58osIVbwPBfD2RzLToEEszyBHnL5pw
	acvUih4Qxo27KI4p08s/S21GIuLycrUywq7MFPcnMGAlxQ+xTaupenHrdOiOfRz7IyjR2U5qEBUuG
	/BiYzY4AIReLNCbw4IDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5tS-00000001SrP-3RpN;
	Wed, 30 Jul 2025 12:26:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5Bq-00000001NL1-3XZi
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 11:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=wTJFC/rBZn6EaB3dYmmQkW+Ex7rlUbFAm/dPKlXQF
	MI=; b=lmuLtmhVGDuX3QAePj0eWZkGdrhTYFVtAxfes6IFxKHklMcTcYYJQxPmP
	8mjAVMWbJhifI/6d54/FghDvFXbHWsKNyJNbWX7fuMVfpiM2dgmq0LSpidcQ7a1L
	nuzeGsvCnAoIu807S0I3VYozgXhdGCHkgjOEL9swWhv6hmFn+KqkIlCsB6yvQLv2
	H//2oMlPLFpwIZxAKNVx05OusB7BtM8DqaBwzxyepQp6fZroZqq7EBXjbz6GARbO
	KgXzhVMOUzD+OxUKBTl4S7CT9t6WTBWWNOipxmJE7UkGbwBxro7b6q8RIBX+X1aa
	eWbcJUUGSM/HvZeNTMXtvUuyTu1pA==
Received: (qmail 4157829 invoked from network); 30 Jul 2025 13:41:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2025 13:41:42 +0200
X-UD-Smtp-Session: l3s3148p1@ZUgtAiQ73mltKPJf
Date: Wed, 30 Jul 2025 13:41:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Durai.ManickamKR@microchip.com
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	Hari.PrasathGE@microchip.com
Subject: Re: [RFC] SAMA7D65 SoC I3C controller driver
Message-ID: <aIoE9ejPYwzswk2B@shikoro>
References: <cbe773d1-f056-49b1-8c64-eea57ca8a9ea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbe773d1-f056-49b1-8c64-eea57ca8a9ea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_044147_755030_F465CD67 
X-CRM114-Status: GOOD (  11.43  )
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

SGksCgo+IFNvIG15IHF1ZXJ5IGhlcmUgYXJlLAo+IAo+IDEuCj4gIMKgwqAgV2hldGhlciB0aGlz
IGFwcHJvYWNoIGlzIGNvcnJlY3Qgb3Igbm90Lgo+IDIuCj4gIMKgwqAgSW5zdGVhZCBvZiBjcmVh
dGluZyBhIG5ldyBkcml2ZXIgZmlsZSwgc2hhbGwgd2UgaW50cm9kdWNlIGEgcXVpcmNrCj4gIMKg
wqAgZm9yIE1pY3JvY2hpcCBJM0MgYW5kIGludGVncmF0ZSB0aGUgY2hhbmdlcyBpbiB0aGUgZXhp
c3RpbmcgZHJpdmVyLgoKSXQgZGVwZW5kcywgSSB3b3VsZCBzYXkuIEkgd291bGQgc3RhcnQgd2l0
aCBhcHByb2FjaCAyKSwgYnV0IG1heWJlIG5vdApjYWxsIGl0ICdxdWlya3MnIGJ1dCAnY29uZmln
Jy4gSWYgdGhlIGNvZGUgc3RheXMgcmVhZGFibGUgd2hpbGUgd29ya2luZwpvbiB0aGF0LCBpdCBw
cm9iYWJseSBpcyB3b3J0aCBpdCB0byBmb2xsb3cgdGhhdCByb2FkLiBJZiB5b3UgYXJlIGFkZGlu
ZwpzbyBtdWNoIGNvZGUgaGFuZGxpbmcgdGhlIGRpZmZlcmVuY2VzIHRoYXQgdGhlIHJlc3VsdCBp
cyBoYXJkbHkgcmVhZGFibGUKYW55bW9yZSwgdGhlbiBhcHByb2FjaCAxKSBtaWdodCBiZSB0aGUg
YmV0dGVyIG9uZSBpbiB0aGUgZW5kLiBJIGRvbid0Cmtub3cgeW91ciBoYXJkd2FyZSwgc28gSSBj
YW4ndCBndWVzcy4gQnV0IHlvdSBtaWdodCBhbHJlYWR5IGhhdmUgYSBndXQKZmVlbGluZyB3aGlj
aCBpcyBiZXR0ZXIuCgpUaGlzIGlzIGhvdyBpdCBpcyBoYW5kbGVkIGluIG1vc3Qgc3Vic3lzdGVt
cyBJIHdvcmsgd2l0aC4gTm90ZSB0aGF0CkZyYW5rIGFuZCBBbGV4YW5kcmUgaGF2ZSB0aGUgdWx0
aW1hdGUgY2FsbCBoZXJlLgoKSGFwcHkgaGFja2luZywKCiAgIFdvbGZyYW0KCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
