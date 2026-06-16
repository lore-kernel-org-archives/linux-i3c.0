Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83060CD98CF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ULvO5BvbQwWC2+Hvb9Ct2vPVyFuD/SxllVTlD7kl+Q=; b=GJsQ5uzswelMZ1
	b3voqD9aUpcEhzCZGQbA3zY72LnY6Anq5NkqVrUjaAFTJX0yznLCzNFdtNPVlVTgqAmTJDHYIEY3a
	KDdc788S835bPlJBg7HLcPEBCjPgmpw2DsAw7DwoAiwKqs30WE6cI8thC9p78pqo02GJAB5Gmy5Sx
	VnP9gw+V5T/oCJNbWHFeh+B85xCqeEGmnmHuKENLG8BJ1qL1of/OfyMfNWUMnSe6UI+h3uToxcFiI
	an4TR87fFe8Wr900vzLvHQhorcnppqcBxVNz7JuRC76QXa1qAmfXHieDRkxCDLjic37cAACJEA1jD
	qWB74tlvIeZg7CuLqVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQk9-0000000FZjF-0xjK;
	Tue, 16 Jun 2026 10:10:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQk8-0000000FZiu-2Ky4
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8295F601DD;
	Tue, 16 Jun 2026 10:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D4D1F00ADF;
	Tue, 16 Jun 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604603;
	bh=7BOuOW+gx8Zukt1P3EBkLq6Bwvz9gfQYmCoCyoMelJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2BoJrQpSnonZxDaDdWu81uAvwmPZqjAw00wkj49eZt6ujR80LGL29k+yznKCZExR
	 Inm0neB7S2ZaTSVr+x8jAzWXqRhm6v9t1eHXM+1xa4iklH9cjhiZre/36bHdeGErC7
	 gdc6l9heBHFWhQkczIJ95LPBH3mAD/HQX9TTaOnUVEXSV0BC20VAe5UTDX8M1AyYVe
	 slcCZu8tRiZHZxeOFL1fT5G60douk6NfV39bnM/fMbG0eyuzMKZePeTMHwOGsLoEdb
	 FlNHimdgKZrMcBPnzIGgPTkv/TmYTxNgtV6al6/MFmpt1GWMisfiivJtjVSJnPBmRY
	 8OOsPIgO/3CRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:10:01 +0000
Message-Id: <20260616101001.C5D4D1F00ADF@smtp.kernel.org>
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

PiBFbmFibGUgSTNDIHN1YnN5c3RlbSAoSTNDKSwgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFz
dGVyIGNvbnRyb2xsZXIKPiAoRFdfSTNDX01BU1RFUiksIGFuZCBTUEQ1MTE4IGh3bW9uIHRlbXBl
cmF0dXJlIHNlbnNvciAoU0VOU09SU19TUEQ1MTE4KQo+IGFzIG1vZHVsZXMuCj4gCj4gVGhlIE5W
SURJQSBWZXJhIENQVSB1c2VzIFNPQ0FNTSBMUEREUjVYIG1lbW9yeSBtb2R1bGUsIHdoaWNoIGNv
bnRhaW5zCj4gU1BENTExOCAoSkVERUMgSkVTRDMwMCkgY29tcGxpYW50IHRlbXBlcmF0dXJlIHNl
bnNvci4gVGhpcyBzZW5zb3IgaXMKPiBhY2Nlc3NpYmxlIG92ZXIgdGhlIEkzQyBidXMgdGhyb3Vn
aCB0aGUgRGVzaWduV2FyZSBJM0MgY29udHJvbGxlciBwcmVzZW50Cj4gb24gdGhlIFNvQy4gRW5h
YmxpbmcgdGhlc2UgY29uZmlncyBhbGxvd3MgbW9uaXRvcmluZyBtZW1vcnkgbW9kdWxlCj4gdGVt
cGVyYXR1cmVzIG9uIHBsYXRmb3JtcyBzdWNoIGFzIFZlcmEgUnViaW4uIFZlcmEgaXMgYW4gQUNQ
SS1iYXNlZAo+IHBsYXRmb3JtIGFuZCBkb2VzIG5vdCB1c2UgZGV2aWNlIHRyZWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFz
IHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQh
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNjE2MDk1NDI5LjM5NDcyMDUtMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MTIK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
