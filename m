Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642CCCDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z08dshxtInQv5RFvZmKFV1sColEa3DHfy0FJGa6HsoQ=; b=fAOB+zTn7wzbtx
	lrzADJSac6kHM2mFmwiOwic65rHT2/1A9W6zZu+hfBgXsTGFBqyombLaKoN79y/HmhdeK2tlpOqif
	AOJjZD7rqzsfXByj/S2z/5hyKy1wjKlVrplouXMVcvuNAyvRAaA6jKyZFBBK3qpdIPfO5V4ITNgIS
	x3WIRSSJLR1MUT2X4X7U55InWz+atEDAEQR6ZuIshQa+y8zp8xmHixgWP1yR45HVo8i1FetyGJduf
	afULwJXSaftRlqbUVrtJMmW1MMG2xLO3V+/RusLMh8CWKSpqt6jjakKY13xZ9mgfMkisXlQLACB/x
	GrfXHF4YObo3SwZ5UB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL0H-00000007cIA-0YOn;
	Wed, 24 Jun 2026 10:38:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcL0G-00000007cI4-1ZAt
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CE8160018;
	Wed, 24 Jun 2026 10:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7881F000E9;
	Wed, 24 Jun 2026 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297523;
	bh=z3Jh5DdsxOixayV/P5ernUEaHyuGcHZeJjmYLYS9J9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkguZPjdzfr55Zk6zR1Ryla2eImv4Y8FLHYHieOFoqAqN4ZcAYaJTeyNcDrKwnUIt
	 FRfCYlwlnGkVUg+AhzHbSxE4YC6L/4rbzT7cBqidogDlOKVwV3WcEblM6XvQWU8usf
	 lLebRdDbGNEFoikE+wyVdKOnGChn54kv/lbNk6477tPZpfs9WksxYRQo1knna7V+/J
	 VTXcu1kQLmIFyxCKx376W1vJM1pRUWzd1+hWjAcVLdQTy3QUrbrPFU813AyEUO9GiQ
	 6dCriHraK72DvNkJtRut6U0bAT+IsvCqyXLzaEibvhTJbHt28ikfWq5pk2PBHsarur
	 GJn90xPXSUoSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] i3c: master: Support ACPI enumeration of child
 devices
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-4-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-4-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:38:42 +0000
Message-Id: <20260624103842.AB7881F000E9@smtp.kernel.org>
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

PiBBbHRob3VnaCB0aGUgZXhpc3Rpbmcgc3Vic3lzdGVtIGFsbG93cyBob3N0IGNvbnRyb2xsZXJz
IHRvIHJlZ2lzdGVyCj4gdGhyb3VnaCB0aGUgQUNQSSB0YWJsZSwgaXQgd2FzIG5vdCBwb3NzaWJs
ZSB0byBkZXNjcmliZSBJM0Mgb3IgSTJDCj4gZGV2aWNlcyB3aGVuIHVzaW5nIEFDUEkuIFRoaXMg
aXMgYmVjYXVzZSB0aGUgZHJpdmVyIHJlbGllZCBvbiB0aGUgcmVnCj4gcHJvcGVydHkgdG8gcmV0
cmlldmUgdGhlIFBJRCwgc3RhdGljIGFkZHJlc3MsIGV0Yy4sIHdoZXJlYXMgQUNQSSB1c2VzCj4g
X0FEUiBvciBzZXJpYWwgcmVzb3VyY2VzIHRvIGRlc2NyaWJlIHN1Y2ggZGV2aWNlcy4KPiAKPiBS
ZWFkIF9BRFIgYW5kIExWUiBmcm9tIEFDUEkgcmVzb3VyY2VzIGFuZCBleHRyYWN0IHRoZSBkYXRh
IGFzIHBlciB0aGUKPiBBQ1BJIHNwZWNpZmljYXRpb24gZm9yIGFuIEkzQyBidXMuIEFsc28gcmVh
ZCBtaXBpLWkzYy1zdGF0aWMtYWRkcmVzcyBhcwo+IHBlciB0aGUgTUlQSSBESVNDTyBzcGVjaWZp
Y2F0aW9ucyBbMV0gdG8gZ2V0IHRoZSBzdGF0aWMgYWRkcmVzcyB0byBiZQo+IHVzZWQuCj4gCj4g
RW5hYmxlIGRlc2NyaWJpbmcgSTNDIG9yIEkyQyBkZXZpY2VzIGluIHRoZSBBQ1BJIHRhYmxlLiBU
aGlzIGlzIHJlcXVpcmVkCj4gaWYgdGhlIGRldmljZSB1c2VzIGEgc3RhdGljIGFkZHJlc3Mgb3Ig
aWYgaXQgbmVlZHMgZGV2aWNlLXNwZWNpZmljCj4gcHJvcGVydGllcy4KPiAKPiBbMV0gaHR0cHM6
Ly93d3cubWlwaS5vcmcvbWlwaS1kaXNjby1mb3ItaTNjLWRvd25sb2FkCj4gCj4gUmV2aWV3ZWQt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIg
PGFraGlscmFqZWV2QG52aWRpYS5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNo
IGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYyNDEwMjE1My4xNzcw
MDcyLTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTMKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
