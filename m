Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0628CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51Zzd7SVjInZpVGabnFh0eF9GJq9ieMB845RjpM0Sjo=; b=Ix+5oP2yz5PuWB
	HdfXBNzllDmvLsY4EiFkZK6ich3cQ97Fta3vnZrUCl/hEOlAs62/RaG1zq5InMv3xz10nkuo93iWr
	PnlhpAUm2ny5p4UxXvuWPTlQ04EWaC5HTZtPjngGh3rB/iFSlaxSTCuGkbj7OGG7rb4rAz2qZMrTt
	Bx8sBpfVvyjc076Mz71qGIsk/ftmLPp8GocTXn/sCPcdw8e7yOzK19DYhfPcVXIwUO8aUmvg9yxO2
	ARZFxGBwnJVpp2Pc7TXP5i/xEALcSc3/PHi8QtNu5QHwyKXqhgobYP5oR15P2f1ny6NKTDdGb+kVK
	kUDDVyupytbLBhH+/62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL1e-00000007cOw-1aNU;
	Wed, 24 Jun 2026 10:40:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL1c-00000007cOF-2cnL
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18A6060018;
	Wed, 24 Jun 2026 10:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF551F000E9;
	Wed, 24 Jun 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297607;
	bh=sNQcbU9jq5Q1C6M1igkTJ5uH7ZYJRL4v9cEDKjSD9OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBYRqqK4Py7lbVR8sfHSxd0B4z/6WhrVHwKK+G+vk+O20tKctY5qrdHPqtaXsiokb
	 GbYdK0pSjYW6JLTvgikEs3317Tsmb4MO0gdNl1cJNK7ra8ZI89NLoOiXSC7EXpYq4v
	 cr1y238BIWg1PPIkoSLccboAsEHkvu9OpwkAKt5pgGYZnfbaZ9iGIdYeRu7qy5eJD2
	 JpZp64tJarvaiKGTmESWO5Ph1+wZ3wDUGTs+fHoGKL6C/tBZloQDrYtrwulHksGBs1
	 JDLerw8uqzNHz9ojzfIFQPbuKPtKckDenmbOltP0pJesiS73J10XXVITNRhg8kpCcW
	 lucylv3i8AmkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-13-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-13-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:40:06 +0000
Message-Id: <20260624104007.4BF551F000E9@smtp.kernel.org>
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
LzIwMjYwNjI0MTAyMTUzLjE3NzAwNzItMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MTIK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
