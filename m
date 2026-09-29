Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1878DCA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arL5VjBiINbv6SlgRY0JxwtINdxMYkN7mc0LYSkL0NA=; b=m5bD/0/JO4vqIW
	yur2/2AJ8A7BBPgI1806165HHwFWhuf5bN6QLm+4+abDx6Q0NehXVw2MdBo9FdR4fugkfEbnqJO6Y
	GmcpTLQfOFebRCU7skewfLPy0vTPJmYJqRQbH7YAMABga/PCEVdKpfXry86QH7QVe27rstm6wdeEJ
	JaPsl0MnyFJWfTraL3MKSpE7uXWdmdyUh3Iv1FI3vyjoHdMHuGCkV2VQpogd2osKWJWqqV1wCvBMx
	Ko5poTdYt2l5ufsplgxYHNr6WgSp7sCSAS/31veS/a7g6ZzZTOSXZpLRA4/GYK0cpo3IJofjGgGDu
	z20lq9hu2eoGOw8JDjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRb9-00000002WO2-3NpF;
	Tue, 29 Sep 2026 06:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRb8-00000002WNU-0O7I
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:45:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE45443408;
	Tue, 29 Sep 2026 06:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D401F00893;
	Tue, 29 Sep 2026 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664353;
	bh=5J5RXXCLjh+TffupwBrVSwaI8V+2cqKZtM4RZs43XcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oInz0bZDPYkUh3oJ6CnsxiotsehDi7RcYQ/g8shcFjqNDkrwOBd/RWNswqsX5wTtT
	 21X7vagxTtv1EDf87Vx2tYVaXlFgR3haHus8sJxpQOJnEY0L69mWWfYTnJkW0bqCWO
	 DVIqH3G1u33eciPgNbOyfpoKQdJOq5abNQp1oSX8prUz30DGKGW3CUm9S8W5wzvFy2
	 QrMMYSKlE93K+8SnTrISePj9Bwx+s5xvXgyi4hmV6qt+jAWwCjaCK2amL71itd0bh1
	 hQITe+ujQ7y7SXhZpbAB3g6EXCUjFxwiN2SHE+DZTC6y6b13HLpGN4kbhazRYMThKk
	 /dsj4Ajdd8+fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/20] dt-bindings: pinctrl: berlin: Support Synaptics
 SL261X SoCs
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, linux-clk@vger.kernel.org, lee@kernel.org, linux-serial@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260929061417.20733-14-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-14-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:45:52 +0000
Message-Id: <20260929064553.18D401F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IHBpbmN0cmw6IHVuZG9jdW1lbnRlZCBzY2hlbWEgcmVsYXhhdGlvbiBmb3IgYWxsIFNvQ3MKLS0K
CmNvbW1pdCA4NWI0ZGVmNTdhOGE5YmUxOWNmYmIwN2NhMzg5MDk4ODMyZjM2NzBhCkF1dGhvcjog
SmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpkdC1iaW5kaW5nczogcGluY3RybDog
YmVybGluOiBTdXBwb3J0IFN5bmFwdGljcyBTTDI2MVggU29DcwoKVGhpcyBjb21taXQgYWRkcyBk
ZXZpY2UgdHJlZSBiaW5kaW5nIHN1cHBvcnQgZm9yIHRoZSBTeW5hcHRpY3MgU0wyNjFYIFNvQ3MK
dG8gdGhlIE1hcnZlbGwgQmVybGluMiBwaW5jdHJsIHNjaGVtYS4gSXQgYWxzbyBtb2RpZmllcyB0
aGUgc3Vibm9kZSBzY2hlbWEKcmVmZXJlbmNlcyB0byBpbmNsdWRlIGdlbmVyaWMgcGluIGNvbmZp
Z3VyYXRpb25zLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvbWFydmVsbCxiZXJsaW4yLXNvYy1waW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tYXJ2ZWxsLGJlcmxpbjItc29jLXBpbmN0
cmwueWFtbAo+IGluZGV4IDZhY2UzYmY1NDMzYmQuLmZiNjBhMzEwYTI0ZTYgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWFydmVsbCxiZXJs
aW4yLXNvYy1waW5jdHJsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9tYXJ2ZWxsLGJlcmxpbjItc29jLXBpbmN0cmwueWFtbApbIC4uLiBdCj4g
QEAgLTQ0LDggKzQ2LDEwIEBAIHByb3BlcnRpZXM6Cj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOgo+
ICAgIGRlc2NyaXB0aW9uOiBQaW4gZ3JvdXAgY29uZmlndXJhdGlvbiBzdWJub2Rlcy4KPiAgICB0
eXBlOiBvYmplY3QKPiAtICAkcmVmOiAvc2NoZW1hcy9waW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwj
Cj4gLSAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICsgIGFsbE9mOgo+ICsgICAg
LSAkcmVmOiAvc2NoZW1hcy9waW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwjCj4gKyAgICAtICRyZWY6
IC9zY2hlbWFzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbCMKCltTZXZlcml0eTogTWVkaXVtXQpE
b2VzIHRoaXMgY2hhbmdlIHVuaW50ZW50aW9uYWxseSByZWxheCB0aGUgc2NoZW1hIGZvciBhbGwg
b2xkZXIgU29Dcz8KCkJ5IHVuaXZlcnNhbGx5IGFkZGluZyB0aGUgcmVmZXJlbmNlIHRvIHBpbmNm
Zy1ub2RlLnlhbWwgaGVyZSwgZ2VuZXJpYyBwaW5jb25mCnByb3BlcnRpZXMgKGxpa2UgZHJpdmUt
c3RyZW5ndGggb3IgYmlhcy1wdWxsLXVwKSBpbiBwaW4gY29uZmlndXJhdGlvbiBzdWJub2Rlcwp3
aWxsIG5vdyBzaWxlbnRseSBwYXNzIHZhbGlkYXRpb24gZm9yIGFsbCBleGlzdGluZyBTb0NzIChz
dWNoIGFzCm1hcnZlbGwsYmVybGluMi1zb2MtcGluY3RybCkuIFRoZXNlIHdlcmUgcHJldmlvdXNs
eSBleHBsaWNpdGx5IHJlamVjdGVkIGJ5CnRoZSByZW1vdmVkIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZSBkZWNsYXJhdGlvbi4KClNpbmNlIHRoZSBjb21taXQgbWVzc2FnZSBzdHJpY3RseSBz
dGF0ZXMgaXQgb25seSBhaW1zIHRvIHN1cHBvcnQgU3luYXB0aWNzClNMMjYxWCBTb0NzLCBzaG91
bGQgdGhpcyBzY2hlbWEgcmVsYXhhdGlvbiBiZSByZXN0cmljdGVkIHRvIGp1c3QgdGhlIG5ld2x5
CmFkZGVkIHZhcmlhbnRzPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkyOTA2MTQxNy4yMDczMy0xLWpzemhhbmdAa2VybmVsLm9y
Zz9wYXJ0PTEzCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWkzYwo=
