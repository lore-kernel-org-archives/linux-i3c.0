Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73478C5321E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUagQFQ6emkY6yC3sWaVt3e8qL/vueAVo6mN2cgjrVU=; b=UsTadGhGwILpXu
	xXVY8KfJLIE5nm2e4V2KfwyyH7Lh7Fr6moQr6+rg37SdSib90MgKZ24pbT0en4lIonKkgyHsRZlf1
	k5Co2kXZfrnUJ2k2HhgVNJwIpjCgQEg9Dcu85lJGkjjB1obOO4njnByiet53O8V9rATPLPsPXe5SJ
	W5ePgpVU29dItWcgAsGWCkzMKeP0/HktBKPH45/cncqtfLdHgNTQmeRd8KFoJaA79WGz792NabfMy
	yE4ki0hZRtcfDQb8Zkyi5ruyGpNOAZENN+EhKDQQY9yQdmjnNWoumTxNwKS+L+fAB8Rzs2cpMwncJ
	GjXbtZSftNJTN6w7KPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUjV-00000006OuQ-0gaK;
	Mon, 26 Aug 2024 08:05:49 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUjR-00000006Oro-28ZM
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 08:05:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D470C0005;
	Mon, 26 Aug 2024 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724659542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUfynww9JqKqKGzCXlxZMuLsQyJsqzi9oRVn77PikaQ=;
	b=bYohC2yKZ1VYQb5LTct07W1+fzs/2zjlzCi6uIJoDBmsBf/MISkSxNzErDxwEExxo9wotR
	LnLrP4smxQxp4r3i2QtIPswcdXKr1LoymeddrDX6ui8kIk48yZBeis4FHxJVZKLu26ksqA
	7DCPB/FW7QmlyKZcMNfsdY32D8GZyplRcd350vOoP8Wd9PSRF3Amn7CLogypaYUptT51qI
	ovFrvEZCSETg2GD0TN5xZaIWmm4oRCuXuF1LFSC2epjxTMZgg/Ms/UZmBES86jSCV7J25L
	cT5mlCdsxN/UATefV8KbNnZULfACCWACRSq7MPhNhBbUaj+GAS41McFI8CVMeg==
Date: Mon, 26 Aug 2024 10:05:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 02/11] i3c: master: Replace hard code 2 with macro
 I3C_ADDR_SLOT_BITS
Message-ID: <20240826100539.7f93f8b9@xps-13>
In-Reply-To: <ZsjNi4RQ+GKxZpUH@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-2-7d69f7b0a05e@nxp.com>
	<20240823175502.3d518a69@xps-13>
	<ZsjNi4RQ+GKxZpUH@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_010545_710411_44AFC387 
X-CRM114-Status: GOOD (  13.33  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjMgQXVnIDIwMjQgMTM6
NTc6MzEgLTA0MDA6Cgo+IE9uIEZyaSwgQXVnIDIzLCAyMDI0IGF0IDA1OjU1OjAyUE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+Cj4gPiBGcmFuay5MaUBueHAu
Y29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6MDE6NTYgLTA0MDA6Cj4gPiAgCj4gPiA+
IFJlcGxhY2UgdGhlIGhhcmRjb2RlZCB2YWx1ZSAyLCB3aGljaCBpbmRpY2F0ZXMgMiBiaXRzIGZv
ciBJM0MgYWRkcmVzcwo+ID4gPiBzdGF0dXMsIHdpdGggdGhlIHByZWRlZmluZWQgbWFjcm8gSTND
X0FERFJfU0xPVF9CSVRTLiAgCj4gPgo+ID4gSSdtIGZpbmUgd2l0aCB0aGUgaWRlYSBidXQgSSBk
b24ndCB1bmRlcnN0YW5kIHRoZSBtYWNybyBuYW1lLiBZb3UncmUKPiA+IHRhbGtpbmcgYWJvdXQg
c3RhdHVzIGJpdHMgYW5kIHlldCB0aGUgbWFjcm8gaXMgbmFtZWQgYWRkcl9zbG90Pwo+ID4gIAo+
IAo+IEhvdyBhYm91dCBJM0NfQUREUl9TTE9UX1NUQVRVU19CSVRTID8KPiAKPiA+ID4gSW1wcm92
ZSBtYWludGFpbmFiaWxpdHkgYW5kIGV4dGVuc2liaWxpdHkgb2YgdGhlIGNvZGUuICAKCkknbSBh
IGJpdCBmbGFreSBvbiB0aGlzIGNvbmNlcHQsIGJ1dCBsZXQncyB0cnkgdGhhdC4gUGVyaGFwcyB3
aXRoIGFsbAp0aGUgY2hhbmdlcyByZXF1ZXN0ZWQgKGVzcC4gcmVwaHJhc2luZykgaXQgbWlnaHQg
YmVjb21lIGNsZWFyZXIgaW4gbmV4dAp2ZXJzaW9uLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
