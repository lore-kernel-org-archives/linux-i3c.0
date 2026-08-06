Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA364C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKxDfS8OQv0ThNmd80uEz4S1Jcmm8+IxMPc2IvMni0U=; b=FwGuAcmjv/uaIY
	MYEV8zAqGgGERwU6x9IBNafUp+NQeRqD8xAgzGSsDfcuQDhW+QGT3FRxEhX6qjlmuJ6P35ZAzoNLC
	DkE859AyVQpfTjvaZNJH5Y9D+fGXsw/3A4Zr2EqV0Xm0Y0zT4sZ5tv7dD7wAZcoOE7hlNgJhmXRov
	iQYwE0O4SUi08KXn8pWwpSpuFOnB5dSKUFEzGdf4b7l6g4tD/uDvbLNiWod4jb3r7unuWCGaVi/I3
	k52Gt8sWV1+y8WyzXNVltCGtEXBoA4zNxdLtstRcIHJKAsfVWWM1+Jgxebz2agXMb3opxeFHhxBBT
	2BK31haHe/Ug6XAlpk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJp-00000005vXM-2VC6;
	Thu, 06 Aug 2026 13:39:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJp-00000005vX6-0Dv5
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:39:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEBE941B1F;
	Thu,  6 Aug 2026 13:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539991F000E9;
	Thu,  6 Aug 2026 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023572;
	bh=wGbhhGFrjqmZSXkk04sJ9K3Q3HPSKlAOcxLLxPdoxg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=erl+O9OUarCOrmqrCXkzzrZPVBHLZcOvWQnxd7Tg45T8VIocIiuT1Pt6jutCYONrq
	 dcSC2sdEqg6JyfJUdqt5sJEXOzBfekEg2MqWAQCyKmh/XC6cqzQt5OwkuX50Fd6vZT
	 jwsQ9FtacQSeWHnE3ssI/uYPj1h6l6LrlDDhqq0K7XBgKTTE10pYGBjIVzII3EmtVZ
	 40AmncprVkHpoZhfJdDkG97h2Ypp0HuyyfqtcNa/3i6Jam0icb7/cjhprp/pXJDFFu
	 eJTW6ABoOlHDdqV7qVZtGl4087890mwY7siKrKED/Gd75FS0KrXo3krwcrm26tNZ+p
	 +dSYV7ZOQALUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 04/14] i3c: master: Fix use-after-free of
 master->this
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260806131857.119830-5-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-5-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:39:31 +0000
Message-Id: <20260806133932.539991F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBEZWxheWVkIGRldmljZSByZWxlYXNlIHRyaWdnZXJzIFVzZS1BZnRlci1GcmVlIG9m
IGRldm0tYWxsb2NhdGVkIG1hc3RlciBzdHJ1Y3R1cmUuCi0gW0hpZ2hdIElmIGBpZHJfYWxsb2Mo
KWAgZmFpbHMgaW4gYGkzY19idXNfaW5pdCgpYCwgdGhlIGVycm9yIHBhdGggd2lsbCBlcnJvbmVv
dXNseSByZW1vdmUgSUQgMCBmcm9tIGBpM2NfYnVzX2lkcmAsIGNvcnJ1cHRpbmcgdGhlIHN0YXRl
IG9mIGFub3RoZXIgc3VjY2Vzc2Z1bGx5IHJlZ2lzdGVyZWQgSTNDIG1hc3Rlci4KLS0KCi0tLSBQ
YXRjaCBbNF06IFtQQVRDSCBWNCAwNC8xNF0gaTNjOiBtYXN0ZXI6IEZpeCB1c2UtYWZ0ZXItZnJl
ZSBvZiBtYXN0ZXItPnRoaXMgLS0tCmNvbW1pdCAzMjdlNWRkMTdjMTA4NTY0MTIxZmI3ODhkNzlm
ZTFlZDdhMzJhMmI0CkF1dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5j
b20+CgppM2M6IG1hc3RlcjogRml4IHVzZS1hZnRlci1mcmVlIG9mIG1hc3Rlci0+dGhpcwoKVGhp
cyBjb21taXQgYWltcyB0byBmaXggYSB1c2UtYWZ0ZXItZnJlZSBieSBrZWVwaW5nIG1hc3Rlci0+
dGhpcyBhbGl2ZSB1bnRpbAppM2NfbWFzdGVyZGV2X3JlbGVhc2UoKSBpcyBjYWxsZWQuIEl0IG1v
dmVzIHRoZSBmcmVlaW5nIG9mIG1hc3Rlci0+dGhpcyBvdXQKb2YgdGhlIG5vcm1hbCBkZXZpY2Ug
ZGV0YWNoIHBhdGguCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gaW5kZXggYWJiNTgyNjQ1YTJlZC4uMjM1Nzg3NGJiOWQ2YSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCj4gQEAgLTg0Miw2ICs4NDIsMTEgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmkzY19t
YXN0ZXJkZXZfYXR0cnNbXSA9IHsKPiAgfTsKPiAgQVRUUklCVVRFX0dST1VQUyhpM2NfbWFzdGVy
ZGV2KTsKPiAgCj4gK3N0YXRpYyB2b2lkIGkzY19tYXN0ZXJfZnJlZV9pM2NfZGV2KHN0cnVjdCBp
M2NfZGV2X2Rlc2MgKmRldikKPiArewo+ICsJa2ZyZWUoZGV2KTsKPiArfQo+ICsKPiAgc3RhdGlj
IHZvaWQgaTNjX21hc3RlcmRldl9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJ
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kzY21hc3Rlcihk
ZXYpOwo+IEBAIC04NTQsNiArODU5LDggQEAgc3RhdGljIHZvaWQgaTNjX21hc3RlcmRldl9yZWxl
YXNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWkzY19idXNfY2xlYW51cChidXMpOwoKW1NldmVy
aXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgY2FuIHRoaXMgdW5j
b25kaXRpb25hbCBjYWxsIHRvCmkzY19idXNfY2xlYW51cCgpIGNvcnJ1cHQgdGhlIElEIHBvb2wg
aWYgaWRyX2FsbG9jKCkgZmFpbHMgZHVyaW5nIHByb2JlPwoKSWYgaWRyX2FsbG9jKCkgZmFpbHMg
aW4gaTNjX2J1c19pbml0KCksIHRoZSBlcnJvciBwYXRoIGluCmkzY19tYXN0ZXJfcmVnaXN0ZXIo
KSB3aWxsIGNhbGwgcHV0X2RldmljZSgmbWFzdGVyLT5kZXYpLCB3aGljaCBsZWFkcyB0byB0aGlz
CnJlbGVhc2UgZnVuY3Rpb24uCgpCZWNhdXNlIHRoZSBidXMgSUQgd2FzIG5vdCBhc3NpZ25lZCBv
biBmYWlsdXJlLCBpM2NidXMtPmlkIHJlbWFpbnMgYXQgaXRzCmRlZmF1bHQgdmFsdWUgb2YgMC4g
Q2FsbGluZyBpM2NfYnVzX2NsZWFudXAoKSB3aWxsIHRoZW4gdW5jb25kaXRpb25hbGx5IGNhbGwK
aWRyX3JlbW92ZSgmaTNjX2J1c19pZHIsIDApLCByZW1vdmluZyBJRCAwIHdoaWNoIG1pZ2h0IGN1
cnJlbnRseSBiZSBpbiB1c2UKYnkgYW5vdGhlciBzdWNjZXNzZnVsbHkgcmVnaXN0ZXJlZCBJM0Mg
bWFzdGVyLgoKPiAgCWZ3bm9kZV9oYW5kbGVfcHV0KGRldi0+Zndub2RlKTsKPiArCj4gKwlpM2Nf
bWFzdGVyX2ZyZWVfaTNjX2RldihtYXN0ZXItPnRoaXMpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlz
IGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgYWNjZXNzaW5n
IG1hc3Rlci0+dGhpcwpoZXJlIHJpc2sgYSB1c2UtYWZ0ZXItZnJlZSBpZiB0aGUgbWFzdGVyIHN0
cnVjdHVyZSB3YXMgYWxsb2NhdGVkIHdpdGgKZGV2cmVzPwoKTWFueSBJM0MgbWFzdGVyIGRyaXZl
cnMgYWxsb2NhdGUgdGhlaXIgY29udHJvbGxlciBzdHJ1Y3R1cmVzIHVzaW5nCmRldm1fa3phbGxv
YygpIGFuZCB0aWUgdGhlIG1lbW9yeSBsaWZldGltZSB0byB0aGUgcGxhdGZvcm0gZGV2aWNlLiBJ
ZiBhCnVzZXJzcGFjZSBwcm9jZXNzIGhvbGRzIGEgc3lzZnMgYXR0cmlidXRlIG9wZW4gZm9yIHRo
ZSBtYXN0ZXIgZGV2aWNlLCB0aGUKa29iamVjdCByZWZjb3VudCByZW1haW5zIGVsZXZhdGVkLgoK
V2hlbiB0aGUgbWFzdGVyIGRldmljZSBpcyB1bmJvdW5kIChmb3IgZXhhbXBsZSwgaWYgdGhlIG1v
ZHVsZSBpcyB1bmxvYWRlZCksCmRldnJlcyB3aWxsIGZyZWUgdGhlIG1hc3RlciBzdHJ1Y3R1cmUg
YmVmb3JlIHRoZSBmaW5hbCBrb2JqZWN0IHJlZmVyZW5jZSBpcwpkcm9wcGVkLiBXaGVuIHRoZSBz
eXNmcyBmaWxlIGlzIGV2ZW50dWFsbHkgY2xvc2VkLCB0aGlzIHJlbGVhc2UgY2FsbGJhY2sKd2ls
bCBleGVjdXRlLCBidXQgdGhlIG1hc3RlciBzdHJ1Y3R1cmUgaXQgZGVyZWZlcmVuY2VzIChmb3Ig
bWFzdGVyLT50aGlzIGFuZAptYXN0ZXItPndxKSB3aWxsIGhhdmUgYWxyZWFkeSBiZWVuIGZyZWVk
LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDgwNjEzMTg1Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTQK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
