Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DEC982FA
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwMLD+cF2B2WV8QhchqNADrxH4F/LgZLhVzYChVAh6c=; b=tVkNnU4NsG0aWE
	ap+yjpJPT5Eo+0N5h2BuMkYambwoLGjEvLzP8G0DsunhO/GWdsWY3WDY3TEWprr1kqXvtDY+PYfR3
	/78OTpJCCeenna7ipgvn/BHLGADr38TubuQlFPmjV0RGeJHScRVmAqufO8ALnevVrXfeJQ8jYjPBA
	FMKbDC5THpEokJY8X+RO+1S1MTZJoLSVHmvoLvBQwatBDt4e3sUq18Rou7THLmjHYBej6w/ZMuFQh
	N6zYXHAlY7fIdkg+HylulUU7ik5fPSxZqaRsgex0V/YW1arMpRCPiIsFtIcvfgkSkis9F7eQkPSH0
	qXy3Y/yXi/Du1a94thwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y0Q-000000055zf-2cem;
	Tue, 22 Sep 2026 10:45:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y0P-000000055zV-2a65
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1296860200;
	Tue, 22 Sep 2026 10:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7391F000FF;
	Tue, 22 Sep 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073944;
	bh=nVxyrfCQFPSApsZDSeDL/PcTWxFJTClisSLxR0rtgDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W36oTAUqySHqrJrbRof6cciqa7UJKMgRd2Ikp9tca3djn7y3bFzP++AbqfxfcZIG9
	 L6HjAPEqBT3WuVP0AbvDyA7LRaxbxw4sc3KWnk8fYZ2987m0eAAaDhSB9VU0GGk0lN
	 k14gW04kgtrJOMcrJNJcoXXkF5xzvYsyQMwxTxw8hv95rTkc7zy/R9bsktM7Cf7Km5
	 YF6bWxLgsrCUqoxhyMcsSFoOYxrNhxTX70BxS1NVLvdVNm6UNit0usmgBHeRAjja8N
	 jkosByYfGjTQIPwklgpFnZx+1ke7mprq7B9NAVbA4EUe4RIqBGXkaoHKH7kdp8jiP3
	 0Uo5dxsq3HEWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 2/8] i3c: master: Add controller-only device
 operation helpers
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260922103551.2754613-3-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-3-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:45:43 +0000
Message-Id: <20260922104544.4A7391F000FF@smtp.kernel.org>
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

PiBUaGUgZ2VuZXJpYyBJM0MgZGV2aWNlIGF0dGFjaCBhbmQgSUJJIHBhdGhzIHBlcmZvcm0gYm90
aCBjb3JlLWxldmVsCj4gYm9va2tlZXBpbmcgYW5kIGNvbnRyb2xsZXItc3BlY2lmaWMgb3BlcmF0
aW9ucy4gQW4gSTNDIGh1YiwgaG93ZXZlciwKPiBtYWludGFpbnMgYSBsb2dpY2FsIGRldmljZSBk
ZXNjcmlwdG9yIG9uIHRoZSB2aXJ0dWFsIGRvd25zdHJlYW0gYnVzIGFuZAo+IGEgc2VwYXJhdGUg
cGFyZW50LWZhY2luZyBkZXNjcmlwdG9yIHVzZWQgYnkgdGhlIHBoeXNpY2FsIHBhcmVudAo+IGNv
bnRyb2xsZXIuCj4gCj4gQWRkIGNvbnRyb2xsZXItb25seSBoZWxwZXJzIHRoYXQgaW52b2tlIHRo
ZSBjb250cm9sbGVyIGNhbGxiYWNrcwo+IHdpdGhvdXQgdXBkYXRpbmcgdGhlIGJ1cyBkZXZpY2Ug
bGlzdCwgYWRkcmVzcy1zbG90IHN0YXRlLCBvciBnZW5lcmljIElCSQo+IGxpZmVjeWNsZS4gVGhp
cyBhbGxvd3MgdGhlIGh1YiBmcmFtZXdvcmsgdG8ga2VlcCB0aGUgbG9naWNhbCBkZXNjcmlwdG9y
Cj4gYXNzb2NpYXRlZCB3aXRoIHRoZSB2aXJ0dWFsIGNvbnRyb2xsZXIgd2hpbGUgdXNpbmcgYSBw
ZXJtYW5lbnQKPiBwYXJlbnQtZmFjaW5nIGRlc2NyaXB0b3IgZm9yIG9wZXJhdGlvbnMgaGFuZGxl
ZCBieSB0aGUgcGh5c2ljYWwKPiBjb250cm9sbGVyLgo+IAo+IEFkZCBoZWxwZXJzIGZvcjoKPiAg
IC0gYXR0YWNoaW5nLCByZWF0dGFjaGluZywgYW5kIGRldGFjaGluZyBhIGRldmljZSBmcm9tIGEg
Y29udHJvbGxlcjsKPiBbIC4uLiBdCj4gaW5kaXZpZHVhbCBjb250cm9sbGVyIGRyaXZlcnMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTGFrc2hheSBQaXBsYW5pIDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBu
eHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpa2FzaCBCYW5zYWwgPHZpa2FzaC5iYW5zYWxAbnhw
LmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vl
cy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMTAzNTUxLjI3NTQ2MTMtMS1sYWtzaGF5LnBpcGxh
bmlAbnhwLmNvbT9wYXJ0PTIKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
