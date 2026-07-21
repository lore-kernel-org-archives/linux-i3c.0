Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B692DC4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QJyHLrMmJQVwynvn744i4xp0e5XuarCi7ys8K09U58=; b=0ocVYtbKynb3cB
	Cu48iKjoHtfAQYgz6KugVCOlMrTpfzMn7Wr6E/InsGbpb5fF34ydmVhk3/IOyPCCmAo/nGz14hNk1
	qyiR43DUGb88QZ5mosWu3aWh0eq8+WAzDll0h5umjdinbs8w9EIpGJaVkEIRmTU+r00w2Iev0sy5g
	kstcjryDDw5aLtfNQ0PYzXRQe+YdOHueeQU7KgwN3Gr1GxRQxgPDbw96o/eDVwygsxhgmD8Rhjw1d
	GRcUxNY6hvmjrk2dDWJn7oN8Iaqdqv77GYJ9qpTMMjvZKkQr69nqLJbtgdU/GRpwN4XxgZ6OsleNB
	b7c7xkYGHS0xTqISu8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm29H-00000008O1r-1kfp;
	Tue, 21 Jul 2026 04:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm29G-00000008O1c-0HEM
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF9A84044E;
	Tue, 21 Jul 2026 04:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD641F000E9;
	Tue, 21 Jul 2026 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608325;
	bh=gchuhNX3Cm3qEU9s8NSnllvg2K6FBI7zaHk54DYmSU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zv7rlnYrLtRmkNYiFtgMhvMxkjczpc3Ey/qubOapQUjZNydYxNeavpS+/N2/1iXqA
	 bcFroxpVZ8eE6IymgDnQ7kUeBznVh7m9smdFqOepdsiXPyPKI/pyo9wfAIu5DDeVKq
	 EuWYXrrFIazg2Iu7uhvuOGGAP9CosuETx5IuSh3rwdQuHIqU87Pt4W/1lnjGt5uHAS
	 9gDGprWCWwQi+ldW9yTVJseRH35hAr38WBYhmmFUf+xGt3DjOfaj2uuNdY7plazQax
	 VFP/d96ANZ/WIaT16R6ZI+c4cDAB4zITqgGzkNXiJhQIi0m6l1ZA+8LGVAYJdVLLlW
	 Dlco/68hsA+/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/12] i3c: master: Support ACPI enumeration of child
 devices
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721040805.1696503-4-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-4-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:32:04 +0000
Message-Id: <20260721043205.4CD641F000E9@smtp.kernel.org>
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
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMTA0MDgwNS4xNjk2
NTAzLTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTMKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
