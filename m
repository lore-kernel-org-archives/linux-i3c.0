Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578AAC636CA
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC8B601FE
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC8B601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RJkCsg3x10anasF3/cOVUA3jS6l1gZVPGujOCDpRTk=; b=zrwbLiJY4GT5Mw
	1kCLvoXXs2MCDnNkteEGfwBIoEY3c4manhpJebLRUfd1ruqbw4855lz8Cb7RZxNIIw47iGIm/NT9c
	2VPCI4Hqs4LnSlSAzK8KS3bnXzFLRAXMOGsq6U5Aws4w9uxPXPSSLR44hqD6fcLKyvdiWfKqq7Gqs
	TUvLLErTktUAs7zfJOQ/zE7ZsKDiWkiBi8TFOxRcpz3jkAWzeduYQBIytSK1dZxgoLDhN+t+1pL+m
	LUn95Qwvj/AGd1yXjIXKCq5i4wmLkvvJGxDpcdbsWjgr/36pnmQqCSG1OZwGrreAQoG5/dmV8YXQg
	oqZJHZ7jbJG007+vJjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AGc-002ZyC-Dd; Thu, 15 Jul 2021 22:55:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ADA-002Ywd-Ke
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 22:52:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7C2E51C0002;
 Thu, 15 Jul 2021 22:52:06 +0000 (UTC)
Date: Fri, 16 Jul 2021 00:52:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 vitor.soares@synopsys.com, boris.brezillon@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] i3c: master: svc: fix atomic issue
Message-ID: <20210716005205.5e218d47@xps13>
In-Reply-To: <20210715082413.3042149-3-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
 <20210715082413.3042149-3-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155208_876247_CB3B0B42 
X-CRM114-Status: GOOD (  15.74  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIFRo
dSwgMTUgSnVsIDIwMjEgMTY6MjQ6MTEKKzA4MDA6Cgo+IGRvX2RhYV9sb2NrZWQoKSBmdW5jdGlv
biBpcyBpbiBhIHNwaW4gbG9jayBlbnZpcm9ubWVudCwgdXNlCj4gcmVhZGxfcG9sbF90aW1lb3V0
X2F0b21pYygpIHRvIHJlcGxhY2UgdGhlIG9yaWdpbgo+IHJlYWRsX3BvbGxfdGltZW91dCgpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggYzI1YTM3MmY2ODIwLi45ZDgwNDM1NjM4
ZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiAr
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IEBAIC02NTYsNyArNjU2
LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9yZWFkYihzdHJ1Y3Qgc3ZjX2kzY19tYXN0
ZXIgKm1hc3RlciwgdTggKmRzdCwKPiAgCXUzMiByZWc7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8
IGxlbjsgaSsrKSB7Cj4gLQkJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0KG1hc3Rlci0+cmVncyAr
IFNWQ19JM0NfTVNUQVRVUywgcmVnLAo+ICsJCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9hdG9t
aWMobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCByZWcsCj4gIAkJCQkJIFNWQ19JM0Nf
TVNUQVRVU19SWFBFTkQocmVnKSwgMCwgMTAwMCk7CgpZb3UgZm9yZ290IHRvIGFsaWduIHRoZSBw
YXJhbWV0ZXJzIG9mIHRoZSBmdW5jdGlvbiBoZXJlIGFuZCBiZWxvdy4KCk90aGVyd2lzZSwKClJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAg
CQlpZiAocmV0KQo+ICAJCQlyZXR1cm4gcmV0Owo+IEBAIC02ODcsNyArNjg3LDcgQEAgc3RhdGlj
IGludCBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKHN0cnVjdCBzdmNfaTNjX21hc3RlciAq
bWFzdGVyLAo+ICAJCSAqIEVpdGhlciBvbmUgc2xhdmUgd2lsbCBzZW5kIGl0cyBJRCwgb3IgdGhl
IGFzc2lnbm1lbnQgcHJvY2Vzcwo+ICAJCSAqIGlzIGRvbmUuCj4gIAkJICovCj4gLQkJcmV0ID0g
cmVhZGxfcG9sbF90aW1lb3V0KG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUywgcmVnLAo+
ICsJCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMobWFzdGVyLT5yZWdzICsgU1ZDX0kz
Q19NU1RBVFVTLCByZWcsCj4gIAkJCQkJIFNWQ19JM0NfTVNUQVRVU19SWFBFTkQocmVnKSB8Cj4g
IAkJCQkJIFNWQ19JM0NfTVNUQVRVU19NQ1RSTERPTkUocmVnKSwKPiAgCQkJCQkgMSwgMTAwMCk7
Cj4gQEAgLTc0NCw3ICs3NDQsNyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2RvX2RhYV9s
b2NrZWQoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAkJfQo+ICAKPiAgCQkvKiBX
YWl0IGZvciB0aGUgc2xhdmUgdG8gYmUgcmVhZHkgdG8gcmVjZWl2ZSBpdHMgYWRkcmVzcyAqLwo+
IC0JCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFU
VVMsIHJlZywKPiArCQlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKG1hc3Rlci0+cmVn
cyArIFNWQ19JM0NfTVNUQVRVUywgcmVnLAo+ICAJCQkJCSBTVkNfSTNDX01TVEFUVVNfTUNUUkxE
T05FKHJlZykgJiYKPiAgCQkJCQkgU1ZDX0kzQ19NU1RBVFVTX1NUQVRFX0RBQShyZWcpICYmCj4g
IAkJCQkJIFNWQ19JM0NfTVNUQVRVU19CRVRXRUVOKHJlZyksCgoKCgpUaGFua3MsCk1pcXXDqGwK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
